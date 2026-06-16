#include "Utils.hpp"

#include <exception>
#include <fstream>
#include <iostream>

#include "CodeGenerator.hpp"

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

llvm::Type* Utils::llvmTypeForTypeId(BuiltinType::TypeId typeId) {
  switch (typeId) {
    case BuiltinType::TypeId::CHAR:
    case BuiltinType::TypeId::UCHAR:
      return g_builder.getInt8Ty();
    case BuiltinType::TypeId::SHORT:
    case BuiltinType::TypeId::USHORT:
      return g_builder.getInt16Ty();
    case BuiltinType::TypeId::INT:
    case BuiltinType::TypeId::UINT:
      return g_builder.getInt32Ty();
    case BuiltinType::TypeId::LONG:
    case BuiltinType::TypeId::ULONG:
      return g_builder.getInt64Ty();
    case BuiltinType::TypeId::FLOAT:
      return g_builder.getFloatTy();
    case BuiltinType::TypeId::DOUBLE:
      return g_builder.getDoubleTy();
    case BuiltinType::TypeId::BOOL:
      return g_builder.getInt1Ty();
    default:
      return nullptr;
  }
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

llvm::Value* Utils::typeCast(llvm::Value* value, llvm::Type* type,
                             BuiltinType::TypeId srcTypeId,
                             BuiltinType::TypeId dstTypeId) {
  if (value->getType() == type) {
    return value;
  } else if (type == g_builder.getInt1Ty()) {
    return Utils::castToBool(value);
  } else if (value->getType()->isIntegerTy() && type->isIntegerTy()) {
    bool isSigned = isSrcSignedForCast(srcTypeId) && isDstSignedForCast(dstTypeId);
    return g_builder.CreateIntCast(value, type, isSigned);
  } else if (value->getType()->isIntegerTy() && type->isFloatingPointTy()) {
    if (srcTypeId == BuiltinType::TypeId::BOOL ||
        isUnsignedTypeId(srcTypeId)) {
      return g_builder.CreateUIToFP(value, type);
    }
    return g_builder.CreateSIToFP(value, type);
  } else if (value->getType()->isIntegerTy() && type->isPointerTy()) {
    return g_builder.CreateIntToPtr(value, type);
  } else if (value->getType()->isFloatingPointTy() && type->isIntegerTy()) {
    if (isUnsignedTypeId(dstTypeId)) {
      return g_builder.CreateFPToUI(value, type);
    }
    return g_builder.CreateFPToSI(value, type);
  } else if (value->getType()->isFloatingPointTy() &&
             type->isFloatingPointTy()) {
    return g_builder.CreateFPCast(value, type);
  } else if (value->getType()->isPointerTy() && type->isIntegerTy()) {
    return g_builder.CreatePtrToInt(value, type);
  } else if (value->getType()->isPointerTy() && type->isPointerTy()) {
    return g_builder.CreatePointerCast(value, type);
  } else {
    return nullptr;
  }
}

llvm::Value* Utils::castToBool(llvm::Value* value) {
  if (value->getType() == g_builder.getInt1Ty()) {
    return value;
  } else if (value->getType()->isIntegerTy()) {
    return g_builder.CreateICmpNE(
        value,
        llvm::ConstantInt::get((llvm::IntegerType*)value->getType(), 0, true));
  } else if (value->getType()->isFloatingPointTy()) {
    return g_builder.CreateFCmpONE(
        value, llvm::ConstantFP::get(value->getType(), 0.0));
  } else if (value->getType()->isPointerTy()) {
    return g_builder.CreateICmpNE(
        g_builder.CreatePtrToInt(value, g_builder.getInt64Ty()),
        g_builder.getInt64(0));
  } else {
    throw std::logic_error("The variable/value can not cast to bool type.");
  }
}

llvm::Value* Utils::typeUpgrade(llvm::Value* value, llvm::Type* type,
                                BuiltinType::TypeId srcTypeId,
                                BuiltinType::TypeId dstTypeId) {
  if (value->getType()->isIntegerTy() && type->isIntegerTy()) {
    size_t valueBitWidth =
        ((llvm::IntegerType*)value->getType())->getBitWidth();
    size_t typeBitWidth = ((llvm::IntegerType*)type)->getBitWidth();
    if (valueBitWidth < typeBitWidth) {
      return typeCast(value, type, srcTypeId, dstTypeId);
    }

    return value;
  } else if (value->getType()->isFloatingPointTy() &&
             type->isFloatingPointTy()) {
    if (value->getType()->isFloatTy() && type->isDoubleTy()) {
      return g_builder.CreateFPCast(value, type);
    }

    return value;
  } else if (value->getType()->isIntegerTy() && type->isFloatingPointTy()) {
    return typeCast(value, type, srcTypeId, dstTypeId);
  } else if (value->getType()->isFloatingPointTy() && type->isIntegerTy()) {
    return value;
  } else {
    return nullptr;
  }
}

bool Utils::typeUpgrade(llvm::Value*& lhs, llvm::Value*& rhs,
                        BuiltinType::TypeId lhsTypeId,
                        BuiltinType::TypeId rhsTypeId,
                        BuiltinType::TypeId& resultTypeId, bool& isUnsigned) {
  if (isIntegerTypeId(lhsTypeId) && isIntegerTypeId(rhsTypeId)) {
    resultTypeId = usualArithmeticConversion(lhsTypeId, rhsTypeId, isUnsigned);
    llvm::Type* destType = llvmTypeForTypeId(resultTypeId);
    lhs = typeCast(lhs, destType, lhsTypeId, resultTypeId);
    rhs = typeCast(rhs, destType, rhsTypeId, resultTypeId);
    return true;
  } else if (isFloatingTypeId(lhsTypeId) || isFloatingTypeId(rhsTypeId)) {
    resultTypeId = usualArithmeticConversion(lhsTypeId, rhsTypeId, isUnsigned);
    llvm::Type* destType = llvmTypeForTypeId(resultTypeId);
    lhs = typeCast(lhs, destType, lhsTypeId, resultTypeId);
    rhs = typeCast(rhs, destType, rhsTypeId, resultTypeId);
    return true;
  } else if (lhs->getType()->isIntegerTy() &&
             rhs->getType()->isFloatingPointTy()) {
    resultTypeId = usualArithmeticConversion(lhsTypeId, rhsTypeId, isUnsigned);
    lhs = typeCast(lhs, llvmTypeForTypeId(resultTypeId), lhsTypeId, resultTypeId);
    return true;
  } else if (lhs->getType()->isFloatingPointTy() &&
             rhs->getType()->isIntegerTy()) {
    resultTypeId = usualArithmeticConversion(lhsTypeId, rhsTypeId, isUnsigned);
    rhs = typeCast(rhs, llvmTypeForTypeId(resultTypeId), rhsTypeId, resultTypeId);
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

llvm::BranchInst* Utils::terminateBlockByBr(llvm::BasicBlock* basicBlock) {
  if (!g_builder.GetInsertBlock()->getTerminator()) {
    return g_builder.CreateBr(basicBlock);
  }

  return nullptr;
}

llvm::Value* Utils::createIntegerCmp(IntCmpPred pred, llvm::Value* lhs,
                                     llvm::Value* rhs, bool isUnsigned) {
  switch (pred) {
    case IntCmpPred::EQ:
      return g_builder.CreateICmpEQ(lhs, rhs);
    case IntCmpPred::NE:
      return g_builder.CreateICmpNE(lhs, rhs);
    case IntCmpPred::LT:
      return isUnsigned ? g_builder.CreateICmpULT(lhs, rhs)
                        : g_builder.CreateICmpSLT(lhs, rhs);
    case IntCmpPred::LE:
      return isUnsigned ? g_builder.CreateICmpULE(lhs, rhs)
                        : g_builder.CreateICmpSLE(lhs, rhs);
    case IntCmpPred::GT:
      return isUnsigned ? g_builder.CreateICmpUGT(lhs, rhs)
                        : g_builder.CreateICmpSGT(lhs, rhs);
    case IntCmpPred::GE:
      return isUnsigned ? g_builder.CreateICmpUGE(lhs, rhs)
                        : g_builder.CreateICmpSGE(lhs, rhs);
  }

  return nullptr;
}

llvm::Value* Utils::createCmpEq(llvm::Value* lhs, llvm::Value* rhs,
                                BuiltinType::TypeId lhsTypeId,
                                BuiltinType::TypeId rhsTypeId) {
  // Arithmetic comparision.
  bool isUnsigned = false;
  BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
  if (Utils::typeUpgrade(lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                         isUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return g_builder.CreateICmpEQ(lhs, rhs);
    } else {
      return g_builder.CreateFCmpOEQ(lhs, rhs);
    }
  }

  // Pointer comparision.
  if (lhs->getType()->isPointerTy() && lhs->getType() == rhs->getType()) {
    return g_builder.CreateICmpEQ(
        g_builder.CreatePtrToInt(lhs, g_builder.getInt64Ty()),
        g_builder.CreatePtrToInt(rhs, g_builder.getInt64Ty()));
  } else if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return g_builder.CreateICmpEQ(
        g_builder.CreatePtrToInt(lhs, g_builder.getInt64Ty()),
        Utils::typeUpgrade(rhs, g_builder.getInt64Ty(), rhsTypeId,
                           BuiltinType::TypeId::ULONG));
  } else if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return g_builder.CreateICmpEQ(
        Utils::typeUpgrade(lhs, g_builder.getInt64Ty(), lhsTypeId,
                           BuiltinType::TypeId::ULONG),
        g_builder.CreatePtrToInt(rhs, g_builder.getInt64Ty()));
  }

  throw std::domain_error("Unsupported types for \"==\" comparision!");
}

llvm::Value* Utils::createLoad(llvm::Value* lhs, CodeGenerator& generator) {
  if (lhs->getType()->getNonOpaquePointerElementType()->isArrayTy()) {
    return g_builder.CreatePointerCast(lhs,
                                       lhs->getType()
                                           ->getNonOpaquePointerElementType()
                                           ->getArrayElementType()
                                           ->getPointerTo());
  }

  return g_builder.CreateLoad(lhs->getType()->getNonOpaquePointerElementType(),
                              lhs);
}

llvm::Value* Utils::createAssign(llvm::Value* lhs, llvm::Value* rhs,
                                 CodeGenerator& generator,
                                 BuiltinType::TypeId srcTypeId,
                                 BuiltinType::TypeId dstTypeId) {
  rhs = Utils::typeCast(rhs, lhs->getType()->getNonOpaquePointerElementType(),
                        srcTypeId, dstTypeId);
  if (rhs == nullptr) {
    throw std::domain_error(
        "Assign with values that can not be cast to the target type!");
  }

  g_builder.CreateStore(rhs, lhs);
  return lhs;
}

llvm::Value* Utils::createAdd(llvm::Value* lhs, llvm::Value* rhs,
                              BuiltinType::TypeId lhsTypeId,
                              BuiltinType::TypeId rhsTypeId,
                              CodeGenerator& generator) {
  if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return g_builder.CreateGEP(lhs->getType()->getNonOpaquePointerElementType(),
                               lhs, rhs);
  }

  if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return g_builder.CreateGEP(rhs->getType()->getNonOpaquePointerElementType(),
                               rhs, lhs);
  }

  bool isUnsigned = false;
  BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
  if (typeUpgrade(lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId, isUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return g_builder.CreateAdd(lhs, rhs);
    } else {
      return g_builder.CreateFAdd(lhs, rhs);
    }
  }

  throw std::logic_error("Add with unsupported types!");
}

llvm::Value* Utils::createSub(llvm::Value* lhs, llvm::Value* rhs,
                              BuiltinType::TypeId lhsTypeId,
                              BuiltinType::TypeId rhsTypeId,
                              CodeGenerator& generator) {
  if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return g_builder.CreateGEP(lhs->getType()->getNonOpaquePointerElementType(),
                               lhs, g_builder.CreateNeg(rhs));
  }

  if (lhs->getType()->isPointerTy() && lhs->getType() == rhs->getType()) {
    return g_builder.CreatePtrDiff(
        lhs->getType()->getNonOpaquePointerElementType(), lhs, rhs);
  }

  bool isUnsigned = false;
  BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
  if (typeUpgrade(lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId, isUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return g_builder.CreateSub(lhs, rhs);
    } else {
      return g_builder.CreateFSub(lhs, rhs);
    }
  }

  throw std::logic_error("Sub with unsupported types!");
}

llvm::Value* Utils::createMul(llvm::Value* lhs, llvm::Value* rhs,
                              BuiltinType::TypeId lhsTypeId,
                              BuiltinType::TypeId rhsTypeId,
                              CodeGenerator& generator) {
  bool isUnsigned = false;
  BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
  if (typeUpgrade(lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId, isUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return g_builder.CreateMul(lhs, rhs);
    } else {
      return g_builder.CreateFMul(lhs, rhs);
    }
  }

  throw std::logic_error("Mul with unsupported types!");
}

llvm::Value* Utils::createDiv(llvm::Value* lhs, llvm::Value* rhs,
                              BuiltinType::TypeId lhsTypeId,
                              BuiltinType::TypeId rhsTypeId, bool isUnsigned,
                              CodeGenerator& generator) {
  bool unusedUnsigned = false;
  BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
  if (typeUpgrade(lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                  unusedUnsigned)) {
    if (lhs->getType()->isIntegerTy()) {
      return isUnsigned ? g_builder.CreateUDiv(lhs, rhs)
                        : g_builder.CreateSDiv(lhs, rhs);
    } else {
      return g_builder.CreateFDiv(lhs, rhs);
    }
  }

  throw std::logic_error("Div with unsupported types!");
}

llvm::Value* Utils::createMod(llvm::Value* lhs, llvm::Value* rhs,
                              BuiltinType::TypeId lhsTypeId,
                              BuiltinType::TypeId rhsTypeId, bool isUnsigned,
                              CodeGenerator& generator) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool unusedUnsigned = false;
    BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
    if (Utils::typeUpgrade(lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           unusedUnsigned)) {
      return isUnsigned ? g_builder.CreateURem(lhs, rhs)
                        : g_builder.CreateSRem(lhs, rhs);
    }
  }

  throw std::domain_error("Mod should operate on 2 integers!");
}

llvm::Value* Utils::createBitwiseAnd(llvm::Value* lhs, llvm::Value* rhs,
                                     BuiltinType::TypeId lhsTypeId,
                                     BuiltinType::TypeId rhsTypeId,
                                     CodeGenerator& generator) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
    if (Utils::typeUpgrade(lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           isUnsigned)) {
      return g_builder.CreateAnd(lhs, rhs);
    }
  }

  throw std::domain_error("Bitwise AND should operate on 2 integers!");
}

llvm::Value* Utils::createBitwiseOr(llvm::Value* lhs, llvm::Value* rhs,
                                    BuiltinType::TypeId lhsTypeId,
                                    BuiltinType::TypeId rhsTypeId,
                                    CodeGenerator& generator) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
    if (Utils::typeUpgrade(lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           isUnsigned)) {
      return g_builder.CreateOr(lhs, rhs);
    }
  }

  throw std::domain_error("Bitwise OR should operate on 2 integers!");
}

llvm::Value* Utils::createBitwiseXor(llvm::Value* lhs, llvm::Value* rhs,
                                     BuiltinType::TypeId lhsTypeId,
                                     BuiltinType::TypeId rhsTypeId,
                                     CodeGenerator& generator) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
    if (Utils::typeUpgrade(lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           isUnsigned)) {
      return g_builder.CreateXor(lhs, rhs);
    }
  }

  throw std::domain_error("Bitwise XOR should operate on 2 integers!");
}

llvm::Value* Utils::createShl(llvm::Value* lhs, llvm::Value* rhs,
                              BuiltinType::TypeId lhsTypeId,
                              BuiltinType::TypeId rhsTypeId,
                              CodeGenerator& generator) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
    if (Utils::typeUpgrade(lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           isUnsigned)) {
      return g_builder.CreateShl(lhs, rhs);
    }
  }

  throw std::domain_error("SHL should operate on 2 integers!");
}

llvm::Value* Utils::createShr(llvm::Value* lhs, llvm::Value* rhs,
                              BuiltinType::TypeId lhsTypeId,
                              BuiltinType::TypeId rhsTypeId, bool isUnsigned,
                              CodeGenerator& generator) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool unusedUnsigned = false;
    BuiltinType::TypeId resultTypeId = BuiltinType::TypeId::UNKNOWN;
    if (Utils::typeUpgrade(lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           unusedUnsigned)) {
      return isUnsigned ? g_builder.CreateLShr(lhs, rhs)
                        : g_builder.CreateAShr(lhs, rhs);
    }
  }

  throw std::domain_error("SHR should operate on 2 integers!");
}

void Utils::dumpAbstractSyntaxTree(const std::string& fileName,
                                   const std::string& graph) {
  if (fileName.empty()) {
    return;
  }

  std::ofstream graphFile(fileName);
  if (graphFile.is_open()) {
    graphFile << graph;
  } else {
    std::cerr << "Failed to open file " << fileName << std::endl;
  }
}

llvm::Value* Utils::getOneValue(size_t valueBitWidth) {
  switch (valueBitWidth) {
    case 1:
      return g_builder.getInt1(1);
    case 8:
      return g_builder.getInt8(1);
    case 16:
      return g_builder.getInt16(1);
    case 32:
      return g_builder.getInt32(1);
    case 64:
      return g_builder.getInt64(1);
    default:
      return g_builder.getInt32(1);
  }
}
