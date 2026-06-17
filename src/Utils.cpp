#include "Utils.hpp"

#include <exception>
#include <iostream>

#include <llvm/IR/IRBuilder.h>

#include "AbstractSyntaxTree.hpp"

using AST::BuiltinType;

namespace {

bool isIntegerTypeId(BuiltinType::TypeId typeId) {
  switch (typeId) {
    case BuiltinType::TypeId::CHAR:
    case BuiltinType::TypeId::SHORT:
    case BuiltinType::TypeId::INT:
    case BuiltinType::TypeId::LONG:
    case BuiltinType::TypeId::UCHAR:
    case BuiltinType::TypeId::USHORT:
    case BuiltinType::TypeId::UINT:
    case BuiltinType::TypeId::ULONG:
    case BuiltinType::TypeId::BOOL:
      return true;
    default:
      return false;
  }
}

bool isFloatingTypeId(BuiltinType::TypeId typeId) {
  return typeId == BuiltinType::TypeId::FLOAT ||
         typeId == BuiltinType::TypeId::DOUBLE;
}

bool isSrcSignedForCast(BuiltinType::TypeId srcTypeId) {
  if (srcTypeId == BuiltinType::TypeId::UNKNOWN) {
    return true;
  }
  return !Utils::isUnsignedTypeId(srcTypeId) &&
         srcTypeId != BuiltinType::TypeId::BOOL;
}

bool isDstSignedForCast(BuiltinType::TypeId dstTypeId) {
  if (dstTypeId == BuiltinType::TypeId::UNKNOWN) {
    return true;
  }
  return !Utils::isUnsignedTypeId(dstTypeId);
}

llvm::Type* llvmTypeForTypeId(llvm::IRBuilder<>& builder,
                              BuiltinType::TypeId typeId) {
  switch (typeId) {
    case BuiltinType::TypeId::CHAR:
    case BuiltinType::TypeId::UCHAR:
      return builder.getInt8Ty();
    case BuiltinType::TypeId::SHORT:
    case BuiltinType::TypeId::USHORT:
      return builder.getInt16Ty();
    case BuiltinType::TypeId::INT:
    case BuiltinType::TypeId::UINT:
      return builder.getInt32Ty();
    case BuiltinType::TypeId::LONG:
    case BuiltinType::TypeId::ULONG:
      return builder.getInt64Ty();
    case BuiltinType::TypeId::FLOAT:
      return builder.getFloatTy();
    case BuiltinType::TypeId::DOUBLE:
      return builder.getDoubleTy();
    case BuiltinType::TypeId::BOOL:
      return builder.getInt1Ty();
    default:
      return nullptr;
  }
}

}  // namespace

bool Utils::isUnsignedTypeId(BuiltinType::TypeId typeId) {
  switch (typeId) {
    case BuiltinType::TypeId::UCHAR:
    case BuiltinType::TypeId::USHORT:
    case BuiltinType::TypeId::UINT:
    case BuiltinType::TypeId::ULONG:
      return true;
    default:
      return false;
  }
}

BuiltinType::TypeId Utils::integerPromotion(BuiltinType::TypeId typeId) {
  switch (typeId) {
    case BuiltinType::TypeId::CHAR:
    case BuiltinType::TypeId::SHORT:
    case BuiltinType::TypeId::UCHAR:
    case BuiltinType::TypeId::USHORT:
    case BuiltinType::TypeId::BOOL:
      return BuiltinType::TypeId::INT;
    default:
      return typeId;
  }
}

// C usual arithmetic conversions (simplified): integer promotion, then if either
// operand is unsigned the result is unsigned, with long/double rules as in C.
BuiltinType::TypeId Utils::usualArithmeticConversion(
    BuiltinType::TypeId lhsTypeId, BuiltinType::TypeId rhsTypeId,
    bool& isUnsigned) {
  lhsTypeId = integerPromotion(lhsTypeId);
  rhsTypeId = integerPromotion(rhsTypeId);

  if (isFloatingTypeId(lhsTypeId) || isFloatingTypeId(rhsTypeId)) {
    isUnsigned = false;
    return BuiltinType::TypeId::DOUBLE;
  }

  if (lhsTypeId == BuiltinType::TypeId::ULONG ||
      rhsTypeId == BuiltinType::TypeId::ULONG) {
    isUnsigned = true;
    return BuiltinType::TypeId::ULONG;
  }
  if (lhsTypeId == BuiltinType::TypeId::LONG ||
      rhsTypeId == BuiltinType::TypeId::LONG) {
    if (isUnsignedTypeId(lhsTypeId) || isUnsignedTypeId(rhsTypeId)) {
      isUnsigned = true;
      return BuiltinType::TypeId::ULONG;
    }
    isUnsigned = false;
    return BuiltinType::TypeId::LONG;
  }
  if (isUnsignedTypeId(lhsTypeId) || isUnsignedTypeId(rhsTypeId)) {
    isUnsigned = true;
    return BuiltinType::TypeId::UINT;
  }

  isUnsigned = false;
  return BuiltinType::TypeId::INT;
}

BuiltinType::TypeId Utils::varTypeToTypeId(AST::VarType* varType) {
  if (varType == nullptr) {
    return BuiltinType::TypeId::UNKNOWN;
  }

  if (varType->isBuiltinType()) {
    return static_cast<AST::BuiltinType*>(varType)->typeId_;
  }
  if (varType->isEnumType()) {
    return BuiltinType::TypeId::INT;
  }
  if (varType->isArrayType()) {
    return varTypeToTypeId(
        static_cast<AST::ArrayType*>(varType)->baseType_);
  }

  return BuiltinType::TypeId::UNKNOWN;
}

llvm::Value* Utils::typeCast(llvm::IRBuilder<>& builder, llvm::Value* value,
                             llvm::Type* type, BuiltinType::TypeId srcTypeId,
                             BuiltinType::TypeId dstTypeId) {
  if (value->getType() == type) {
    return value;
  } else if (type == builder.getInt1Ty()) {
    return Utils::castToBool(builder, value);
  } else if (value->getType()->isIntegerTy() && type->isIntegerTy()) {
    // CreateIntCast's third argument is signedness of the value, not just C type.
    bool isSigned =
        isSrcSignedForCast(srcTypeId) && isDstSignedForCast(dstTypeId);
    return builder.CreateIntCast(value, type, isSigned);
  } else if (value->getType()->isIntegerTy() && type->isFloatingPointTy()) {
    if (srcTypeId == BuiltinType::TypeId::BOOL ||
        isUnsignedTypeId(srcTypeId)) {
      return builder.CreateUIToFP(value, type);
    }
    return builder.CreateSIToFP(value, type);
  } else if (value->getType()->isIntegerTy() && type->isPointerTy()) {
    return builder.CreateIntToPtr(value, type);
  } else if (value->getType()->isFloatingPointTy() && type->isIntegerTy()) {
    if (isUnsignedTypeId(dstTypeId)) {
      return builder.CreateFPToUI(value, type);
    }
    return builder.CreateFPToSI(value, type);
  } else if (value->getType()->isFloatingPointTy() &&
             type->isFloatingPointTy()) {
    return builder.CreateFPCast(value, type);
  } else if (value->getType()->isPointerTy() && type->isIntegerTy()) {
    return builder.CreatePtrToInt(value, type);
  } else if (value->getType()->isPointerTy() && type->isPointerTy()) {
    return builder.CreatePointerCast(value, type);
  } else {
    return nullptr;
  }
}

llvm::Value* Utils::castToBool(llvm::IRBuilder<>& builder, llvm::Value* value) {
  if (value->getType() == builder.getInt1Ty()) {
    return value;
  } else if (value->getType()->isIntegerTy()) {
    return builder.CreateICmpNE(
        value,
        llvm::ConstantInt::get((llvm::IntegerType*)value->getType(), 0, true));
  } else if (value->getType()->isFloatingPointTy()) {
    return builder.CreateFCmpONE(
        value, llvm::ConstantFP::get(value->getType(), 0.0));
  } else if (value->getType()->isPointerTy()) {
    return builder.CreateICmpNE(
        builder.CreatePtrToInt(value, builder.getInt64Ty()),
        builder.getInt64(0));
  } else {
    throw std::logic_error("The variable/value can not cast to bool type.");
  }
}

llvm::Value* Utils::typeUpgrade(llvm::IRBuilder<>& builder, llvm::Value* value,
                                llvm::Type* type,
                                BuiltinType::TypeId srcTypeId,
                                BuiltinType::TypeId dstTypeId) {
  if (value->getType()->isIntegerTy() && type->isIntegerTy()) {
    size_t valueBitWidth =
        ((llvm::IntegerType*)value->getType())->getBitWidth();
    size_t typeBitWidth = ((llvm::IntegerType*)type)->getBitWidth();
    if (valueBitWidth < typeBitWidth) {
      return typeCast(builder, value, type, srcTypeId, dstTypeId);
    }

    return value;
  } else if (value->getType()->isFloatingPointTy() &&
             type->isFloatingPointTy()) {
    if (value->getType()->isFloatTy() && type->isDoubleTy()) {
      return builder.CreateFPCast(value, type);
    }

    return value;
  } else if (value->getType()->isIntegerTy() && type->isFloatingPointTy()) {
    return typeCast(builder, value, type, srcTypeId, dstTypeId);
  } else if (value->getType()->isFloatingPointTy() && type->isIntegerTy()) {
    return value;
  } else {
    return nullptr;
  }
}

bool Utils::typeUpgrade(llvm::IRBuilder<>& builder, llvm::Value*& lhs,
                        llvm::Value*& rhs, BuiltinType::TypeId lhsTypeId,
                        BuiltinType::TypeId rhsTypeId,
                        BuiltinType::TypeId& resultTypeId, bool& isUnsigned) {
  if (isIntegerTypeId(lhsTypeId) && isIntegerTypeId(rhsTypeId)) {
    resultTypeId = usualArithmeticConversion(lhsTypeId, rhsTypeId, isUnsigned);
    llvm::Type* destType = llvmTypeForTypeId(builder, resultTypeId);
    lhs = typeCast(builder, lhs, destType, lhsTypeId, resultTypeId);
    rhs = typeCast(builder, rhs, destType, rhsTypeId, resultTypeId);
    return true;
  } else if (isFloatingTypeId(lhsTypeId) || isFloatingTypeId(rhsTypeId)) {
    resultTypeId = usualArithmeticConversion(lhsTypeId, rhsTypeId, isUnsigned);
    llvm::Type* destType = llvmTypeForTypeId(builder, resultTypeId);
    lhs = typeCast(builder, lhs, destType, lhsTypeId, resultTypeId);
    rhs = typeCast(builder, rhs, destType, rhsTypeId, resultTypeId);
    return true;
  } else if (lhs->getType()->isIntegerTy() &&
             rhs->getType()->isFloatingPointTy()) {
    resultTypeId = usualArithmeticConversion(lhsTypeId, rhsTypeId, isUnsigned);
    lhs = typeCast(builder, lhs, llvmTypeForTypeId(builder, resultTypeId),
                   lhsTypeId, resultTypeId);
    return true;
  } else if (lhs->getType()->isFloatingPointTy() &&
             rhs->getType()->isIntegerTy()) {
    resultTypeId = usualArithmeticConversion(lhsTypeId, rhsTypeId, isUnsigned);
    rhs = typeCast(builder, rhs, llvmTypeForTypeId(builder, resultTypeId),
                   rhsTypeId, resultTypeId);
    return true;
  }

  return false;
}

llvm::AllocaInst* Utils::createEntryBlockAlloca(llvm::Function* func,
                                                const std::string& varName,
                                                llvm::Type* varType) {
  llvm::IRBuilder<> builder(&func->getEntryBlock(),
                            func->getEntryBlock().begin());
  return builder.CreateAlloca(varType, nullptr, varName);
}

llvm::BranchInst* Utils::terminateBlockByBr(llvm::IRBuilder<>& builder,
                                            llvm::BasicBlock* basicBlock) {
  if (!builder.GetInsertBlock()->getTerminator()) {
    return builder.CreateBr(basicBlock);
  }

  return nullptr;
}

llvm::Value* Utils::createIntegerCmp(llvm::IRBuilder<>& builder, IntCmpPred pred,
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

llvm::Value* Utils::createCmpEq(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                                llvm::Value* rhs, BuiltinType::TypeId lhsTypeId,
                                BuiltinType::TypeId rhsTypeId) {
  bool isUnsigned = false;
  BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
  if (Utils::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                         isUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return builder.CreateICmpEQ(lhs, rhs);
    } else {
      return builder.CreateFCmpOEQ(lhs, rhs);
    }
  }

  if (lhs->getType()->isPointerTy() && lhs->getType() == rhs->getType()) {
    return builder.CreateICmpEQ(
        builder.CreatePtrToInt(lhs, builder.getInt64Ty()),
        builder.CreatePtrToInt(rhs, builder.getInt64Ty()));
  } else if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return builder.CreateICmpEQ(
        builder.CreatePtrToInt(lhs, builder.getInt64Ty()),
        Utils::typeUpgrade(builder, rhs, builder.getInt64Ty(), rhsTypeId,
                           BuiltinType::TypeId::ULONG));
  } else if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return builder.CreateICmpEQ(
        Utils::typeUpgrade(builder, lhs, builder.getInt64Ty(), lhsTypeId,
                           BuiltinType::TypeId::ULONG),
        builder.CreatePtrToInt(rhs, builder.getInt64Ty()));
  }

  throw std::domain_error("Unsupported types for \"==\" comparision!");
}

// lhs is a pointer from genCodePtr(); load the pointee (arrays decay to element ptr).
llvm::Value* Utils::createLoad(llvm::IRBuilder<>& builder, llvm::Value* lhs) {
  if (lhs->getType()->getNonOpaquePointerElementType()->isArrayTy()) {
    return builder.CreatePointerCast(
        lhs, lhs->getType()
                 ->getNonOpaquePointerElementType()
                 ->getArrayElementType()
                 ->getPointerTo());
  }

  return builder.CreateLoad(lhs->getType()->getNonOpaquePointerElementType(),
                            lhs);
}

llvm::Value* Utils::createAssign(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                                 llvm::Value* rhs, BuiltinType::TypeId srcTypeId,
                                 BuiltinType::TypeId dstTypeId) {
  rhs = Utils::typeCast(builder, rhs,
                        lhs->getType()->getNonOpaquePointerElementType(),
                        srcTypeId, dstTypeId);
  if (rhs == nullptr) {
    throw std::domain_error(
        "Assign with values that can not be cast to the target type!");
  }

  builder.CreateStore(rhs, lhs);
  return lhs;
}

llvm::Value* Utils::createAdd(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, BuiltinType::TypeId lhsTypeId,
                              BuiltinType::TypeId rhsTypeId) {
  if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return builder.CreateGEP(lhs->getType()->getNonOpaquePointerElementType(),
                             lhs, rhs);
  }

  if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return builder.CreateGEP(rhs->getType()->getNonOpaquePointerElementType(),
                           rhs, lhs);
  }

  bool isUnsigned = false;
  BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
  if (typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                  isUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return builder.CreateAdd(lhs, rhs);
    } else {
      return builder.CreateFAdd(lhs, rhs);
    }
  }

  throw std::logic_error("Add with unsupported types!");
}

llvm::Value* Utils::createSub(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, BuiltinType::TypeId lhsTypeId,
                              BuiltinType::TypeId rhsTypeId) {
  if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return builder.CreateGEP(lhs->getType()->getNonOpaquePointerElementType(),
                             lhs, builder.CreateNeg(rhs));
  }

  if (lhs->getType()->isPointerTy() && lhs->getType() == rhs->getType()) {
    return builder.CreatePtrDiff(
        lhs->getType()->getNonOpaquePointerElementType(), lhs, rhs);
  }

  bool isUnsigned = false;
  BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
  if (typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                  isUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return builder.CreateSub(lhs, rhs);
    } else {
      return builder.CreateFSub(lhs, rhs);
    }
  }

  throw std::logic_error("Sub with unsupported types!");
}

llvm::Value* Utils::createMul(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, BuiltinType::TypeId lhsTypeId,
                              BuiltinType::TypeId rhsTypeId) {
  bool isUnsigned = false;
  BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
  if (typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                  isUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return builder.CreateMul(lhs, rhs);
    } else {
      return builder.CreateFMul(lhs, rhs);
    }
  }

  throw std::logic_error("Mul with unsupported types!");
}

// isUnsigned selects udiv/urem/lshr vs sdiv/srem/ashr for integer operands.
llvm::Value* Utils::createDiv(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, BuiltinType::TypeId lhsTypeId,
                              BuiltinType::TypeId rhsTypeId, bool isUnsigned) {
  bool unusedUnsigned = false;
  BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
  if (typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                  unusedUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return isUnsigned ? builder.CreateUDiv(lhs, rhs)
                        : builder.CreateSDiv(lhs, rhs);
    } else {
      return builder.CreateFDiv(lhs, rhs);
    }
  }

  throw std::logic_error("Div with unsupported types!");
}

llvm::Value* Utils::createMod(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, BuiltinType::TypeId lhsTypeId,
                              BuiltinType::TypeId rhsTypeId, bool isUnsigned) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool unusedUnsigned = false;
    BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
    if (Utils::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           unusedUnsigned)) {
      return isUnsigned ? builder.CreateURem(lhs, rhs)
                        : builder.CreateSRem(lhs, rhs);
    }
  }

  throw std::domain_error("Mod should operate on 2 integers!");
}

llvm::Value* Utils::createBitwiseAnd(llvm::IRBuilder<>& builder,
                                     llvm::Value* lhs, llvm::Value* rhs,
                                     BuiltinType::TypeId lhsTypeId,
                                     BuiltinType::TypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
    if (Utils::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           isUnsigned)) {
      return builder.CreateAnd(lhs, rhs);
    }
  }

  throw std::domain_error("Bitwise AND should operate on 2 integers!");
}

llvm::Value* Utils::createBitwiseOr(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                                    llvm::Value* rhs,
                                    BuiltinType::TypeId lhsTypeId,
                                    BuiltinType::TypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
    if (Utils::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           isUnsigned)) {
      return builder.CreateOr(lhs, rhs);
    }
  }

  throw std::domain_error("Bitwise OR should operate on 2 integers!");
}

llvm::Value* Utils::createBitwiseXor(llvm::IRBuilder<>& builder,
                                      llvm::Value* lhs, llvm::Value* rhs,
                                      BuiltinType::TypeId lhsTypeId,
                                      BuiltinType::TypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
    if (Utils::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           isUnsigned)) {
      return builder.CreateXor(lhs, rhs);
    }
  }

  throw std::domain_error("Bitwise XOR should operate on 2 integers!");
}

llvm::Value* Utils::createShl(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, BuiltinType::TypeId lhsTypeId,
                              BuiltinType::TypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
    if (Utils::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           isUnsigned)) {
      return builder.CreateShl(lhs, rhs);
    }
  }

  throw std::domain_error("SHL should operate on 2 integers!");
}

llvm::Value* Utils::createShr(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, BuiltinType::TypeId lhsTypeId,
                              BuiltinType::TypeId rhsTypeId, bool isUnsigned) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool unusedUnsigned = false;
    BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
    if (Utils::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           unusedUnsigned)) {
      return isUnsigned ? builder.CreateLShr(lhs, rhs)
                        : builder.CreateAShr(lhs, rhs);
    }
  }

  throw std::domain_error("SHR should operate on 2 integers!");
}

llvm::Value* Utils::getOneValue(llvm::IRBuilder<>& builder,
                                size_t valueBitWidth) {
  switch (valueBitWidth) {
    case 1:
      return builder.getInt1(1);
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
