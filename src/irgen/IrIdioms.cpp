#include "irgen/IrIdioms.hpp"

#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/IRBuilder.h>

#include <stdexcept>

#include "ast/Nodes.hpp"
#include "irgen/TypeConversion.hpp"
#include "types/TypeEnv.hpp"
#include "types/VarTypeQuery.hpp"

using AST::BuiltinTypeId;

namespace iridiom {

llvm::AllocaInst* createEntryBlockAlloca(llvm::Function* func,
                                         const std::string& varName,
                                         llvm::Type* varType) {
  llvm::IRBuilder<> builder(&func->getEntryBlock(),
                            func->getEntryBlock().begin());
  return builder.CreateAlloca(varType, nullptr, varName);
}

llvm::BranchInst* terminateBlockByBr(llvm::IRBuilder<>& builder,
                                     llvm::BasicBlock* basicBlock) {
  if (builder.GetInsertBlock()->getTerminator() == nullptr) {
    return builder.CreateBr(basicBlock);
  }

  return nullptr;
}

// ptr is from genCodePtr(); lvalueVarType is the C type of that location.
llvm::Value* createLoad(llvm::IRBuilder<>& builder, llvm::Value* ptr,
                        AST::VarType* lvalueVarType, TypeEnv& env) {
  AST::VarType* resolved = vartype::resolveTypedefVarType(lvalueVarType, env);
  if (resolved == nullptr) {
    throw std::logic_error("Load requires a known lvalue type.");
  }

  // Array rvalue: decay storage pointer to pointer-to-element (no load). Under
  // LLVM 20+ opaque pointers this cast changes no LLVM type — every pointer is
  // `ptr` — but it keeps the decay explicit at the one place C requires it.
  if (resolved->isArrayType()) {
    return builder.CreatePointerCast(
        ptr, llvm::PointerType::get(env.getContext(), 0));
  }

  llvm::Type* pointeeTy = vartype::memoryAccessType(resolved, env);
  return builder.CreateLoad(pointeeTy, ptr);
}

llvm::Value* createAssign(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                          llvm::Value* rhs, AST::VarType* lhsVarType,
                          TypeEnv& env, BuiltinTypeId srcTypeId,
                          BuiltinTypeId dstTypeId) {
  llvm::Type* storeTy = vartype::memoryAccessType(lhsVarType, env);
  rhs = convert::typeCast(builder, rhs, storeTy, srcTypeId, dstTypeId);
  if (rhs == nullptr) {
    throw std::logic_error(
        "Assign with values that can not be cast to the target type!");
  }

  builder.CreateStore(rhs, lhs);
  return lhs;
}

llvm::Value* getOneValue(llvm::IRBuilder<>& builder, size_t valueBitWidth) {
  switch (valueBitWidth) {
    case 1:
      return builder.getInt1(true);
    case 8:
      return builder.getInt8(1);
    case 16:
      return builder.getInt16(1);
    case 32:
      return builder.getInt32(1);
    case 64:
      return builder.getInt64(1);
    default:
      return builder.getInt32(1);
  }
}

}  // namespace iridiom
