#include "irgen/Operators.hpp"

#include <llvm/IR/IRBuilder.h>

#include <stdexcept>

#include "irgen/TypeConversion.hpp"
#include "types/VarTypeQuery.hpp"

using AST::BuiltinTypeId;

namespace ops {

llvm::Value* createCmpEq(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                         llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                         BuiltinTypeId rhsTypeId) {
  bool isUnsigned = false;
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
  if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                           resultTypeId, isUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return builder.CreateICmpEQ(lhs, rhs);
    }
    return builder.CreateFCmpOEQ(lhs, rhs);
  }

  // Pointer and mixed pointer/integer equality: compare as i64 via ptrtoint so
  // both sides are plain integers regardless of the (opaque) pointer types.
  if (lhs->getType()->isPointerTy() && lhs->getType() == rhs->getType()) {
    return builder.CreateICmpEQ(
        builder.CreatePtrToInt(lhs, builder.getInt64Ty()),
        builder.CreatePtrToInt(rhs, builder.getInt64Ty()));
  }
  if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return builder.CreateICmpEQ(
        builder.CreatePtrToInt(lhs, builder.getInt64Ty()),
        convert::typeUpgrade(builder, rhs, builder.getInt64Ty(), rhsTypeId,
                             BuiltinTypeId::ULONG));
  }
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return builder.CreateICmpEQ(
        convert::typeUpgrade(builder, lhs, builder.getInt64Ty(), lhsTypeId,
                             BuiltinTypeId::ULONG),
        builder.CreatePtrToInt(rhs, builder.getInt64Ty()));
  }

  throw std::logic_error("Unsupported types for \"==\" comparison!");
}

llvm::Value* createIntegerCmp(llvm::IRBuilder<>& builder, IntCmpPred pred,
                              llvm::Value* lhs, llvm::Value* rhs,
                              bool isUnsigned) {
  switch (pred) {
    case IntCmpPred::EQ:
      return builder.CreateICmpEQ(lhs, rhs);
    case IntCmpPred::NE:
      return builder.CreateICmpNE(lhs, rhs);
    case IntCmpPred::LT:
      return isUnsigned ? builder.CreateICmpULT(lhs, rhs)
                        : builder.CreateICmpSLT(lhs, rhs);
    case IntCmpPred::LE:
      return isUnsigned ? builder.CreateICmpULE(lhs, rhs)
                        : builder.CreateICmpSLE(lhs, rhs);
    case IntCmpPred::GT:
      return isUnsigned ? builder.CreateICmpUGT(lhs, rhs)
                        : builder.CreateICmpSGT(lhs, rhs);
    case IntCmpPred::GE:
      return isUnsigned ? builder.CreateICmpUGE(lhs, rhs)
                        : builder.CreateICmpSGE(lhs, rhs);
  }

  return nullptr;
}

// ptr + int is lowered to a GEP whose element type comes from the AST pointer/
// array type (vartype::pointerArithmeticElementType), since IR pointers are
// opaque; int + ptr is handled commutatively. Otherwise fall back to
// integer/float add.
llvm::Value* createAdd(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, AST::VarType* lhsVarType,
                       AST::VarType* rhsVarType, TypeEnv& env,
                       BuiltinTypeId lhsTypeId, BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    llvm::Type* elementTy =
        vartype::pointerArithmeticElementType(lhsVarType, env);
    return builder.CreateGEP(elementTy, lhs, rhs);
  }

  if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    llvm::Type* elementTy =
        vartype::pointerArithmeticElementType(rhsVarType, env);
    return builder.CreateGEP(elementTy, rhs, lhs);
  }

  bool isUnsigned = false;
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
  if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                           resultTypeId, isUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return builder.CreateAdd(lhs, rhs);
    }
    return builder.CreateFAdd(lhs, rhs);
  }

  throw std::logic_error("Add with unsupported types!");
}

// Mirrors createAdd. ptr - ptr uses CreatePtrDiff, which returns an element
// count, not a byte offset.
llvm::Value* createSub(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, AST::VarType* lhsVarType,
                       AST::VarType* rhsVarType, TypeEnv& env,
                       BuiltinTypeId lhsTypeId, BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    llvm::Type* elementTy =
        vartype::pointerArithmeticElementType(lhsVarType, env);
    return builder.CreateGEP(elementTy, lhs, builder.CreateNeg(rhs));
  }

  if (lhs->getType()->isPointerTy() && rhs->getType()->isPointerTy()) {
    llvm::Type* elementTy =
        vartype::pointerArithmeticElementType(lhsVarType, env);
    return builder.CreatePtrDiff(elementTy, lhs, rhs);
  }

  bool isUnsigned = false;
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
  if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                           resultTypeId, isUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return builder.CreateSub(lhs, rhs);
    }
    return builder.CreateFSub(lhs, rhs);
  }

  throw std::logic_error("Sub with unsupported types!");
}

llvm::Value* createMul(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                       BuiltinTypeId rhsTypeId) {
  bool isUnsigned = false;
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
  if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                           resultTypeId, isUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return builder.CreateMul(lhs, rhs);
    }
    return builder.CreateFMul(lhs, rhs);
  }

  throw std::logic_error("Mul with unsupported types!");
}

// isUnsigned selects udiv/urem/lshr vs sdiv/srem/ashr for integer operands.
llvm::Value* createDiv(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                       BuiltinTypeId rhsTypeId, bool isUnsigned) {
  bool unusedUnsigned = false;
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
  if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                           resultTypeId, unusedUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return isUnsigned ? builder.CreateUDiv(lhs, rhs)
                        : builder.CreateSDiv(lhs, rhs);
    }
    return builder.CreateFDiv(lhs, rhs);
  }

  throw std::logic_error("Div with unsupported types!");
}

llvm::Value* createMod(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                       BuiltinTypeId rhsTypeId, bool isUnsigned) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool unusedUnsigned = false;
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                             resultTypeId, unusedUnsigned)) {
      return isUnsigned ? builder.CreateURem(lhs, rhs)
                        : builder.CreateSRem(lhs, rhs);
    }
  }

  throw std::logic_error("Mod should operate on 2 integers!");
}

llvm::Value* createBitwiseAnd(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                              BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                             resultTypeId, isUnsigned)) {
      return builder.CreateAnd(lhs, rhs);
    }
  }

  throw std::logic_error("Bitwise AND should operate on 2 integers!");
}

llvm::Value* createBitwiseOr(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                             llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                             BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                             resultTypeId, isUnsigned)) {
      return builder.CreateOr(lhs, rhs);
    }
  }

  throw std::logic_error("Bitwise OR should operate on 2 integers!");
}

llvm::Value* createBitwiseXor(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                              BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                             resultTypeId, isUnsigned)) {
      return builder.CreateXor(lhs, rhs);
    }
  }

  throw std::logic_error("Bitwise XOR should operate on 2 integers!");
}

llvm::Value* createShl(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                       BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                             resultTypeId, isUnsigned)) {
      return builder.CreateShl(lhs, rhs);
    }
  }

  throw std::logic_error("SHL should operate on 2 integers!");
}

llvm::Value* createShr(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                       BuiltinTypeId rhsTypeId, bool isUnsigned) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool unusedUnsigned = false;
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                             resultTypeId, unusedUnsigned)) {
      return isUnsigned ? builder.CreateLShr(lhs, rhs)
                        : builder.CreateAShr(lhs, rhs);
    }
  }

  throw std::logic_error("SHR should operate on 2 integers!");
}

}  // namespace ops
