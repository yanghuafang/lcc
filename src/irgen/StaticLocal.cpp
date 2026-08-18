#include "irgen/StaticLocal.hpp"

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Value.h>

#include <stdexcept>
#include <string>

#include "ast/Nodes.hpp"
#include "irgen/ArrayInitializer.hpp"
#include "irgen/CodeGenerator.hpp"
#include "irgen/TypeConversion.hpp"
#include "types/VarTypeQuery.hpp"

// See irgen/StaticLocal.hpp for why a block-scope static needs a guard and a
// block split. Like the walkers this was split from, it sits at global scope
// and names AST types explicitly.
namespace staticlocal {

namespace {

std::string mangleStaticLocalName(llvm::Function* func,
                                  const std::string& varName) {
  return func->getName().str() + "." + varName;
}

// Block-scope static has function lifetime but module storage. Split the
// current block so initializer code runs once on first execution.
llvm::BasicBlock* emitLocalStaticLazyInitPrologue(CodeGenerator& generator,
                                                  llvm::GlobalVariable* guard) {
  llvm::IRBuilder<>& builder = generator.getBuilder();
  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* initBlock =
      llvm::BasicBlock::Create(generator.getContext(), "static.init", func);
  llvm::BasicBlock* contBlock =
      llvm::BasicBlock::Create(generator.getContext(), "static.cont", func);

  llvm::Value* inited =
      builder.CreateLoad(builder.getInt1Ty(), guard, "static.inited");
  builder.CreateCondBr(inited, contBlock, initBlock);
  builder.SetInsertPoint(initBlock);
  return contBlock;
}

void emitLocalStaticLazyInitEpilogue(CodeGenerator& generator,
                                     llvm::GlobalVariable* guard,
                                     llvm::BasicBlock* contBlock) {
  llvm::IRBuilder<>& builder = generator.getBuilder();
  builder.CreateStore(llvm::ConstantInt::getTrue(builder.getInt1Ty()), guard);
  builder.CreateBr(contBlock);
  builder.SetInsertPoint(contBlock);
}

llvm::GlobalVariable* createLocalStaticGuard(CodeGenerator& generator,
                                             const std::string& globalName) {
  return new llvm::GlobalVariable(
      generator.getModule(), generator.getBuilder().getInt1Ty(), false,
      llvm::GlobalValue::PrivateLinkage,
      llvm::ConstantInt::getFalse(generator.getBuilder().getInt1Ty()),
      globalName + ".inited");
}

}  // namespace

void defineBlockStaticVar(CodeGenerator& generator, AST::VarInit* var,
                          AST::VarType* varType, llvm::Type* llvmVarType,
                          AST::VarType* baseVarType, bool isArray,
                          AST::ConstStr* strInit) {
  llvm::Function* func = generator.getCurrentFunction();
  if (func == nullptr) {
    throw std::logic_error("Block-scope static requires a function context.");
  }

  const std::string globalName = mangleStaticLocalName(func, var->varName_);
  llvm::Constant* constantInit = nullptr;
  bool needsRuntimeInit = var->hasBraceInit();

  if (!needsRuntimeInit) {
    if (strInit != nullptr && isArray) {
      arrayinit::Array1DInfo arrayInfo = arrayinit::get1DArrayInfo(varType);
      llvm::Type* elemLlvmType = arrayInfo.elemVarType->getType(generator);
      if (elemLlvmType == nullptr) {
        throw std::logic_error("Define variable with unknown type!");
      }
      constantInit = arrayinit::buildGlobalStringArrayInitializer(
          elemLlvmType, arrayInfo.length, strInit->str_);
    } else if (var->initialExpr_ != nullptr) {
      generator.switchInsertPointToGlobalBlock();
      llvm::Value* initialExpr = convert::typeCast(
          generator.getBuilder(), var->initialExpr_->genCode(generator),
          llvmVarType, var->initialExpr_->getExprTypeId(generator),
          vartype::resolvedVarTypeToTypeId(varType, generator));
      generator.switchInsertPointToCurrentBlock();
      if (initialExpr == nullptr) {
        throw std::logic_error("It failed to init variable " + var->varName_ +
                               " with value of different type!");
      }
      constantInit = llvm::dyn_cast<llvm::Constant>(initialExpr);
      if (constantInit == nullptr) {
        needsRuntimeInit = true;
      }
    } else {
      constantInit = llvm::Constant::getNullValue(llvmVarType);
    }
  }

  llvm::GlobalVariable* globalVar = nullptr;
  if (!needsRuntimeInit) {
    globalVar = new llvm::GlobalVariable(
        generator.getModule(), llvmVarType, baseVarType->isConst_,
        llvm::GlobalValue::InternalLinkage, constantInit, globalName);
  } else {
    globalVar = new llvm::GlobalVariable(
        generator.getModule(), llvmVarType, baseVarType->isConst_,
        llvm::GlobalValue::InternalLinkage,
        llvm::Constant::getNullValue(llvmVarType), globalName);
    llvm::GlobalVariable* guard = createLocalStaticGuard(generator, globalName);
    llvm::BasicBlock* contBlock =
        emitLocalStaticLazyInitPrologue(generator, guard);

    if (var->hasBraceInit()) {
      arrayinit::storeBraceArrayInitializer(generator, globalVar, llvmVarType,
                                            varType, *var->initList_);
    } else if (strInit != nullptr && isArray) {
      arrayinit::Array1DInfo arrayInfo = arrayinit::get1DArrayInfo(varType);
      llvm::Type* elemLlvmType = arrayInfo.elemVarType->getType(generator);
      arrayinit::storeLocalStringArrayInitializer(
          generator, globalVar, llvmVarType, elemLlvmType, arrayInfo.length,
          strInit->str_);
    } else if (var->initialExpr_ != nullptr) {
      llvm::Value* initializer = convert::typeCast(
          generator.getBuilder(), var->initialExpr_->genCode(generator),
          llvmVarType, var->initialExpr_->getExprTypeId(generator),
          vartype::resolvedVarTypeToTypeId(varType, generator));
      if (initializer == nullptr) {
        throw std::logic_error("It failed to init variable " + var->varName_ +
                               " with value of different type!");
      }
      generator.getBuilder().CreateStore(initializer, globalVar);
    }

    emitLocalStaticLazyInitEpilogue(generator, guard, contBlock);
  }

  if (!generator.addVariable(var->varName_, globalVar, varType)) {
    globalVar->eraseFromParent();
    if (generator.hasTypedefAliasInCurrentScope(var->varName_)) {
      throw std::logic_error("It is not allowed to use typedef name " +
                             var->varName_ +
                             " as a variable in the same scope!");
    }
    throw std::logic_error(
        "It is not allowed to redefine the same local variable " +
        var->varName_ + " in the same scope!");
  }
}

}  // namespace staticlocal
