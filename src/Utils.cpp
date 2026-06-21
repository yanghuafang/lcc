#include "Utils.hpp"

#include <exception>
#include <iostream>

#include <llvm/IR/IRBuilder.h>

#include "AbstractSyntaxTree.hpp"
#include "CodeGenerator.hpp"

using AST::BuiltinType;
using AST::BuiltinTypeId;

namespace {

bool isIntegerTypeId(BuiltinTypeId typeId) {
  switch (typeId) {
    case BuiltinTypeId::CHAR:
    case BuiltinTypeId::SHORT:
    case BuiltinTypeId::INT:
    case BuiltinTypeId::LONG:
    case BuiltinTypeId::UCHAR:
    case BuiltinTypeId::USHORT:
    case BuiltinTypeId::UINT:
    case BuiltinTypeId::ULONG:
    case BuiltinTypeId::BOOL:
      return true;
    default:
      return false;
  }
}

bool isFloatingTypeId(BuiltinTypeId typeId) {
  return typeId == BuiltinTypeId::FLOAT ||
         typeId == BuiltinTypeId::DOUBLE;
}

bool isSrcSignedForCast(BuiltinTypeId srcTypeId) {
  if (srcTypeId == BuiltinTypeId::UNKNOWN) {
    return true;
  }
  return !Utils::isUnsignedTypeId(srcTypeId) &&
         srcTypeId != BuiltinTypeId::BOOL;
}

bool isDstSignedForCast(BuiltinTypeId dstTypeId) {
  if (dstTypeId == BuiltinTypeId::UNKNOWN) {
    return true;
  }
  return !Utils::isUnsignedTypeId(dstTypeId);
}

llvm::Type* llvmTypeForTypeId(llvm::IRBuilder<>& builder,
                              BuiltinTypeId typeId) {
  switch (typeId) {
    case BuiltinTypeId::CHAR:
    case BuiltinTypeId::UCHAR:
      return builder.getInt8Ty();
    case BuiltinTypeId::SHORT:
    case BuiltinTypeId::USHORT:
      return builder.getInt16Ty();
    case BuiltinTypeId::INT:
    case BuiltinTypeId::UINT:
      return builder.getInt32Ty();
    case BuiltinTypeId::LONG:
    case BuiltinTypeId::ULONG:
      return builder.getInt64Ty();
    case BuiltinTypeId::FLOAT:
      return builder.getFloatTy();
    case BuiltinTypeId::DOUBLE:
      return builder.getDoubleTy();
    case BuiltinTypeId::BOOL:
      return builder.getInt1Ty();
    default:
      return nullptr;
  }
}

}  // namespace

bool Utils::isUnsignedTypeId(BuiltinTypeId typeId) {
  switch (typeId) {
    case BuiltinTypeId::UCHAR:
    case BuiltinTypeId::USHORT:
    case BuiltinTypeId::UINT:
    case BuiltinTypeId::ULONG:
      return true;
    default:
      return false;
  }
}

BuiltinTypeId Utils::integerPromotion(BuiltinTypeId typeId) {
  switch (typeId) {
    case BuiltinTypeId::CHAR:
    case BuiltinTypeId::SHORT:
    case BuiltinTypeId::UCHAR:
    case BuiltinTypeId::USHORT:
    case BuiltinTypeId::BOOL:
      return BuiltinTypeId::INT;
    default:
      return typeId;
  }
}

// C usual arithmetic conversions (simplified): integer promotion, then if either
// operand is unsigned the result is unsigned, with long/double rules as in C.
BuiltinTypeId Utils::usualArithmeticConversion(
    BuiltinTypeId lhsTypeId, BuiltinTypeId rhsTypeId,
    bool& isUnsigned) {
  lhsTypeId = integerPromotion(lhsTypeId);
  rhsTypeId = integerPromotion(rhsTypeId);

  if (isFloatingTypeId(lhsTypeId) || isFloatingTypeId(rhsTypeId)) {
    isUnsigned = false;
    return BuiltinTypeId::DOUBLE;
  }

  if (lhsTypeId == BuiltinTypeId::ULONG ||
      rhsTypeId == BuiltinTypeId::ULONG) {
    isUnsigned = true;
    return BuiltinTypeId::ULONG;
  }
  if (lhsTypeId == BuiltinTypeId::LONG ||
      rhsTypeId == BuiltinTypeId::LONG) {
    if (isUnsignedTypeId(lhsTypeId) || isUnsignedTypeId(rhsTypeId)) {
      isUnsigned = true;
      return BuiltinTypeId::ULONG;
    }
    isUnsigned = false;
    return BuiltinTypeId::LONG;
  }
  if (isUnsignedTypeId(lhsTypeId) || isUnsignedTypeId(rhsTypeId)) {
    isUnsigned = true;
    return BuiltinTypeId::UINT;
  }

  isUnsigned = false;
  return BuiltinTypeId::INT;
}

BuiltinTypeId Utils::varTypeToTypeId(AST::VarType* varType) {
  if (varType == nullptr) {
    return BuiltinTypeId::UNKNOWN;
  }

  if (varType->isBuiltinType()) {
    return static_cast<AST::BuiltinType*>(varType)->typeId_;
  }
  if (varType->isEnumType()) {
    return BuiltinTypeId::INT;
  }
  if (varType->isArrayType()) {
    return varTypeToTypeId(
        static_cast<AST::ArrayType*>(varType)->baseType_);
  }

  return BuiltinTypeId::UNKNOWN;
}

// Follow typedef aliases on DefinedType nodes. Stop when unmapped or when the alias
// is the same node (e.g. "typedef struct Employee Employee") so getType() can resolve
// the struct tag instead of looping forever.
AST::VarType* Utils::resolveTypedefVarType(AST::VarType* varType,
                                           CodeGenerator& generator) {
  if (varType == nullptr) {
    return nullptr;
  }

  while (varType != nullptr && varType->isDefinedType()) {
    AST::VarType* alias = generator.findTypedefAlias(varType->typeName_);
    if (alias == nullptr || alias == varType) {
      break;
    }
    varType = alias;
  }

  return varType;
}

BuiltinTypeId Utils::resolvedVarTypeToTypeId(AST::VarType* varType,
                                           CodeGenerator& generator) {
  return varTypeToTypeId(resolveTypedefVarType(varType, generator));
}

llvm::Type* Utils::opaquePointerType(llvm::LLVMContext& context,
                                      unsigned addressSpace) {
  return llvm::PointerType::get(context, addressSpace);
}

llvm::Type* Utils::pointerArithmeticElementType(AST::VarType* ptrExprVarType,
                                                CodeGenerator& generator) {
  AST::VarType* resolved = resolveTypedefVarType(ptrExprVarType, generator);
  if (resolved == nullptr) {
    throw std::logic_error("Pointer arithmetic requires a known expression type.");
  }

  if (resolved->isPointerType()) {
    return static_cast<AST::PointerType*>(resolved)
        ->baseType_->getType(generator);
  }
  if (resolved->isArrayType()) {
    return static_cast<AST::ArrayType*>(resolved)
        ->baseType_->getType(generator);
  }
  if (resolved->isStructType() || resolved->isUnionType()) {
    return resolved->getType(generator);
  }

  throw std::logic_error("Pointer arithmetic requires pointer or array type.");
}

// Load/store element type from AST. Pointer lvalues use opaque ptr in IR; concrete
// struct/scalar types are returned for direct allocas and non-pointer locations.
llvm::Type* Utils::memoryAccessType(AST::VarType* lvalueVarType,
                                    CodeGenerator& generator) {
  AST::VarType* resolved = resolveTypedefVarType(lvalueVarType, generator);
  if (resolved == nullptr) {
    throw std::logic_error("Load/store requires a known lvalue type.");
  }

  if (resolved->isArrayType()) {
    return resolved->getType(generator);
  }
  if (resolved->isPointerType()) {
    return opaquePointerType(generator.getContext());
  }

  return resolved->getType(generator);
}

llvm::Value* Utils::typeCast(llvm::IRBuilder<>& builder, llvm::Value* value,
                             llvm::Type* type, BuiltinTypeId srcTypeId,
                             BuiltinTypeId dstTypeId) {
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
    if (srcTypeId == BuiltinTypeId::BOOL ||
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
                                BuiltinTypeId srcTypeId,
                                BuiltinTypeId dstTypeId) {
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
                        llvm::Value*& rhs, BuiltinTypeId lhsTypeId,
                        BuiltinTypeId rhsTypeId,
                        BuiltinTypeId& resultTypeId, bool& isUnsigned) {
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
                                llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                                BuiltinTypeId rhsTypeId) {
  bool isUnsigned = false;
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
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
                           BuiltinTypeId::ULONG));
  } else if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return builder.CreateICmpEQ(
        Utils::typeUpgrade(builder, lhs, builder.getInt64Ty(), lhsTypeId,
                           BuiltinTypeId::ULONG),
        builder.CreatePtrToInt(rhs, builder.getInt64Ty()));
  }

  throw std::domain_error("Unsupported types for \"==\" comparison!");
}

// ptr is from genCodePtr(); lvalueVarType is the C type of that location.
llvm::Value* Utils::createLoad(llvm::IRBuilder<>& builder, llvm::Value* ptr,
                               AST::VarType* lvalueVarType,
                               CodeGenerator& generator) {
  AST::VarType* resolved = resolveTypedefVarType(lvalueVarType, generator);
  if (resolved == nullptr) {
    throw std::logic_error("Load requires a known lvalue type.");
  }

  // Array rvalue: decay storage pointer to opaque pointer-to-element (no load).
  if (resolved->isArrayType()) {
    return builder.CreatePointerCast(
        ptr, opaquePointerType(generator.getContext()));
  }

  llvm::Type* pointeeTy = memoryAccessType(resolved, generator);
  return builder.CreateLoad(pointeeTy, ptr);
}

llvm::Value* Utils::createAssign(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                                 llvm::Value* rhs, AST::VarType* lhsVarType,
                                 CodeGenerator& generator,
                                 BuiltinTypeId srcTypeId,
                                 BuiltinTypeId dstTypeId) {
  llvm::Type* storeTy = memoryAccessType(lhsVarType, generator);
  rhs = Utils::typeCast(builder, rhs, storeTy, srcTypeId, dstTypeId);
  if (rhs == nullptr) {
    throw std::domain_error(
        "Assign with values that can not be cast to the target type!");
  }

  builder.CreateStore(rhs, lhs);
  return lhs;
}

llvm::Value* Utils::createAdd(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, AST::VarType* lhsVarType,
                              AST::VarType* rhsVarType,
                              CodeGenerator& generator,
                              BuiltinTypeId lhsTypeId,
                              BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    llvm::Type* elementTy =
        pointerArithmeticElementType(lhsVarType, generator);
    return builder.CreateGEP(elementTy, lhs, rhs);
  }

  if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    llvm::Type* elementTy =
        pointerArithmeticElementType(rhsVarType, generator);
    return builder.CreateGEP(elementTy, rhs, lhs);
  }

  bool isUnsigned = false;
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
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
                              llvm::Value* rhs, AST::VarType* lhsVarType,
                              AST::VarType* rhsVarType,
                              CodeGenerator& generator,
                              BuiltinTypeId lhsTypeId,
                              BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    llvm::Type* elementTy =
        pointerArithmeticElementType(lhsVarType, generator);
    return builder.CreateGEP(elementTy, lhs, builder.CreateNeg(rhs));
  }

  if (lhs->getType()->isPointerTy() && rhs->getType()->isPointerTy()) {
    llvm::Type* elementTy =
        pointerArithmeticElementType(lhsVarType, generator);
    return builder.CreatePtrDiff(elementTy, lhs, rhs);
  }

  bool isUnsigned = false;
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
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
                              llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                              BuiltinTypeId rhsTypeId) {
  bool isUnsigned = false;
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
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
                              llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                              BuiltinTypeId rhsTypeId, bool isUnsigned) {
  bool unusedUnsigned = false;
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
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
                              llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                              BuiltinTypeId rhsTypeId, bool isUnsigned) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool unusedUnsigned = false;
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
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
                                     BuiltinTypeId lhsTypeId,
                                     BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (Utils::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           isUnsigned)) {
      return builder.CreateAnd(lhs, rhs);
    }
  }

  throw std::domain_error("Bitwise AND should operate on 2 integers!");
}

llvm::Value* Utils::createBitwiseOr(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                                    llvm::Value* rhs,
                                    BuiltinTypeId lhsTypeId,
                                    BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (Utils::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           isUnsigned)) {
      return builder.CreateOr(lhs, rhs);
    }
  }

  throw std::domain_error("Bitwise OR should operate on 2 integers!");
}

llvm::Value* Utils::createBitwiseXor(llvm::IRBuilder<>& builder,
                                      llvm::Value* lhs, llvm::Value* rhs,
                                      BuiltinTypeId lhsTypeId,
                                      BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (Utils::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           isUnsigned)) {
      return builder.CreateXor(lhs, rhs);
    }
  }

  throw std::domain_error("Bitwise XOR should operate on 2 integers!");
}

llvm::Value* Utils::createShl(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                              BuiltinTypeId rhsTypeId) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool isUnsigned = false;
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (Utils::typeUpgrade(builder, lhs, rhs, lhsTypeId, rhsTypeId, resultTypeId,
                           isUnsigned)) {
      return builder.CreateShl(lhs, rhs);
    }
  }

  throw std::domain_error("SHL should operate on 2 integers!");
}

llvm::Value* Utils::createShr(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, BuiltinTypeId lhsTypeId,
                              BuiltinTypeId rhsTypeId, bool isUnsigned) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    bool unusedUnsigned = false;
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
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
