#include "AbstractSyntaxTree.hpp"

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Value.h>

#include <exception>

#include "CodeGenerator.hpp"
#include "Utils.hpp"

namespace AST {

// Grammar Root
llvm::Value* Program::genCode(CodeGenerator& generator) {
  for (Decl* decl : *decls_) {
    if (decl != nullptr) {
      decl->genCode(generator);
    }
  }
  return nullptr;
}

// Declarations

llvm::Value* FuncDecl::genCode(CodeGenerator& generator) {
  std::vector<llvm::Type*> paramTypes;
  bool hasVoidParamType = false;
  for (Param* param : *paramList_) {
    llvm::Type* type = param->varType_->getType(generator);
    if (type == nullptr) {
      throw std::logic_error("Define function " + funcName_ +
                             " with known type!");
    }

    if (type->isVoidTy()) {
      hasVoidParamType = true;
    }

    // When argument type is array type, only pointer is passed, size attribute
    // disappears.
    if (type->isArrayTy()) {
      type = type->getArrayElementType()->getPointerTo();
    }

    paramTypes.push_back(type);
  }

  // Only funcName(void) is allowed.
  if (paramTypes.size() >= 2 && hasVoidParamType) {
    throw std::logic_error("Function " + funcName_ +
                           " has invalid void param!");
  }

  // funcName(void) is funcName(), no parameter.
  if (paramTypes.size() == 1 && hasVoidParamType) {
    paramTypes.clear();
  }

  llvm::Type* retType = retType_->getType(generator);
  if (retType->isArrayTy()) {
    throw std::logic_error("Function " + funcName_ +
                           " should not return array type!");
  }

  llvm::FunctionType* funcType =
      llvm::FunctionType::get(retType, paramTypes, paramList_->isVariant_);
  llvm::Function* func =
      llvm::Function::Create(funcType, llvm::GlobalValue::ExternalLinkage,
                             funcName_, generator.module_);
  generator.addFunction(funcName_, func);

  // If there is already a declaration with the same function name.
  if (func->getName() != funcName_) {
    // Remove the function just made, use the exiting function.
    func->eraseFromParent();
    func = generator.module_->getFunction(funcName_);

    if (func->getFunctionType() != funcType) {
      throw std::logic_error("Redefine function " + funcName_ +
                             " with different params!");
    }

    // Function declaration conflict.
    // Previous function declaration must be declaration without function body.
    // Current function declaration must be definition with function body.
    if (!func->empty() || funcBody_ == nullptr) {
      throw std::logic_error("Function " + funcName_ +
                             " declarations conflict!");
    }
  }

  // Generate code if function body exists.
  if (funcBody_ != nullptr) {
    // Create and insert the entry block.
    llvm::BasicBlock* funcBlock =
        llvm::BasicBlock::Create(g_context, "entry", func);
    g_builder.SetInsertPoint(funcBlock);

    // Allocate symbol table for function parameters.
    generator.pushSymbolTable();

    size_t index = 0;
    for (auto paramIter = func->arg_begin(); paramIter < func->arg_end();
         ++paramIter, ++index) {
      // alloca on stack for parameter.
      llvm::AllocaInst* allocaInst = Utils::createEntryBlockAlloca(
          func, paramList_->at(index)->varName_, paramTypes[index]);
      g_builder.CreateStore(paramIter, allocaInst);
      // Add parameter to symbol table.
      generator.addVariable(paramList_->at(index)->varName_, allocaInst);
    }

    // Generate code of the function body.
    generator.enterFunction(func);
    generator.pushSymbolTable();
    funcBody_->genCode(generator);
    generator.popSymbolTable();
    generator.leaveFunction();
    generator.popSymbolTable();
  }

  return nullptr;
}

llvm::Value* FuncBody::genCode(CodeGenerator& generator) {
  // Generate the statements one by one in FuncBody.
  for (AST::Stmt* stmt : *content_) {
    // If current block already has a terminator instruction, such as "return",
    // stop generating.
    if (g_builder.GetInsertBlock()->getTerminator() != nullptr) {
      break;
    } else {
      stmt->genCode(generator);
    }
  }

  // If the function does not have a "return" at the end of its body, create a
  // default one.
  if (g_builder.GetInsertBlock()->getTerminator() == nullptr) {
    llvm::Type* retType = generator.getCurrentFunction()->getReturnType();
    if (retType->isVoidTy()) {
      g_builder.CreateRetVoid();
    } else {
      g_builder.CreateRet(llvm::UndefValue::get(retType));
    }
  }

  return nullptr;
}

llvm::Value* VarDecl::genCode(CodeGenerator& generator) {
  llvm::Type* varType = varType_->getType(generator);
  if (varType == nullptr) {
    throw std::logic_error("Define variable with unknown type!");
  }
  if (varType->isVoidTy()) {
    throw std::logic_error("It is not allowed to define void variable!");
  }

  // Create variables one by one.
  for (VarInit* var : *varList_) {
    if (generator.getCurrentFunction() != nullptr) {
      // The declaration is inside a function, create an alloca.
      llvm::AllocaInst* allocaInst = Utils::createEntryBlockAlloca(
          generator.getCurrentFunction(), var->varName_, varType);
      if (!generator.addVariable(var->varName_, allocaInst)) {
        allocaInst->eraseFromParent();
        allocaInst = nullptr;
        throw std::logic_error(
            "It is not allowed to redefine the same local variable " +
            var->varName_ + " in the same scope!");
      }

      // Assign variable by "store" instruction if variable is with initial
      // value.
      if (var->initialExpr_ != nullptr) {
        llvm::Value* initializer =
            Utils::typeCast(var->initialExpr_->genCode(generator), varType);
        if (initializer == nullptr) {
          allocaInst->eraseFromParent();
          allocaInst = nullptr;
          throw std::logic_error("It failed to init variable " + var->varName_ +
                                 " with value of different type!");
        }
        g_builder.CreateStore(initializer, allocaInst);
      }
    } else {
      // The declaration is NOT inside a function, create a global variable.
      llvm::Constant* initializer = nullptr;
      if (var->initialExpr_ != nullptr) {
        generator.switchInsertPointToGlobalBlock();
        llvm::Value* initialExpr =
            Utils::typeCast(var->initialExpr_->genCode(generator), varType);
        if (initialExpr == nullptr) {
          throw std::logic_error("It failed to init variable " + var->varName_ +
                                 " with value of different type!");
        }

        generator.switchInsertPointToCurrentBlock();
        initializer = (llvm::Constant*)initialExpr;
      } else {
        // Create an undef value for global variable if no initializer is given.
        // The global value will be recognized as "extern" by LLVM.
        initializer = llvm::UndefValue::get(varType);
      }

      // Create a global variable.
      llvm::GlobalVariable* globalVar = new llvm::GlobalVariable(
          *generator.module_, varType, varType_->isConst_,
          llvm::Function::ExternalLinkage, initializer, var->varName_);
      if (!generator.addVariable(var->varName_, globalVar)) {
        throw std::logic_error(
            "It is not allowed to redefine global variable " + var->varName_);
      }
    }
  }

  return nullptr;
}

llvm::Value* TypeDecl::genCode(CodeGenerator& generator) {
  llvm::Type* type;
  if (varType_->isStructType()) {
    type = ((StructType*)varType_)->genTypeHead(generator, varType_->typeName_);
  } else if (varType_->isUnionType()) {
    type = ((UnionType*)varType_)->genTypeHead(generator, varType_->typeName_);
  } else {
    type = varType_->getType(generator);
  }

  if (type == nullptr) {
    throw std::logic_error("Failed to define type " + varType_->typeName_);
  }

  if (!generator.addType(varType_->typeName_, type)) {
    throw std::logic_error("It is not allowed to redefine type " +
                           varType_->typeName_);
  }

  if (varType_->isStructType()) {
    ((StructType*)varType_)->genTypeBody(generator);
  } else if (varType_->isUnionType()) {
    ((UnionType*)varType_)->genTypeBody(generator);
  }

  return nullptr;
}

// Variable Types

llvm::Type* BuiltinType::getType(CodeGenerator& generator) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  switch (typeId_) {
    case TypeId::CHAR:
    case TypeId::UCHAR:
      llvmType_ = g_builder.getInt8Ty();
      break;
    case TypeId::SHORT:
    case TypeId::USHORT:
      llvmType_ = g_builder.getInt16Ty();
      break;
    case TypeId::INT:
    case TypeId::UINT:
      llvmType_ = g_builder.getInt32Ty();
      break;
    case TypeId::LONG:
    case TypeId::ULONG:
      llvmType_ = g_builder.getInt64Ty();
      break;
    case TypeId::FLOAT:
      llvmType_ = g_builder.getFloatTy();
      break;
    case TypeId::DOUBLE:
      llvmType_ = g_builder.getDoubleTy();
      break;
    case TypeId::BOOL:
      llvmType_ = g_builder.getInt1Ty();
      break;
    case TypeId::VOID:
      llvmType_ = g_builder.getVoidTy();
      break;
    default:
      llvmType_ = nullptr;
      break;
  }

  return llvmType_;
}

llvm::Type* PointerType::getType(CodeGenerator& generator) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  llvm::Type* baseType = baseType_->getType(generator);
  llvmType_ = llvm::PointerType::get(baseType, 0);
  return llvmType_;
}

llvm::Type* ArrayType::getType(CodeGenerator& generator) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  llvm::Type* baseType = baseType_->getType(generator);
  if (baseType->isVoidTy()) {
    throw std::logic_error("Array of void is not allowed!");
  }
  llvmType_ = llvm::ArrayType::get(baseType, length_);
  return llvmType_;
}

llvm::Type* DefinedType::getType(CodeGenerator& generator) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  llvmType_ = generator.findType(typeName_);
  if (llvmType_ == nullptr) {
    throw std::logic_error(typeName_ + " is undefined!");
  }
  return llvmType_;
}

llvm::Type* StructType::getType(CodeGenerator& generator) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  // Generate anonymous named struct type.
  genTypeHead(generator);
  return genTypeBody(generator);
}

llvm::Type* StructType::genTypeHead(CodeGenerator& generator,
                                    const std::string& typeName) {
  llvm::StructType* type =
      llvm::StructType::create(g_context, "struct." + typeName);
  // Add to struct type table, it is useful for struct ref/deref in future.
  generator.addStructType(type, this);
  llvmType_ = type;
  return llvmType_;
}

llvm::Type* StructType::genTypeBody(CodeGenerator& generator) {
  std::vector<llvm::Type*> members;
  for (FieldDecl* field : *structBody_) {
    if (field->varType_->getType(generator)->isVoidTy()) {
      throw std::logic_error("Struct member type cannot be void!");
    } else {
      members.insert(members.end(), field->memberList_->size(),
                     field->varType_->getType(generator));
    }
  }

  ((llvm::StructType*)llvmType_)->setBody(members);
  return llvmType_;
}

size_t StructType::getMemberIndex(const std::string& memberName) {
  size_t index = 0;
  for (FieldDecl* decl : *structBody_) {
    for (std::string& name : *decl->memberList_) {
      if (memberName == name) {
        return index;
      }

      ++index;
    }
  }

  return -1;
}

llvm::Type* UnionType::getType(CodeGenerator& generator) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  // Generate anonymous named union type.
  genTypeHead(generator);
  return genTypeBody(generator);
}

llvm::Type* UnionType::genTypeHead(CodeGenerator& generator,
                                   const std::string& typeName) {
  llvm::StructType* type =
      llvm::StructType::create(g_context, "union." + typeName);
  // Add to union type table, it is useful for union ref/deref in future.
  generator.addUnionType(type, this);
  llvmType_ = type;
  return llvmType_;
}

llvm::Type* UnionType::genTypeBody(CodeGenerator& generator) {
  if (unionBody_->size() == 0) {
    return llvmType_;
  }

  // Find the max size member.
  size_t maxSize = 0;
  llvm::Type* maxSizeMemberType = nullptr;
  for (FieldDecl* member : *unionBody_) {
    if (member->varType_->getType(generator)->isVoidTy()) {
      throw std::logic_error("Union member type cannot be void!");
    } else if (generator.getTypeSize(member->varType_->getType(generator)) >
               maxSize) {
      maxSizeMemberType = member->varType_->getType(generator);
      maxSize = generator.getTypeSize(maxSizeMemberType);
    }
  }

  ((llvm::StructType*)llvmType_)
      ->setBody(std::vector<llvm::Type*>({maxSizeMemberType}));
  return llvmType_;
}

llvm::Type* UnionType::getMemberType(const std::string& memberName,
                                     CodeGenerator& generator) {
  for (FieldDecl* member : *unionBody_) {
    for (const std::string& name : *member->memberList_) {
      if (name == memberName) {
        return member->varType_->getType(generator);
      }
    }
  }

  return nullptr;
}

llvm::Type* EnumType::getType(CodeGenerator& generator) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  // Calc value for every member.
  int lastDefValue = -1;
  for (Enum* member : *enumList_) {
    if (member->hasValue_) {
      lastDefValue = member->value_;
    } else {
      member->value_ = ++lastDefValue;
    }
  }

  for (Enum* member : *enumList_) {
    if (!generator.addConstant(member->name_,
                               g_builder.getInt32(member->value_))) {
      throw std::logic_error("It is not allowed to redefine enum member " +
                             member->name_);
    }
  }

  return llvm::IntegerType::getInt32Ty(g_context);
}

// Statements

llvm::Value* IfStmt::genCode(CodeGenerator& generator) {
  llvm::Value* condition = condition_->genCode(generator);
  condition = Utils::castToBool(condition);
  if (condition == nullptr) {
    throw std::logic_error(
        "IfStmt condition must be either int, or float, or pointer.");
  }

  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* thenBlock = llvm::BasicBlock::Create(g_context, "then");
  llvm::BasicBlock* elseBlock = llvm::BasicBlock::Create(g_context, "else");
  llvm::BasicBlock* endBlock = llvm::BasicBlock::Create(g_context, "if.end");

  // Generate code in "then" block.
  g_builder.CreateCondBr(condition, thenBlock, elseBlock);
  func->getBasicBlockList().push_back(thenBlock);
  g_builder.SetInsertPoint(thenBlock);
  if (thenStmt_ != nullptr) {
    generator.pushSymbolTable();
    thenStmt_->genCode(generator);
    generator.popSymbolTable();
  }
  Utils::terminateBlockByBr(endBlock);

  // Generate code in "else" block.
  func->getBasicBlockList().push_back(elseBlock);
  g_builder.SetInsertPoint(elseBlock);
  if (elseStmt_ != nullptr) {
    generator.pushSymbolTable();
    elseStmt_->genCode(generator);
    generator.popSymbolTable();
  }
  Utils::terminateBlockByBr(endBlock);

  // Set point for end block.
  if (endBlock->hasNPredecessorsOrMore(1)) {
    func->getBasicBlockList().push_back(endBlock);
    g_builder.SetInsertPoint(endBlock);
  }

  return nullptr;
}

llvm::Value* SwitchStmt::genCode(CodeGenerator& generator) {
  llvm::Function* func = generator.getCurrentFunction();
  llvm::Value* matcher = matcher_->genCode(generator);

  // Create one block for each case statement.
  std::vector<llvm::BasicBlock*> caseBlocks;
  for (size_t i = 0; i < caseStmtList_->size(); ++i) {
    caseBlocks.push_back(
        llvm::BasicBlock::Create(g_context, "case." + std::to_string(i)));
  }

  // Create one block after switch statement.
  caseBlocks.push_back(llvm::BasicBlock::Create(g_context, "switch.end"));

  // Create one block for each comparision.
  std::vector<llvm::BasicBlock*> comparisionBlocks;
  // The first comparision code should be in current insertion block.
  comparisionBlocks.push_back(g_builder.GetInsertBlock());
  // Add block for switch expression evaluation.
  for (size_t i = 0; i < caseStmtList_->size(); ++i) {
    comparisionBlocks.push_back(llvm::BasicBlock::Create(
        g_context, "switch.compare." + std::to_string(i)));
  }

  // comparisionBlocks and caseBlocks hold the same block after switch
  // statement.
  comparisionBlocks.push_back(caseBlocks.back());

  // Generate branches for comparision and cases.
  for (size_t i = 0; i < caseStmtList_->size(); ++i) {
    if (i > 0) {
      // The first comparision is already in current insertion block.
      // So only set insertion block and insertion point since the second
      // comparision.
      func->getBasicBlockList().push_back(comparisionBlocks[i]);
      g_builder.SetInsertPoint(comparisionBlocks[i]);
    }

    if (caseStmtList_->at(i)->condition_ != nullptr) {
      g_builder.CreateCondBr(
          Utils::createCmpEq(
              matcher, caseStmtList_->at(i)->condition_->genCode(generator)),
          caseBlocks[i], comparisionBlocks[i + 1]);
    } else {
      // Unconditional branch for default statement.
      g_builder.CreateBr(caseBlocks[i]);
    }
  }

  // Generate code for each case statement.
  generator.pushSymbolTable();
  for (size_t i = 0; i < caseStmtList_->size(); ++i) {
    func->getBasicBlockList().push_back(caseBlocks[i]);
    g_builder.SetInsertPoint(caseBlocks[i]);

    // TODO: What behavior if continue in a case statement and the whole switch
    // statement is in an outer loop.
    generator.enterLoop(caseBlocks[i + 1], caseBlocks.back());
    caseStmtList_->at(i)->genCode(generator);
    generator.leaveLoop();
  }
  generator.popSymbolTable();

  // Handle the block after switch statement.
  if (caseBlocks.back()->hasNPredecessorsOrMore(1)) {
    func->getBasicBlockList().push_back(caseBlocks.back());
    g_builder.SetInsertPoint(caseBlocks.back());
  }

  return nullptr;
}

llvm::Value* CaseStmt::genCode(CodeGenerator& generator) {
  // Generate case statements one by one.
  for (Stmt* stmt : *content_) {
    if (g_builder.GetInsertBlock()->getTerminator()) {
      // Stop code generation if encounter a terminator, such as "break".
      break;
    } else if (stmt != nullptr) {
      stmt->genCode(generator);
    }
  }

  // No break, jump to the next case block.
  Utils::terminateBlockByBr(generator.getContinueBlock());
  return nullptr;
}

llvm::Value* ForStmt::genCode(CodeGenerator& generator) {
  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* conditionBlock =
      llvm::BasicBlock::Create(g_context, "for.cond");
  llvm::BasicBlock* updateBlock =
      llvm::BasicBlock::Create(g_context, "for.update");
  llvm::BasicBlock* endBlock = llvm::BasicBlock::Create(g_context, "for.end");
  llvm::BasicBlock* loopBlock = llvm::BasicBlock::Create(g_context, "for.loop");

  if (initial_ != nullptr) {
    generator.pushSymbolTable();
    initial_->genCode(generator);
  }

  // Create unconditional branch to condition block.
  Utils::terminateBlockByBr(conditionBlock);

  // Generate code for condition block.
  func->getBasicBlockList().push_back(conditionBlock);
  g_builder.SetInsertPoint(conditionBlock);
  if (condition_ != nullptr) {
    llvm::Value* condition = condition_->genCode(generator);
    condition = Utils::castToBool(condition);
    if (condition == nullptr) {
      throw std::logic_error(
          "ForStmt condition must be either int, or float, or pointer.");
    }

    g_builder.CreateCondBr(condition, loopBlock, endBlock);
  } else {
    g_builder.CreateBr(loopBlock);
  }

  // Generate code for the loop block.
  func->getBasicBlockList().push_back(loopBlock);
  g_builder.SetInsertPoint(loopBlock);
  if (loopBody_ != nullptr) {
    generator.enterLoop(updateBlock, endBlock);
    generator.pushSymbolTable();
    loopBody_->genCode(generator);
    generator.popSymbolTable();
    generator.leaveLoop();
  }

  // Jump to update block if no break.
  Utils::terminateBlockByBr(updateBlock);

  // Generate code for update block.
  func->getBasicBlockList().push_back(updateBlock);
  g_builder.SetInsertPoint(updateBlock);
  if (update_ != nullptr) {
    update_->genCode(generator);
  }

  // After update, jump to condition block.
  g_builder.CreateBr(conditionBlock);

  // Handle end block.
  func->getBasicBlockList().push_back(endBlock);
  g_builder.SetInsertPoint(endBlock);

  if (initial_ != nullptr) {
    generator.popSymbolTable();
  }

  return nullptr;
}

llvm::Value* DoStmt::genCode(CodeGenerator& generator) {
  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* conditionBlock =
      llvm::BasicBlock::Create(g_context, "do.cond");
  llvm::BasicBlock* loopBlock = llvm::BasicBlock::Create(g_context, "do.loop");
  llvm::BasicBlock* endBlock = llvm::BasicBlock::Create(g_context, "do.end");

  // Unconditional branch to loop block.
  g_builder.CreateBr(loopBlock);

  // Generate code for loop block.
  func->getBasicBlockList().push_back(loopBlock);
  g_builder.SetInsertPoint(loopBlock);
  if (loopBody_ != nullptr) {
    generator.enterLoop(conditionBlock, endBlock);
    generator.pushSymbolTable();
    loopBody_->genCode(generator);
    generator.popSymbolTable();
    generator.leaveLoop();
  }

  // Jump to condition block if no break.
  Utils::terminateBlockByBr(conditionBlock);

  // Generate code for condition block.
  func->getBasicBlockList().push_back(conditionBlock);
  g_builder.SetInsertPoint(conditionBlock);
  llvm::Value* condition = condition_->genCode(generator);
  condition = Utils::castToBool(condition);
  if (condition == nullptr) {
    throw std::logic_error(
        "DoStmt condition must be either int, or float, or pointer.");
  }

  g_builder.CreateCondBr(condition, loopBlock, endBlock);

  // Handle end block.
  func->getBasicBlockList().push_back(endBlock);
  g_builder.SetInsertPoint(endBlock);

  return nullptr;
}

llvm::Value* WhileStmt::genCode(CodeGenerator& generator) {
  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* conditionBlock =
      llvm::BasicBlock::Create(g_context, "while.cond");
  llvm::BasicBlock* loopBlock =
      llvm::BasicBlock::Create(g_context, "while.loop");
  llvm::BasicBlock* endBlock = llvm::BasicBlock::Create(g_context, "while.end");

  // Unconditional branch to condition block.
  g_builder.CreateBr(conditionBlock);

  func->getBasicBlockList().push_back(conditionBlock);
  g_builder.SetInsertPoint(conditionBlock);
  llvm::Value* condition = condition_->genCode(generator);
  condition = Utils::castToBool(condition);
  if (condition == nullptr) {
    throw std::logic_error(
        "WhileStmt condition must be either int, or float, or pointer.");
  }

  g_builder.CreateCondBr(condition, loopBlock, endBlock);

  // Generate code for loop block.
  func->getBasicBlockList().push_back(loopBlock);
  g_builder.SetInsertPoint(loopBlock);
  if (loopBody_ != nullptr) {
    generator.enterLoop(conditionBlock, endBlock);
    generator.pushSymbolTable();
    loopBody_->genCode(generator);
    generator.popSymbolTable();
    generator.leaveLoop();
  }

  // Jump to condition block if no break
  Utils::terminateBlockByBr(conditionBlock);

  // Handle end block.
  func->getBasicBlockList().push_back(endBlock);
  g_builder.SetInsertPoint(endBlock);

  return nullptr;
}

llvm::Value* ContinueStmt::genCode(CodeGenerator& generator) {
  llvm::BasicBlock* continueToBlock = generator.getContinueBlock();
  if (continueToBlock == nullptr) {
    throw std::logic_error("Continue must be in switch or loop!");
  }

  g_builder.CreateBr(continueToBlock);
  return nullptr;
}

llvm::Value* BreakStmt::genCode(CodeGenerator& generator) {
  llvm::BasicBlock* breakToBlock = generator.getBreakBlock();
  if (breakToBlock == nullptr) {
    throw std::logic_error("Break must be in switch or loop!");
  }

  g_builder.CreateBr(breakToBlock);
  return nullptr;
}

llvm::Value* ReturnStmt::genCode(CodeGenerator& generator) {
  llvm::Function* func = generator.getCurrentFunction();
  if (func == nullptr) {
    throw std::logic_error("Return should be in a function body!");
  }

  if (retVal_ != nullptr) {
    llvm::Value* retVal =
        Utils::typeCast(retVal_->genCode(generator), func->getReturnType());
    if (retVal == nullptr) {
      throw std::logic_error(
          "The type of return value does not match, and can not be casted to "
          "return type!");
    }
    g_builder.CreateRet(retVal);
  } else {
    if (func->getReturnType()->isVoidTy()) {
      g_builder.CreateRetVoid();
    } else {
      throw std::logic_error("Return value is expected, but not found!");
    }
  }

  return nullptr;
}

llvm::Value* Block::genCode(CodeGenerator& generator) {
  generator.pushSymbolTable();
  // Generate code for statements one by one in block.
  for (Stmt* stmt : *content_) {
    if (g_builder.GetInsertBlock()->getTerminator() != nullptr) {
      // Stop code generation if encounter a terminator, such as "break".
      break;
    } else if (stmt != nullptr) {
      stmt->genCode(generator);
    }
  }
  generator.popSymbolTable();
  return nullptr;
}

// Expressions

llvm::Value* Variable::genCode(CodeGenerator& generator) {
  llvm::Value* var = generator.findVariable(varName_);
  if (var != nullptr) {
    return Utils::createLoad(var, generator);
  }

  var = generator.findConstant(varName_);
  if (var != nullptr) {
    return var;
  }

  throw std::logic_error(varName_ + " is neither a variable nor a constant!");
  return nullptr;
}

llvm::Value* Variable::genCodePtr(CodeGenerator& generator) {
  llvm::Value* var = generator.findVariable(varName_);
  if (var != nullptr) {
    return var;
  }

  var = generator.findConstant(varName_);
  if (var != nullptr) {
    throw std::logic_error(varName_ + " is const, not left value!");
  }

  throw std::logic_error(varName_ + " is neither a variable nor a constant!");
  return nullptr;
}

llvm::Value* Constant::genCode(CodeGenerator& generator) {
  switch (typeId_) {
    case BuiltinType::TypeId::CHAR:
      return g_builder.getInt8(charValue_);
    case BuiltinType::TypeId::INT:
      return g_builder.getInt32(intValue_);
    case BuiltinType::TypeId::UINT: {
      llvm::IntegerType* int32Type = llvm::Type::getInt32Ty(g_context);
      llvm::ConstantInt* constInt =
          llvm::ConstantInt::get(int32Type, uintValue_);
      return constInt;
    }
    case BuiltinType::TypeId::LONG:
      return g_builder.getInt64(longValue_);
    case BuiltinType::TypeId::ULONG: {
      llvm::IntegerType* int64Type = llvm::Type::getInt64Ty(g_context);
      llvm::ConstantInt* constInt =
          llvm::ConstantInt::get(int64Type, ulongValue_);
      return constInt;
    }
    case BuiltinType::TypeId::FLOAT:
      return llvm::ConstantFP::get(g_builder.getFloatTy(), floatValue_);
    case BuiltinType::TypeId::DOUBLE:
      return llvm::ConstantFP::get(g_builder.getDoubleTy(), doubleValue_);
    case BuiltinType::TypeId::BOOL:
      return g_builder.getInt1(boolValue_);
    default:
      throw std::logic_error("const type " + std::to_string(typeId_) +
                             " is not supported!");
  }
}

llvm::Value* Constant::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("constant is not left value!");
}

llvm::Value* ConstStr::genCode(CodeGenerator& generator) {
  return g_builder.CreateGlobalStringPtr(str_.c_str());
}

llvm::Value* ConstStr::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Left value const string is not supported!");
}

llvm::Value* CommaExpr::genCode(CodeGenerator& generator) {
  lhs_->genCode(generator);
  return rhs_->genCode(generator);
}

llvm::Value* CommaExpr::genCodePtr(CodeGenerator& generator) {
  lhs_->genCode(generator);
  return rhs_->genCode(generator);
}

llvm::Value* FuncCall::genCode(CodeGenerator& generator) {
  llvm::Function* func = generator.findFunction(funcName_);
  if (func == nullptr) {
    throw std::domain_error("Function " + funcName_ + " is not defined!");
  }

  // Check number of arguments.
  if (func->isVarArg() && argList_->size() < func->arg_size() ||
      !func->isVarArg() && argList_->size() != func->arg_size()) {
    throw std::invalid_argument("Wrong argument number for function call!");
  }

  // Check types of arguments and collect valid arguments.
  std::vector<llvm::Value*> args;
  size_t index = 0;
  for (auto argIter = func->arg_begin(); argIter < func->arg_end();
       ++argIter, ++index) {
    llvm::Value* arg = argList_->at(index)->genCode(generator);
    arg = Utils::typeCast(arg, argIter->getType());
    if (arg == nullptr) {
      throw std::logic_error("Argument " + std::to_string(index) +
                             " does not match type to call function " +
                             funcName_);
    }

    args.push_back(arg);
  }

  // Continue to collect arguments if it is calling a variant function.
  if (func->isVarArg()) {
    for (; index < argList_->size(); ++index) {
      llvm::Value* arg = argList_->at(index)->genCode(generator);

      // Extend char/short/bool to int, float to double.
      if (arg->getType()->isIntegerTy()) {
        arg = Utils::typeUpgrade(arg, g_builder.getInt32Ty());
      } else if (arg->getType()->isFloatingPointTy()) {
        arg = Utils::typeUpgrade(arg, g_builder.getDoubleTy());
      }

      args.push_back(arg);
    }
  }

  // Create a function call.
  return g_builder.CreateCall(func, args);
}

llvm::Value* FuncCall::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Function call can not return left value!");
}

llvm::Value* StructRef::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* StructRef::genCodePtr(CodeGenerator& generator) {
  llvm::Value* structPtr = struct_->genCodePtr(generator);
  if (!structPtr->getType()->isPointerTy() ||
      !structPtr->getType()->getNonOpaquePointerElementType()->isStructTy()) {
    throw std::logic_error(
        "Struct ref operator \".\" must apply on struct or union!");
  }

  // Handle direct access of struct type.
  AST::StructType* structType =
      generator.findStructType((llvm::StructType*)structPtr->getType()
                                   ->getNonOpaquePointerElementType());
  if (structType != nullptr) {
    size_t memberIndex = structType->getMemberIndex(memberName_);
    if (memberIndex == -1) {
      throw std::logic_error("The struct does not have a member named " +
                             memberName_);
    }

    std::vector<llvm::Value*> indices;
    indices.push_back(g_builder.getInt32(0));
    indices.push_back(g_builder.getInt32(memberIndex));
    return g_builder.CreateGEP(
        structPtr->getType()->getNonOpaquePointerElementType(), structPtr,
        indices);
  }

  // Handle direct access of union type.
  AST::UnionType* unionType =
      generator.findUnionType((llvm::StructType*)structPtr->getType()
                                  ->getNonOpaquePointerElementType());
  if (unionType != nullptr) {
    llvm::Type* memberType = unionType->getMemberType(memberName_, generator);
    if (memberType == nullptr) {
      throw std::logic_error("The union does not have a member named " +
                             memberName_);
    }

    return g_builder.CreatePointerCast(structPtr, memberType->getPointerTo());
  }

  throw std::logic_error(
      "Can not direct access to a variable of unknown type!");
}

llvm::Value* StructDeref::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* StructDeref::genCodePtr(CodeGenerator& generator) {
  llvm::Value* structPtr = structPtr_->genCode(generator);
  if (!structPtr->getType()->isPointerTy() ||
      !structPtr->getType()->getNonOpaquePointerElementType()->isStructTy()) {
    throw std::logic_error(
        "Struct deref operator \"->\" is not applied on struct or union!");
  }

  // Handle direct access of struct type.
  AST::StructType* structType =
      generator.findStructType((llvm::StructType*)structPtr->getType()
                                   ->getNonOpaquePointerElementType());
  if (structType != nullptr) {
    size_t memberIndex = structType->getMemberIndex(memberName_);
    if (memberIndex == -1) {
      throw std::logic_error("The struct does not have a member named " +
                             memberName_);
    }

    std::vector<llvm::Value*> indices;
    indices.push_back(g_builder.getInt32(0));
    indices.push_back(g_builder.getInt32(memberIndex));
    return g_builder.CreateGEP(
        structPtr->getType()->getNonOpaquePointerElementType(), structPtr,
        indices);
  }

  // Handle direct access of union type.
  AST::UnionType* unionType =
      generator.findUnionType((llvm::StructType*)structPtr->getType()
                                  ->getNonOpaquePointerElementType());
  if (unionType != nullptr) {
    llvm::Type* memberType = unionType->getMemberType(memberName_, generator);
    if (memberType == nullptr) {
      throw std::logic_error("The union does not have a member named " +
                             memberName_);
    }

    return g_builder.CreatePointerCast(structPtr, memberType->getPointerTo());
  }

  throw std::logic_error(
      "Can not dereference a variable pointer of unknown type!");
}

llvm::Value* Subscript::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* Subscript::genCodePtr(CodeGenerator& generator) {
  llvm::Value* arrayPtr = array_->genCode(generator);
  if (!arrayPtr->getType()->isPointerTy()) {
    throw std::logic_error(
        "Subscript operator \"[]\" must be applied to pointer or array!");
  }

  llvm::Value* idx = index_->genCode(generator);
  if (!idx->getType()->isIntegerTy()) {
    throw std::logic_error("Subscription index should be integer!");
  }

  return Utils::createAdd(arrayPtr, idx, generator);
}

llvm::Value* TypeCast::genCode(CodeGenerator& generator) {
  llvm::Value* ret = Utils::typeCast(operand_->genCode(generator),
                                     varType_->getType(generator));
  if (ret == nullptr) {
    throw std::logic_error("Unable to type cast!");
  }
  return ret;
}

llvm::Value* TypeCast::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Type cast can not return left value!");
}

llvm::Value* SizeOf::genCode(CodeGenerator& generator) {
  if (varType_ != nullptr) {
    return g_builder.getInt64(
        generator.getTypeSize(varType_->getType(generator)));
  } else if (expr_ != nullptr) {
    return g_builder.getInt64(
        generator.getTypeSize(expr_->genCode(generator)->getType()));
  } else if (!identifier_.empty()) {
    llvm::Type* type = generator.findType(identifier_);
    if (type != nullptr) {
      varType_ = new DefinedType(identifier_);
      return g_builder.getInt64(generator.getTypeSize(type));
    }

    llvm::Value* var = generator.findVariable(identifier_);
    if (var != nullptr) {
      expr_ = new Variable(identifier_);
      return g_builder.getInt64(generator.getTypeSize(
          var->getType()->getNonOpaquePointerElementType()));
    }

    throw std::logic_error(identifier_ + " is neither a type nor a variable!");
  } else {
    throw std::invalid_argument("Invalid type or var in sizeof()!");
  }
}

llvm::Value* SizeOf::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("sizeof can not return left value!");
}

llvm::Value* UnaryPlus::genCode(CodeGenerator& generator) {
  llvm::Value* operand = operand_->genCode(generator);
  if (operand->getType()->isIntegerTy() ||
      operand->getType()->isFloatingPointTy()) {
    return operand;
  }

  throw std::logic_error(
      "Unary plus must be applied to variables of integer or floating point!");
}

llvm::Value* UnaryPlus::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Unary plus can not return left value!");
}

llvm::Value* UnaryMinus::genCode(CodeGenerator& generator) {
  llvm::Value* operand = operand_->genCode(generator);
  if (operand->getType()->isIntegerTy()) {
    return g_builder.CreateNeg(operand);
  } else if (operand->getType()->isFloatingPointTy()) {
    return g_builder.CreateFNeg(operand);
  } else {
    throw std::logic_error(
        "Unary minus must be applied to variables of integer or floating "
        "point!");
  }
}

llvm::Value* UnaryMinus::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Unary minus can not return left value!");
}

llvm::Value* PointerDeref::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* PointerDeref::genCodePtr(CodeGenerator& generator) {
  llvm::Value* ptr = operand_->genCode(generator);
  if (ptr->getType()->isPointerTy()) {
    return ptr;
  }

  throw std::logic_error(
      "PointerDeref operator \"*\" only applies on variables of pointer or "
      "array!");
}

llvm::Value* AddressOf::genCode(CodeGenerator& generator) {
  return operand_->genCodePtr(generator);
}

llvm::Value* AddressOf::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("AddressOf operator \"&\" can not return left value!");
}

llvm::Value* Assign::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* Assign::genCodePtr(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createAssign(lhs, rhs, generator);
}

llvm::Value* Add::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createAdd(lhs, rhs, generator);
}

llvm::Value* Add::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Add operator \"+\" can not return left value!");
}

llvm::Value* Sub::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createSub(lhs, rhs, generator);
}

llvm::Value* Sub::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Sub operator \"-\" can not return left value!");
}

llvm::Value* Mul::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createMul(lhs, rhs, generator);
}

llvm::Value* Mul::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Mul operator \"*\" can not return left value!");
}

llvm::Value* Div::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createDiv(lhs, rhs, generator);
}

llvm::Value* Div::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Div operator \"/\" can not return left value!");
}

llvm::Value* Mod::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createMod(lhs, rhs, generator);
}

llvm::Value* Mod::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Mod operator \"%\" can not return left value!");
}

llvm::Value* PostfixInc::genCode(CodeGenerator& generator) {
  llvm::Value* operand = operand_->genCodePtr(generator);
  llvm::Value* value = g_builder.CreateLoad(
      operand->getType()->getNonOpaquePointerElementType(), operand);
  if (value != nullptr && (value->getType()->isIntegerTy() ||
                           value->getType()->isFloatingPointTy() ||
                           value->getType()->isPointerTy())) {
    size_t valueBitWidth =
        ((llvm::IntegerType*)value->getType())->getBitWidth();
    llvm::Value* oneValue = Utils::getOneValue(valueBitWidth);
    llvm::Value* valuePlus = Utils::createAdd(value, oneValue, generator);
    g_builder.CreateStore(valuePlus, operand);
    return value;
  }

  throw std::logic_error(
      "Postfix inc operator \"++\" must applies to variables of type integer, "
      "floating point, or pointer!");
}

llvm::Value* PostfixInc::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error(
      "Postfix inc operator \"++\" can not return left value!");
}

llvm::Value* PostfixDec::genCode(CodeGenerator& generator) {
  llvm::Value* operand = operand_->genCodePtr(generator);
  llvm::Value* value = g_builder.CreateLoad(
      operand->getType()->getNonOpaquePointerElementType(), operand);
  if (value != nullptr && (value->getType()->isIntegerTy() ||
                           value->getType()->isFloatingPointTy() ||
                           value->getType()->isPointerTy())) {
    size_t valueBitWidth =
        ((llvm::IntegerType*)value->getType())->getBitWidth();
    llvm::Value* oneValue = Utils::getOneValue(valueBitWidth);
    llvm::Value* valueMinus = Utils::createSub(value, oneValue, generator);
    g_builder.CreateStore(valueMinus, operand);
    return value;
  }

  throw std::logic_error(
      "Postfix dec operator \"--\" must applies to variables of type integer, "
      "floating point, or pointer!");
}

llvm::Value* PostfixDec::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error(
      "Postfix dec operator \"--\" can not return left value!");
}

llvm::Value* PrefixInc::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* PrefixInc::genCodePtr(CodeGenerator& generator) {
  llvm::Value* operand = operand_->genCodePtr(generator);
  llvm::Value* value = g_builder.CreateLoad(
      operand->getType()->getNonOpaquePointerElementType(), operand);
  if (value != nullptr && (value->getType()->isIntegerTy() ||
                           value->getType()->isFloatingPointTy() ||
                           value->getType()->isPointerTy())) {
    size_t valueBitWidth =
        ((llvm::IntegerType*)value->getType())->getBitWidth();
    llvm::Value* oneValue = Utils::getOneValue(valueBitWidth);
    llvm::Value* valuePlus = Utils::createAdd(value, oneValue, generator);
    g_builder.CreateStore(valuePlus, operand);
    return operand;
  }

  throw std::logic_error(
      "Prefix inc operator \"++\" must applies to variables of type integer, "
      "floating point, or pointer!");
}

llvm::Value* PrefixDec::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* PrefixDec::genCodePtr(CodeGenerator& generator) {
  llvm::Value* operand = operand_->genCodePtr(generator);
  llvm::Value* value = g_builder.CreateLoad(
      operand->getType()->getNonOpaquePointerElementType(), operand);
  if (value != nullptr && (value->getType()->isIntegerTy() ||
                           value->getType()->isFloatingPointTy() ||
                           value->getType()->isPointerTy())) {
    size_t valueBitWidth =
        ((llvm::IntegerType*)value->getType())->getBitWidth();
    llvm::Value* oneValue = Utils::getOneValue(valueBitWidth);
    llvm::Value* valueMinus = Utils::createSub(value, oneValue, generator);
    g_builder.CreateStore(valueMinus, operand);
    return operand;
  }

  throw std::logic_error(
      "Prefix dec operator \"--\" must applies to variables of type integer, "
      "floating point, or pointer!");
}

llvm::Value* AddAssign::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* AddAssign::genCodePtr(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createAssign(
      lhs,
      Utils::createAdd(
          g_builder.CreateLoad(lhs->getType()->getNonOpaquePointerElementType(),
                               lhs),
          rhs, generator),
      generator);
}

llvm::Value* SubAssign::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* SubAssign::genCodePtr(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createAssign(
      lhs,
      Utils::createSub(
          g_builder.CreateLoad(lhs->getType()->getNonOpaquePointerElementType(),
                               lhs),
          rhs, generator),
      generator);
}

llvm::Value* MulAssign::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* MulAssign::genCodePtr(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createAssign(
      lhs,
      Utils::createMul(
          g_builder.CreateLoad(lhs->getType()->getNonOpaquePointerElementType(),
                               lhs),
          rhs, generator),
      generator);
}

llvm::Value* DivAssign::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* DivAssign::genCodePtr(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createAssign(
      lhs,
      Utils::createDiv(
          g_builder.CreateLoad(lhs->getType()->getNonOpaquePointerElementType(),
                               lhs),
          rhs, generator),
      generator);
}

llvm::Value* ModAssign::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* ModAssign::genCodePtr(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createAssign(
      lhs,
      Utils::createMod(
          g_builder.CreateLoad(lhs->getType()->getNonOpaquePointerElementType(),
                               lhs),
          rhs, generator),
      generator);
}

llvm::Value* BitwiseAnd::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createBitwiseAnd(lhs, rhs, generator);
}

llvm::Value* BitwiseAnd::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error(
      "Bitwise AND operator \"&\" can not return left value!");
}

llvm::Value* BitwiseOr::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createBitwiseOr(lhs, rhs, generator);
}

llvm::Value* BitwiseOr::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error(
      "Bitwise OR operator \"|\" can not return left value!");
}

llvm::Value* BitwiseXor::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createBitwiseXor(lhs, rhs, generator);
}

llvm::Value* BitwiseXor::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error(
      "Bitwise XOR operator \"^\" can not return left value!");
}

llvm::Value* BitwiseNot::genCode(CodeGenerator& generator) {
  llvm::Value* operand = operand_->genCode(generator);
  if (operand->getType()->isIntegerTy()) {
    return g_builder.CreateNot(operand);
  }

  throw std::logic_error(
      "Bitwise NOT operator \"~\" must be applied to variable of integer.");
}

llvm::Value* BitwiseNot::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error(
      "Bitwise NOT operator \"~\" can not return left value!");
}

llvm::Value* BitwiseAndAssign::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* BitwiseAndAssign::genCodePtr(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createAssign(
      lhs,
      Utils::createBitwiseAnd(
          g_builder.CreateLoad(lhs->getType()->getNonOpaquePointerElementType(),
                               lhs),
          rhs, generator),
      generator);
}

llvm::Value* BitwiseOrAssign::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* BitwiseOrAssign::genCodePtr(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createAssign(
      lhs,
      Utils::createBitwiseOr(
          g_builder.CreateLoad(lhs->getType()->getNonOpaquePointerElementType(),
                               lhs),
          rhs, generator),
      generator);
}

llvm::Value* BitwiseXorAssign::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* BitwiseXorAssign::genCodePtr(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createAssign(
      lhs,
      Utils::createBitwiseXor(
          g_builder.CreateLoad(lhs->getType()->getNonOpaquePointerElementType(),
                               lhs),
          rhs, generator),
      generator);
}

llvm::Value* LeftShift::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createShl(lhs, rhs, generator);
}

llvm::Value* LeftShift::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error(
      "Left shift operator \"<<\" can not return left value!");
}

llvm::Value* RightShift::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createShr(lhs, rhs, generator);
}

llvm::Value* RightShift::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error(
      "Right shift operator \">>\" can not return left value!");
}

llvm::Value* LeftShiftAssign::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* LeftShiftAssign::genCodePtr(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createAssign(
      lhs,
      Utils::createShl(
          g_builder.CreateLoad(lhs->getType()->getNonOpaquePointerElementType(),
                               lhs),
          rhs, generator),
      generator);
}

llvm::Value* RightShiftAssign::genCode(CodeGenerator& generator) {
  return Utils::createLoad(genCodePtr(generator), generator);
}

llvm::Value* RightShiftAssign::genCodePtr(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createAssign(
      lhs,
      Utils::createShr(
          g_builder.CreateLoad(lhs->getType()->getNonOpaquePointerElementType(),
                               lhs),
          rhs, generator),
      generator);
}

llvm::Value* LogicAnd::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  lhs = Utils::castToBool(lhs);
  if (lhs == nullptr) {
    throw std::domain_error(
        "lhs of logic operator \"&&\" can not be cast to bool!");
  }

  llvm::Value* rhs = rhs_->genCode(generator);
  rhs = Utils::castToBool(rhs);
  if (rhs == nullptr) {
    throw std::domain_error(
        "rhs of logic operator \"&&\" can not be cast to bool!");
  }

  return g_builder.CreateLogicalAnd(lhs, rhs);
}

llvm::Value* LogicAnd::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error(
      "Logic AND operator \"&&\" can not return left value!");
}

llvm::Value* LogicOr::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  lhs = Utils::castToBool(lhs);
  if (lhs == nullptr) {
    throw std::domain_error(
        "lhs of logic operator \"||\" can not be cast to bool!");
  }

  llvm::Value* rhs = rhs_->genCode(generator);
  rhs = Utils::castToBool(rhs);
  if (rhs == nullptr) {
    throw std::domain_error(
        "rhs of logic operator \"||\" can not be cast to bool!");
  }

  return g_builder.CreateLogicalOr(lhs, rhs);
}

llvm::Value* LogicOr::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Logic OR operator \"||\" can not return left value!");
}

llvm::Value* LogicNot::genCode(CodeGenerator& generator) {
  return g_builder.CreateICmpEQ(Utils::castToBool(operand_->genCode(generator)),
                                g_builder.getInt1(false));
}

llvm::Value* LogicNot::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Logic NOT operator \"!\" can not return left value!");
}

llvm::Value* LogicEq::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return Utils::createCmpEq(lhs, rhs);
}

llvm::Value* LogicEq::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Logic EQ operator \"==\" can not return left value!");
}

llvm::Value* LogicNotEq::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);

  // Arithmetic comparision
  if (Utils::typeUpgrade(lhs, rhs)) {
    if (lhs->getType()->isIntegerTy()) {
      return g_builder.CreateICmpNE(lhs, rhs);
    } else {
      return g_builder.CreateFCmpONE(lhs, rhs);
    }
  }

  // Pointer comparision
  if (lhs->getType()->isPointerTy() && lhs->getType() == rhs->getType()) {
    return g_builder.CreateICmpNE(
        g_builder.CreatePtrToInt(lhs, g_builder.getInt64Ty()),
        g_builder.CreatePtrToInt(rhs, g_builder.getInt64Ty()));
  } else if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return g_builder.CreateICmpNE(
        g_builder.CreatePtrToInt(lhs, g_builder.getInt64Ty()),
        Utils::typeUpgrade(rhs, g_builder.getInt64Ty()));
  } else if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return g_builder.CreateICmpNE(
        Utils::typeUpgrade(lhs, g_builder.getInt64Ty()),
        g_builder.CreatePtrToInt(rhs, g_builder.getInt64Ty()));
  }

  throw std::domain_error("Unsupported type for operator \"!=\"");
}

llvm::Value* LogicNotEq::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Logic operator \"!=\" can not return left value!");
}

llvm::Value* LogicLessThan::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);

  // Arithmetic comparision
  if (Utils::typeUpgrade(lhs, rhs)) {
    if (lhs->getType()->isIntegerTy()) {
      return g_builder.CreateICmpSLT(lhs, rhs);
    } else {
      return g_builder.CreateFCmpOLT(lhs, rhs);
    }
  }

  // Pointer comparision
  if (lhs->getType()->isPointerTy() && lhs->getType() == rhs->getType()) {
    return g_builder.CreateICmpULT(
        g_builder.CreatePtrToInt(lhs, g_builder.getInt64Ty()),
        g_builder.CreatePtrToInt(rhs, g_builder.getInt64Ty()));
  } else if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return g_builder.CreateICmpULT(
        g_builder.CreatePtrToInt(lhs, g_builder.getInt64Ty()),
        Utils::typeUpgrade(rhs, g_builder.getInt64Ty()));
  } else if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return g_builder.CreateICmpULT(
        Utils::typeUpgrade(lhs, g_builder.getInt64Ty()),
        g_builder.CreatePtrToInt(rhs, g_builder.getInt64Ty()));
  }

  throw std::domain_error("Unsupported type for operator \"<\"");
}

llvm::Value* LogicLessThan::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Logic operator \"<\" can not return left value!");
}

llvm::Value* LogicLessEq::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);

  // Arithmetic comparision
  if (Utils::typeUpgrade(lhs, rhs)) {
    if (lhs->getType()->isIntegerTy()) {
      return g_builder.CreateICmpSLE(lhs, rhs);
    } else {
      return g_builder.CreateFCmpOLE(lhs, rhs);
    }
  }

  // Pointer comparision
  if (lhs->getType()->isPointerTy() && lhs->getType() == rhs->getType()) {
    return g_builder.CreateICmpULE(
        g_builder.CreatePtrToInt(lhs, g_builder.getInt64Ty()),
        g_builder.CreatePtrToInt(rhs, g_builder.getInt64Ty()));
  } else if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return g_builder.CreateICmpULE(
        g_builder.CreatePtrToInt(lhs, g_builder.getInt64Ty()),
        Utils::typeUpgrade(rhs, g_builder.getInt64Ty()));
  } else if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return g_builder.CreateICmpULE(
        Utils::typeUpgrade(lhs, g_builder.getInt64Ty()),
        g_builder.CreatePtrToInt(rhs, g_builder.getInt64Ty()));
  }

  throw std::domain_error("Unsupported type for operator \"<=\"");
}

llvm::Value* LogicLessEq::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Logic operator \"<=\" can not return left value!");
}

llvm::Value* LogicGreaterThan::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);

  // Arithmetic comparision
  if (Utils::typeUpgrade(lhs, rhs)) {
    if (lhs->getType()->isIntegerTy()) {
      return g_builder.CreateICmpSGT(lhs, rhs);
    } else {
      return g_builder.CreateFCmpOGT(lhs, rhs);
    }
  }

  // Pointer comparision
  if (lhs->getType()->isPointerTy() && lhs->getType() == rhs->getType()) {
    return g_builder.CreateICmpUGT(
        g_builder.CreatePtrToInt(lhs, g_builder.getInt64Ty()),
        g_builder.CreatePtrToInt(rhs, g_builder.getInt64Ty()));
  } else if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return g_builder.CreateICmpUGT(
        g_builder.CreatePtrToInt(lhs, g_builder.getInt64Ty()),
        Utils::typeUpgrade(rhs, g_builder.getInt64Ty()));
  } else if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return g_builder.CreateICmpUGT(
        Utils::typeUpgrade(lhs, g_builder.getInt64Ty()),
        g_builder.CreatePtrToInt(rhs, g_builder.getInt64Ty()));
  }

  throw std::domain_error("Unsupported type for operator \">\"");
}

llvm::Value* LogicGreaterThan::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Logic operator \">\" can not return left value!");
}

llvm::Value* LogicGreaterEq::genCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);

  // Arithmetic comparision
  if (Utils::typeUpgrade(lhs, rhs)) {
    if (lhs->getType()->isIntegerTy()) {
      return g_builder.CreateICmpSGE(lhs, rhs);
    } else {
      return g_builder.CreateFCmpOGE(lhs, rhs);
    }
  }

  // Pointer comparision
  if (lhs->getType()->isPointerTy() && lhs->getType() == rhs->getType()) {
    return g_builder.CreateICmpUGE(
        g_builder.CreatePtrToInt(lhs, g_builder.getInt64Ty()),
        g_builder.CreatePtrToInt(rhs, g_builder.getInt64Ty()));
  } else if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return g_builder.CreateICmpUGE(
        g_builder.CreatePtrToInt(lhs, g_builder.getInt64Ty()),
        Utils::typeUpgrade(rhs, g_builder.getInt64Ty()));
  } else if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return g_builder.CreateICmpUGE(
        Utils::typeUpgrade(lhs, g_builder.getInt64Ty()),
        g_builder.CreatePtrToInt(rhs, g_builder.getInt64Ty()));
  }

  throw std::domain_error("Unsupported type for operator \">=\"");
}

llvm::Value* LogicGreaterEq::genCodePtr(CodeGenerator& generator) {
  throw std::logic_error("Logic operator \">=\" can not return left value!");
}

llvm::Value* TernaryCondition::genCode(CodeGenerator& generator) {
  llvm::Value* condition = Utils::castToBool(condition_->genCode(generator));
  if (condition == nullptr) {
    std::logic_error(
        "Condition is not a bool expression in ternary condition expression!");
  }

  llvm::Value* trueVal = trueExpr_->genCode(generator);
  llvm::Value* falseVal = falseExpr_->genCode(generator);
  if (trueVal->getType() == falseVal->getType() ||
      Utils::typeUpgrade(trueVal, falseVal)) {
    return g_builder.CreateSelect(condition, trueVal, falseVal);
  }

  throw std::domain_error(
      "Unmatched type of true and false expressions for ternary operator "
      "\"? :\"");
}

llvm::Value* TernaryCondition::genCodePtr(CodeGenerator& generator) {
  llvm::Value* condition = Utils::castToBool(condition_->genCode(generator));
  if (condition == nullptr) {
    std::logic_error(
        "Condition is not a bool expression in ternary condition expression!");
  }

  llvm::Value* trueVal = trueExpr_->genCodePtr(generator);
  llvm::Value* falseVal = falseExpr_->genCodePtr(generator);
  if (trueVal->getType() == falseVal->getType() ||
      Utils::typeUpgrade(trueVal, falseVal)) {
    return g_builder.CreateSelect(condition, trueVal, falseVal);
  }

  throw std::domain_error(
      "Unmatched type of true and false expressions for ternary operator "
      "\"? :\" which returns left value!");
}

}  // namespace AST