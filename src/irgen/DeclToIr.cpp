#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Value.h>

#include <stdexcept>
#include <string>
#include <vector>

#include "ast/Nodes.hpp"
#include "irgen/ArrayInitializer.hpp"
#include "irgen/CodeGenerator.hpp"
#include "irgen/DebugInfoBuilder.hpp"
#include "irgen/IrIdioms.hpp"
#include "irgen/StaticLocal.hpp"
#include "irgen/TypeConversion.hpp"
#include "types/VarTypeQuery.hpp"

// Declarations -> LLVM IR: genCode() for Program, FuncDecl, VarDecl, TypeDecl
// and TypedefDecl.
//
// VarDecl::genCode is the branchy one, and reads as a decision table: per
// VarInit, resolve the declarator bounds, build the nested ArrayType from them,
// choose storage — alloca, block-scope static, or file-scope global — and then
// initialize it. What it initializes *with* lives next door rather than here:
//
//   irgen/ArrayInitializer.hpp  bound inference, the array type those bounds
//                               denote, and the four initializer shapes
//                               (local/global x brace/string)
//   irgen/StaticLocal.hpp       block-scope statics, including the lazy-init
//                               guard that splits a basic block mid-declaration
//
// Both were file-local helpers of this walker until they outgrew it; the split
// left the decision table above readable on its own.

namespace AST {

llvm::Value* InitElement::genCode(CodeGenerator& generator) {
  (void)generator;
  throw std::logic_error("InitElement is not an expression.");
}

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
      type = llvm::PointerType::get(generator.getContext(), 0);
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
  llvm::GlobalValue::LinkageTypes linkage =
      isStatic_ ? llvm::GlobalValue::InternalLinkage
                : llvm::GlobalValue::ExternalLinkage;
  llvm::Function* func = llvm::Function::Create(funcType, linkage, funcName_,
                                                &generator.getModule());

  std::vector<VarType*> paramVarTypes;
  for (Param* param : *paramList_) {
    paramVarTypes.push_back(param->varType_);
  }
  generator.symbols().setFuncSignature(funcName_, retType_, paramVarTypes);
  generator.symbols().addFunction(funcName_, func);

  // LLVM merges symbols with the same name in one module. A prior declaration
  // and a later definition therefore share one llvm::Function; we detect that
  // here to implement C-style prototype + body linking.
  if (func->getName() != funcName_) {
    // Remove the function just made, use the existing function.
    func->eraseFromParent();
    func = generator.getModule().getFunction(funcName_);

    if (func->getFunctionType() != funcType) {
      throw std::logic_error("Redefine function " + funcName_ +
                             " with different params!");
    }

    if (func->getLinkage() != linkage) {
      throw std::logic_error("Function " + funcName_ +
                             " declarations conflict on static linkage!");
    }

    // Function declaration conflict.
    // Previous function declaration must be declaration without function body.
    // Current function declaration must be definition with function body.
    if (!func->empty() || funcBody_ == nullptr) {
      throw std::logic_error("Function " + funcName_ +
                             " declarations conflict!");
    }
  }

  // -g: attach a DWARF subprogram to definitions; line is the function name
  // token.
  llvm::DISubprogram* subprogram = nullptr;
  if (funcBody_ != nullptr && generator.isDebugInfoEnabled()) {
    unsigned line = loc().line > 0 ? loc().line : 1;
    subprogram = generator.debugInfo()->createFunction(
        func, funcName_, line, funcType, retType_, paramVarTypes);
  }

  if (funcBody_ != nullptr) {
    llvm::BasicBlock* funcBlock =
        llvm::BasicBlock::Create(generator.getContext(), "entry", func);
    generator.getBuilder().SetInsertPoint(funcBlock);
    // Entered before param debug info: setDebugLocation uses
    // getCurrentFunction().
    ScopedFunction funcScope(generator, func);

    if (subprogram != nullptr) {
      generator.setDebugLocation(loc());
    }

    // Allocate symbol table for function parameters.
    ScopedSymbolTable paramScope(generator.symbols());

    size_t index = 0;
    for (auto* paramIter = func->arg_begin(); paramIter < func->arg_end();
         ++paramIter, ++index) {
      // alloca on stack for parameter.
      llvm::AllocaInst* allocaInst = iridiom::createEntryBlockAlloca(
          func, paramList_->at(index)->varName_, paramTypes[index]);
      generator.getBuilder().CreateStore(paramIter, allocaInst);
      generator.symbols().addVariable(paramList_->at(index)->varName_,
                                      allocaInst,
                                      paramList_->at(index)->varType_);
      if (subprogram != nullptr) {
        generator.declareDebugAlloca(
            allocaInst, paramList_->at(index)->varName_, paramTypes[index],
            paramList_->at(index)->varType_, loc(), index + 1);
      }
    }

    {
      ScopedSymbolTable bodyScope(generator.symbols());
      funcBody_->genCode(generator);
    }
  }

  return nullptr;
}

// Per VarInit: resolve bounds → build nested ArrayType → alloca, block-static
// global, or file-scope global; then brace init, string literal, scalar expr.
llvm::Value* VarDecl::genCode(CodeGenerator& generator) {
  llvm::Type* baseLlvmType = varType_->getType(generator);
  if (baseLlvmType == nullptr) {
    throw std::logic_error("Define variable with unknown type!");
  }
  if (baseLlvmType->isVoidTy()) {
    throw std::logic_error("It is not allowed to define void variable!");
  }

  for (VarInit* var : *varList_) {
    std::vector<size_t> resolvedBounds =
        arrayinit::resolveArrayBounds(var, varType_);
    bool isArray = !resolvedBounds.empty();
    ConstStr* strInit = arrayinit::asConstStr(var->initialExpr_);

    if (var->hasBraceInit()) {
      if (!isArray) {
        throw std::logic_error(
            "Brace initialization is only supported for arrays.");
      }
    } else if (isArray && var->initialExpr_ != nullptr) {
      if (strInit == nullptr || !arrayinit::isCharElementType(varType_)) {
        throw std::logic_error(
            "Array variable " + var->varName_ +
            " cannot be initialized with a single expression; use brace "
            "initialization or a string literal for char arrays.");
      }
    }

    var->arrayVarType_ = arrayinit::buildArrayVarType(varType_, resolvedBounds);
    VarType* varType = var->arrayVarType_;
    llvm::Type* llvmVarType = varType->getType(generator);
    if (llvmVarType == nullptr) {
      throw std::logic_error("Define variable with unknown type!");
    }

    if (generator.getCurrentFunction() != nullptr) {
      if (isStatic_) {
        staticlocal::defineBlockStaticVar(generator, var, varType, llvmVarType,
                                          varType_, isArray, strInit);
        continue;
      }

      llvm::AllocaInst* allocaInst = iridiom::createEntryBlockAlloca(
          generator.getCurrentFunction(), var->varName_, llvmVarType);
      if (!generator.symbols().addVariable(var->varName_, allocaInst,
                                           varType)) {
        allocaInst->eraseFromParent();
        if (generator.symbols().hasTypedefAliasInCurrentScope(var->varName_)) {
          throw std::logic_error("It is not allowed to use typedef name " +
                                 var->varName_ +
                                 " as a variable in the same scope!");
        }
        throw std::logic_error(
            "It is not allowed to redefine the same local variable " +
            var->varName_ + " in the same scope!");
      }

      generator.declareDebugAlloca(allocaInst, var->varName_, llvmVarType,
                                   varType, loc());

      if (var->hasBraceInit()) {
        arrayinit::storeBraceArrayInitializer(
            generator, allocaInst, llvmVarType, varType, *var->initList_);
      } else if (strInit != nullptr && isArray) {
        arrayinit::Array1DInfo arrayInfo = arrayinit::get1DArrayInfo(varType);
        llvm::Type* elemLlvmType = arrayInfo.elemVarType->getType(generator);
        arrayinit::storeLocalStringArrayInitializer(
            generator, allocaInst, llvmVarType, elemLlvmType, arrayInfo.length,
            strInit->str_);
      } else if (var->initialExpr_ != nullptr) {
        llvm::Value* initializer = convert::typeCast(
            generator.getBuilder(), var->initialExpr_->genCode(generator),
            llvmVarType, var->initialExpr_->getExprTypeId(generator),
            vartype::resolvedVarTypeToTypeId(varType, generator));
        if (initializer == nullptr) {
          allocaInst->eraseFromParent();
          throw std::logic_error("It failed to init variable " + var->varName_ +
                                 " with value of different type!");
        }
        generator.getBuilder().CreateStore(initializer, allocaInst);
      }
    } else {
      llvm::Constant* initializer = nullptr;
      if (var->hasBraceInit()) {
        initializer = arrayinit::buildBraceArrayInitializer(
            generator, varType, llvmVarType, *var->initList_);
      } else if (strInit != nullptr && isArray) {
        arrayinit::Array1DInfo arrayInfo = arrayinit::get1DArrayInfo(varType);
        llvm::Type* elemLlvmType = arrayInfo.elemVarType->getType(generator);
        if (elemLlvmType == nullptr) {
          throw std::logic_error("Define variable with unknown type!");
        }
        initializer = arrayinit::buildGlobalStringArrayInitializer(
            elemLlvmType, arrayInfo.length, strInit->str_);
      } else if (var->initialExpr_ != nullptr) {
        llvm::Value* initialExpr = nullptr;
        {
          // A file-scope initializer is emitted into the module's global block,
          // since there is no function to emit it into.
          ScopedGlobalInsertPoint globalInsertPoint(generator);
          initialExpr = convert::typeCast(
              generator.getBuilder(), var->initialExpr_->genCode(generator),
              llvmVarType, var->initialExpr_->getExprTypeId(generator),
              vartype::resolvedVarTypeToTypeId(varType, generator));
        }
        if (initialExpr == nullptr) {
          throw std::logic_error("It failed to init variable " + var->varName_ +
                                 " with value of different type!");
        }
        initializer =
            arrayinit::asConstant(initialExpr, "Global variable initializer");
      } else {
        // C static-storage objects with no initializer are zero-initialized
        // (C11 6.7.9/10). lcc is single-TU, so a zeroinitializer strong
        // definition matches the final tentative definition; undef would let
        // the optimizer read garbage from untouched globals.
        initializer = llvm::Constant::getNullValue(llvmVarType);
      }

      llvm::GlobalValue::LinkageTypes linkage =
          isStatic_ ? llvm::GlobalValue::InternalLinkage
                    : llvm::GlobalValue::ExternalLinkage;
      auto* globalVar = new llvm::GlobalVariable(
          generator.getModule(), llvmVarType, varType_->isConst_, linkage,
          initializer, var->varName_);
      if (!generator.symbols().addVariable(var->varName_, globalVar, varType)) {
        if (generator.symbols().hasTypedefAliasInCurrentScope(var->varName_)) {
          throw std::logic_error("It is not allowed to use typedef name " +
                                 var->varName_ +
                                 " as a variable in the same scope!");
        }
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

  if (!generator.symbols().addType(varType_->typeName_, type)) {
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

llvm::Value* TypedefDecl::genCode(CodeGenerator& generator) {
  llvm::Type* llvmType;
  if (underlyingType_->isStructType()) {
    llvmType = ((StructType*)underlyingType_)
                   ->genTypeHead(generator, underlyingType_->typeName_);
  } else if (underlyingType_->isUnionType()) {
    llvmType = ((UnionType*)underlyingType_)
                   ->genTypeHead(generator, underlyingType_->typeName_);
  } else {
    llvmType = underlyingType_->getType(generator);
  }

  if (llvmType == nullptr) {
    throw std::logic_error("Failed to define typedef " + aliasName_);
  }

  if (!generator.symbols().addTypedefAlias(aliasName_, underlyingType_)) {
    throw std::logic_error("It is not allowed to redefine typedef " +
                           aliasName_);
  }

  auto registerTypeName = [&](const std::string& typeName) {
    if (generator.findType(typeName) == nullptr) {
      if (!generator.symbols().addType(typeName, llvmType)) {
        throw std::logic_error("It is not allowed to redefine type " +
                               typeName);
      }
    }
  };

  registerTypeName(aliasName_);

  if (underlyingType_->isStructType() || underlyingType_->isUnionType()) {
    const std::string& tagName = underlyingType_->typeName_;
    if (tagName != aliasName_) {
      registerTypeName(tagName);
    }
  }

  if (underlyingType_->isStructType()) {
    ((StructType*)underlyingType_)->genTypeBody(generator);
  } else if (underlyingType_->isUnionType()) {
    ((UnionType*)underlyingType_)->genTypeBody(generator);
  }

  return nullptr;
}

}  // namespace AST
