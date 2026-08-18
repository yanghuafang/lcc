#include "irgen/TypeConversion.hpp"

#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Instructions.h>

#include <stdexcept>

#include "types/TypeRules.hpp"
#include "types/VarTypeQuery.hpp"

using AST::BuiltinTypeId;

namespace convert {
namespace {

// CreateIntCast wants the signedness of the value being cast, which is only
// meaningful when both ends of the cast are known C types.
bool isSrcSignedForCast(BuiltinTypeId srcTypeId) {
  if (srcTypeId == BuiltinTypeId::UNKNOWN) {
    return true;
  }
  return !typerules::isUnsignedTypeId(srcTypeId) &&
         srcTypeId != BuiltinTypeId::BOOL;
}

bool isDstSignedForCast(BuiltinTypeId dstTypeId) {
  if (dstTypeId == BuiltinTypeId::UNKNOWN) {
    return true;
  }
  return !typerules::isUnsignedTypeId(dstTypeId);
}

}  // namespace

llvm::Value* typeCast(llvm::IRBuilder<>& builder, llvm::Value* value,
                      llvm::Type* type, BuiltinTypeId srcTypeId,
                      BuiltinTypeId dstTypeId) {
  if (value->getType() == type) {
    return value;
  }
  if (type == builder.getInt1Ty()) {
    return castToBool(builder, value);
  }
  if (value->getType()->isIntegerTy() && type->isIntegerTy()) {
    // CreateIntCast's third argument is signedness of the value, not just C
    // type.
    bool isSigned =
        isSrcSignedForCast(srcTypeId) && isDstSignedForCast(dstTypeId);
    return builder.CreateIntCast(value, type, isSigned);
  }
  if (value->getType()->isIntegerTy() && type->isFloatingPointTy()) {
    if (srcTypeId == BuiltinTypeId::BOOL ||
        typerules::isUnsignedTypeId(srcTypeId)) {
      return builder.CreateUIToFP(value, type);
    }
    return builder.CreateSIToFP(value, type);
  }
  if (value->getType()->isIntegerTy() && type->isPointerTy()) {
    return builder.CreateIntToPtr(value, type);
  }
  if (value->getType()->isFloatingPointTy() && type->isIntegerTy()) {
    if (typerules::isUnsignedTypeId(dstTypeId)) {
      return builder.CreateFPToUI(value, type);
    }
    return builder.CreateFPToSI(value, type);
  }
  if (value->getType()->isFloatingPointTy() && type->isFloatingPointTy()) {
    return builder.CreateFPCast(value, type);
  }
  if (value->getType()->isPointerTy() && type->isIntegerTy()) {
    return builder.CreatePtrToInt(value, type);
  }
  if (value->getType()->isPointerTy() && type->isPointerTy()) {
    return builder.CreatePointerCast(value, type);
  }

  // No conversion applies; callers report the type mismatch with context.
  return nullptr;
}

llvm::Value* castToBool(llvm::IRBuilder<>& builder, llvm::Value* value) {
  if (value->getType() == builder.getInt1Ty()) {
    return value;
  }
  // `if (a < b)` reaches here holding the int the comparison operators are
  // required to produce (boolToInt in irgen/LogicToIr.cpp), so the bit we want
  // is one zext away. Take it back rather than testing the widened value
  // against zero: without this, every comparison used as a condition would
  // emit icmp -> zext i1 to i32 -> icmp ne i32, and read as three
  // instructions where one did the work. -O1 and up fold that pair anyway;
  // this keeps -O0 IR — what docs/LlvmTools.md and debug/*.ll show — honest.
  //
  // Erase when nothing else took the widened value, or the zext lingers as
  // dead code at -O0, which is the noise this exists to avoid. Every caller
  // passes a temporary or reassigns it, so no caller holds the erased pointer.
  if (auto* zext = llvm::dyn_cast<llvm::ZExtInst>(value)) {
    if (zext->getSrcTy() == builder.getInt1Ty()) {
      llvm::Value* boolValue = zext->getOperand(0);
      if (zext->use_empty()) {
        zext->eraseFromParent();
      }
      return boolValue;
    }
  }
  if (value->getType()->isIntegerTy()) {
    return builder.CreateICmpNE(
        value, llvm::ConstantInt::get(
                   llvm::cast<llvm::IntegerType>(value->getType()), 0, true));
  }
  if (value->getType()->isFloatingPointTy()) {
    return builder.CreateFCmpONE(value,
                                 llvm::ConstantFP::get(value->getType(), 0.0));
  }
  if (value->getType()->isPointerTy()) {
    return builder.CreateICmpNE(
        builder.CreatePtrToInt(value, builder.getInt64Ty()),
        builder.getInt64(0));
  }
  throw std::logic_error("The variable/value can not cast to bool type.");
}

llvm::Value* typeUpgrade(llvm::IRBuilder<>& builder, llvm::Value* value,
                         llvm::Type* type, BuiltinTypeId srcTypeId,
                         BuiltinTypeId dstTypeId) {
  if (value->getType()->isIntegerTy() && type->isIntegerTy()) {
    size_t valueBitWidth =
        (llvm::cast<llvm::IntegerType>(value->getType()))->getBitWidth();
    size_t typeBitWidth = (llvm::cast<llvm::IntegerType>(type))->getBitWidth();
    if (valueBitWidth < typeBitWidth) {
      return typeCast(builder, value, type, srcTypeId, dstTypeId);
    }

    return value;
  }
  if (value->getType()->isFloatingPointTy() && type->isFloatingPointTy()) {
    if (value->getType()->isFloatTy() && type->isDoubleTy()) {
      return builder.CreateFPCast(value, type);
    }

    return value;
  }
  if (value->getType()->isIntegerTy() && type->isFloatingPointTy()) {
    return typeCast(builder, value, type, srcTypeId, dstTypeId);
  }
  if (value->getType()->isFloatingPointTy() && type->isIntegerTy()) {
    return value;
  }
  return nullptr;
}

bool typeUpgrade(llvm::IRBuilder<>& builder, llvm::Value*& lhs,
                 llvm::Value*& rhs, BuiltinTypeId lhsTypeId,
                 BuiltinTypeId rhsTypeId, BuiltinTypeId& resultTypeId,
                 bool& isUnsigned) {
  if (typerules::isIntegerTypeId(lhsTypeId) &&
      typerules::isIntegerTypeId(rhsTypeId)) {
    resultTypeId =
        typerules::usualArithmeticConversion(lhsTypeId, rhsTypeId, isUnsigned);
    llvm::Type* destType =
        vartype::builtinTypeIdToLlvmType(resultTypeId, builder.getContext());
    lhs = typeCast(builder, lhs, destType, lhsTypeId, resultTypeId);
    rhs = typeCast(builder, rhs, destType, rhsTypeId, resultTypeId);
    return true;
  }
  if (typerules::isFloatingTypeId(lhsTypeId) ||
      typerules::isFloatingTypeId(rhsTypeId)) {
    resultTypeId =
        typerules::usualArithmeticConversion(lhsTypeId, rhsTypeId, isUnsigned);
    llvm::Type* destType =
        vartype::builtinTypeIdToLlvmType(resultTypeId, builder.getContext());
    lhs = typeCast(builder, lhs, destType, lhsTypeId, resultTypeId);
    rhs = typeCast(builder, rhs, destType, rhsTypeId, resultTypeId);
    return true;
  }
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isFloatingPointTy()) {
    resultTypeId =
        typerules::usualArithmeticConversion(lhsTypeId, rhsTypeId, isUnsigned);
    lhs = typeCast(
        builder, lhs,
        vartype::builtinTypeIdToLlvmType(resultTypeId, builder.getContext()),
        lhsTypeId, resultTypeId);
    return true;
  }
  if (lhs->getType()->isFloatingPointTy() && rhs->getType()->isIntegerTy()) {
    resultTypeId =
        typerules::usualArithmeticConversion(lhsTypeId, rhsTypeId, isUnsigned);
    rhs = typeCast(
        builder, rhs,
        vartype::builtinTypeIdToLlvmType(resultTypeId, builder.getContext()),
        rhsTypeId, resultTypeId);
    return true;
  }

  return false;
}

}  // namespace convert
