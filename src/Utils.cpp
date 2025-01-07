#include "Utils.hpp"

#include <exception>
#include <fstream>
#include <iostream>

#include "CodeGenerator.hpp"

llvm::Value* Utils::typeCast(llvm::Value* value, llvm::Type* type) {
  if (value->getType() == type) {
    return value;
  } else if (type == g_builder.getInt1Ty()) {
    return Utils::castToBool(value);
  } else if (value->getType()->isIntegerTy() && type->isIntegerTy()) {
    // Treat Int1(bool) as unsigned, treat other Integer types, such as Int8,
    // Int16, Int32, Int64... as signed.
    size_t i1BitWidth = 1;
    return g_builder.CreateIntCast(value, type,
                                   !value->getType()->isIntegerTy(i1BitWidth));
  } else if (value->getType()->isIntegerTy() && type->isFloatingPointTy()) {
    return value->getType()->isIntegerTy(1)
               ? g_builder.CreateUIToFP(value, type)
               : g_builder.CreateSIToFP(value, type);
  } else if (value->getType()->isIntegerTy() && type->isPointerTy()) {
    return g_builder.CreateIntToPtr(value, type);
  } else if (value->getType()->isFloatingPointTy() && type->isIntegerTy()) {
    return g_builder.CreateFPToSI(value, type);
  } else if (value->getType()->isFloatingPointTy() &&
             type->isFloatingPointTy()) {
    return g_builder.CreateFPCast(value, type);
  } else if (value->getType()->isPointerTy() && type->isIntegerTy()) {
    return g_builder.CreatePtrToInt(value, type);
  } else if (value->getType()->isPointerTy() && type->isPointerTy()) {
    return g_builder.CreatePointerCast(value, type);
  } else {
    return NULL;
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

llvm::Value* Utils::typeUpgrade(llvm::Value* value, llvm::Type* type) {
  if (value->getType()->isIntegerTy() && type->isIntegerTy()) {
    size_t valueBitWidth =
        ((llvm::IntegerType*)value->getType())->getBitWidth();
    size_t typeBitWidth = ((llvm::IntegerType*)type)->getBitWidth();
    if (valueBitWidth < typeBitWidth) {
      bool isSigned = valueBitWidth != 1;
      return g_builder.CreateIntCast(value, type, isSigned);
    }

    return value;
  } else if (value->getType()->isFloatingPointTy() &&
             type->isFloatingPointTy()) {
    if (value->getType()->isFloatTy() && type->isDoubleTy()) {
      return g_builder.CreateFPCast(value, type);
    }

    return value;
  } else if (value->getType()->isIntegerTy() && type->isFloatingPointTy()) {
    // Treat Int1(bool) as unsigned, treat other Integer types, such as Int8,
    // Int16, Int32, Int64... as signed.
    size_t i1BitWidth = 1;
    return value->getType()->isIntegerTy(i1BitWidth)
               ? g_builder.CreateUIToFP(value, type)
               : g_builder.CreateSIToFP(value, type);
  } else if (value->getType()->isFloatingPointTy() && type->isIntegerTy()) {
    return value;
  } else {
    return NULL;
  }
}

bool Utils::typeUpgrade(llvm::Value* lhs, llvm::Value* rhs) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    size_t lhsBitWidth = ((llvm::IntegerType*)lhs->getType())->getBitWidth();
    size_t rhsBitWidth = ((llvm::IntegerType*)rhs->getType())->getBitWidth();
    if (lhsBitWidth < rhsBitWidth) {
      bool isSigned = lhsBitWidth != 1;
      lhs = g_builder.CreateIntCast(lhs, rhs->getType(), isSigned);
    } else if (lhsBitWidth > rhsBitWidth) {
      bool isSigned = rhsBitWidth != 1;
      rhs = g_builder.CreateIntCast(rhs, lhs->getType(), isSigned);
    }

    return true;
  } else if (lhs->getType()->isFloatingPointTy() &&
             rhs->getType()->isFloatingPointTy()) {
    if (lhs->getType()->isFloatTy() && rhs->getType()->isDoubleTy()) {
      lhs = g_builder.CreateFPCast(lhs, g_builder.getDoubleTy());
    } else if (lhs->getType()->isDoubleTy() && rhs->getType()->isFloatTy()) {
      rhs = g_builder.CreateFPCast(rhs, g_builder.getDoubleTy());
    }

    return true;
  } else if (lhs->getType()->isIntegerTy() &&
             rhs->getType()->isFloatingPointTy()) {
    // Treat Int1(bool) as unsigned, treat other Integer types, such as Int8,
    // Int16, Int32, Int64... as signed.
    size_t i1BitWidth = 1;
    lhs = lhs->getType()->isIntegerTy(i1BitWidth)
              ? g_builder.CreateUIToFP(lhs, rhs->getType())
              : g_builder.CreateSIToFP(lhs, rhs->getType());
    return true;
  } else if (lhs->getType()->isFloatingPointTy() &&
             rhs->getType()->isIntegerTy()) {
    // Treat Int1(bool) as unsigned, treat other Integer types, such as Int8,
    // Int16, Int32, Int64... as signed.
    size_t i1BitWidth = 1;
    rhs = rhs->getType()->isIntegerTy(i1BitWidth)
              ? g_builder.CreateUIToFP(rhs, lhs->getType())
              : g_builder.CreateSIToFP(rhs, lhs->getType());
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

  return NULL;
}

llvm::Value* Utils::createCmpEq(llvm::Value* lhs, llvm::Value* rhs) {
  // Arithmetic comparision.
  if (Utils::typeUpgrade(lhs, rhs)) {
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
        Utils::typeUpgrade(rhs, g_builder.getInt64Ty()));
  } else if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return g_builder.CreateICmpEQ(
        Utils::typeUpgrade(lhs, g_builder.getInt64Ty()),
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
                                 CodeGenerator& generator) {
  rhs = Utils::typeCast(rhs, lhs->getType()->getNonOpaquePointerElementType());
  if (rhs == NULL) {
    throw std::domain_error(
        "Assign with values that can not be cast to the target type!");
  }

  g_builder.CreateStore(rhs, lhs);
  return lhs;
}

llvm::Value* Utils::createAdd(llvm::Value* lhs, llvm::Value* rhs,
                              CodeGenerator& generator) {
  if (typeUpgrade(lhs, rhs)) {
    if (lhs->getType()->isIntegerTy()) {
      return g_builder.CreateAdd(lhs, rhs);
    } else {
      return g_builder.CreateFAdd(lhs, rhs);
    }
  }

  if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return g_builder.CreateGEP(lhs->getType()->getNonOpaquePointerElementType(),
                               lhs, rhs);
  }

  if (lhs->getType()->isIntegerTy() && rhs->getType()->isPointerTy()) {
    return g_builder.CreateGEP(rhs->getType()->getNonOpaquePointerElementType(),
                               rhs, lhs);
  }

  throw std::logic_error("Add with unsupported types!");
}

llvm::Value* Utils::createSub(llvm::Value* lhs, llvm::Value* rhs,
                              CodeGenerator& generator) {
  if (typeUpgrade(lhs, rhs)) {
    if (lhs->getType()->isIntegerTy()) {
      return g_builder.CreateSub(lhs, rhs);
    } else {
      return g_builder.CreateFSub(lhs, rhs);
    }
  }

  if (lhs->getType()->isPointerTy() && rhs->getType()->isIntegerTy()) {
    return g_builder.CreateGEP(lhs->getType()->getNonOpaquePointerElementType(),
                               lhs, g_builder.CreateNeg(rhs));
  }

  if (lhs->getType()->isPointerTy() && lhs->getType() == rhs->getType()) {
    return g_builder.CreatePtrDiff(
        lhs->getType()->getNonOpaquePointerElementType(), lhs, rhs);
  }

  throw std::logic_error("Sub with unsupported types!");
}

llvm::Value* Utils::createMul(llvm::Value* lhs, llvm::Value* rhs,
                              CodeGenerator& generator) {
  if (typeUpgrade(lhs, rhs)) {
    if (lhs->getType()->isIntegerTy()) {
      return g_builder.CreateMul(lhs, rhs);
    } else {
      return g_builder.CreateFMul(lhs, rhs);
    }
  }

  throw std::logic_error("Mul with unsupported types!");
}

llvm::Value* Utils::createDiv(llvm::Value* lhs, llvm::Value* rhs,
                              CodeGenerator& generator) {
  if (typeUpgrade(lhs, rhs)) {
    if (lhs->getType()->isIntegerTy()) {
      return g_builder.CreateSDiv(lhs, rhs);
    } else {
      return g_builder.CreateFDiv(lhs, rhs);
    }
  }

  throw std::logic_error("Div with unsupported types!");
}

llvm::Value* Utils::createMod(llvm::Value* lhs, llvm::Value* rhs,
                              CodeGenerator& generator) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    if (Utils::typeUpgrade(lhs, rhs)) {
      return g_builder.CreateSRem(lhs, rhs);
    }
  }

  throw std::domain_error("Mod should operate on 2 integers!");
}

llvm::Value* Utils::createBitwiseAnd(llvm::Value* lhs, llvm::Value* rhs,
                                     CodeGenerator& generator) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    if (Utils::typeUpgrade(lhs, rhs)) {
      return g_builder.CreateAnd(lhs, rhs);
    }
  }

  throw std::domain_error("Bitwise AND should operate on 2 integers!");
}

llvm::Value* Utils::createBitwiseOr(llvm::Value* lhs, llvm::Value* rhs,
                                    CodeGenerator& generator) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    if (Utils::typeUpgrade(lhs, rhs)) {
      return g_builder.CreateOr(lhs, rhs);
    }
  }

  throw std::domain_error("Bitwise OR should operate on 2 integers!");
}

llvm::Value* Utils::createBitwiseXor(llvm::Value* lhs, llvm::Value* rhs,
                                     CodeGenerator& generator) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    if (Utils::typeUpgrade(lhs, rhs)) {
      return g_builder.CreateXor(lhs, rhs);
    }
  }

  throw std::domain_error("Bitwise XOR should operate on 2 integers!");
}

llvm::Value* Utils::createShl(llvm::Value* lhs, llvm::Value* rhs,
                              CodeGenerator& generator) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    if (Utils::typeUpgrade(lhs, rhs)) {
      return g_builder.CreateShl(lhs, rhs);
    }
  }

  throw std::domain_error("SHL should operate on 2 integers!");
}

llvm::Value* Utils::createShr(llvm::Value* lhs, llvm::Value* rhs,
                              CodeGenerator& generator) {
  if (lhs->getType()->isIntegerTy() && rhs->getType()->isIntegerTy()) {
    if (Utils::typeUpgrade(lhs, rhs)) {
      return g_builder.CreateAShr(lhs, rhs);
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