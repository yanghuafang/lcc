#include "irgen/Operators.hpp"

#include <llvm/IR/IRBuilder.h>

#include <stdexcept>

#include "irgen/TypeConversion.hpp"
#include "types/TypeRules.hpp"
#include "types/VarTypeQuery.hpp"

using AST::BuiltinTypeId;

namespace ops {

llvm::Value* createCompare(llvm::IRBuilder<>& builder, IntCmpPred intPred,
                           llvm::CmpInst::Predicate floatPred, llvm::Value* lhs,
                           llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                           BuiltinTypeId rhsTypeId) {
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
  if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                           resultTypeId)) {
    if (lhs->getType()->isIntegerTy()) {
      return createIntegerCmp(builder, intPred, lhs, rhs,
                              typerules::isUnsignedTypeId(resultTypeId));
    }
    return builder.CreateFCmp(floatPred, lhs, rhs);
  }

  // Pointer and mixed pointer/integer comparison: compare as i64 via ptrtoint
  // so both sides are plain integers regardless of the (opaque) pointer types.
  // Addresses are unsigned, hence the unsigned predicate in every case below —
  // the integer operand is widened to ULONG for the same reason.
  llvm::Type* addressType = builder.getInt64Ty();
  if (lhs->getType()->isPointerTy() && lhs->getType() == rhs->getType()) {
    return createIntegerCmp(builder, intPred,
                            builder.CreatePtrToInt(lhs, addressType),
                            builder.CreatePtrToInt(rhs, addressType), true);
  }
  if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return createIntegerCmp(
        builder, intPred, builder.CreatePtrToInt(lhs, addressType),
        convert::typeUpgrade(builder, rhs, addressType, rhsTypeId,
                             BuiltinTypeId::ULONG),
        true);
  }
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return createIntegerCmp(
        builder, intPred,
        convert::typeUpgrade(builder, lhs, addressType, lhsTypeId,
                             BuiltinTypeId::ULONG),
        builder.CreatePtrToInt(rhs, addressType), true);
  }

  return nullptr;
}

llvm::Value* createCmpEq(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                         llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                         BuiltinTypeId rhsTypeId) {
  llvm::Value* result =
      createCompare(builder, IntCmpPred::EQ, llvm::CmpInst::FCMP_OEQ, lhs, rhs,
                    lhsTypeId, rhsTypeId);
  if (result == nullptr) {
    throw std::logic_error("Unsupported types for \"==\" comparison!");
  }

  return result;
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

  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
  if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                           resultTypeId)) {
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

  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
  if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                           resultTypeId)) {
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
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
  if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                           resultTypeId)) {
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
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
  if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                           resultTypeId)) {
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
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                             resultTypeId)) {
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
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                             resultTypeId)) {
      return builder.CreateAnd(lhs, rhs);
    }
  }

  throw std::logic_error("Bitwise AND should operate on 2 integers!");
}

llvm::Value* createBitwiseOr(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                             llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                             BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                             resultTypeId)) {
      return builder.CreateOr(lhs, rhs);
    }
  }

  throw std::logic_error("Bitwise OR should operate on 2 integers!");
}

llvm::Value* createBitwiseXor(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                              BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                             resultTypeId)) {
      return builder.CreateXor(lhs, rhs);
    }
  }

  throw std::logic_error("Bitwise XOR should operate on 2 integers!");
}

llvm::Value* createShl(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                       BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                             resultTypeId)) {
      return builder.CreateShl(lhs, rhs);
    }
  }

  throw std::logic_error("SHL should operate on 2 integers!");
}

llvm::Value* createShr(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                       BuiltinTypeId rhsTypeId, bool isUnsigned) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (convert::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId,
                             resultTypeId)) {
      return isUnsigned ? builder.CreateLShr(lhs, rhs)
                        : builder.CreateAShr(lhs, rhs);
    }
  }

  throw std::logic_error("SHR should operate on 2 integers!");
}

}  // namespace ops
