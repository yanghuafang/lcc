#pragma once

#include <llvm/IR/IRBuilder.h>

#include <string>
#include <vector>

#include "AbstractSyntaxTree.hpp"

namespace llvm {

class AllocaInst;
class BranchInst;
class Type;
class Value;
class Function;
class BasicBlock;

}  // namespace llvm

class Utils {
 public:
  enum class IntCmpPred { EQ, NE, LT, LE, GT, GE };

  static llvm::Value* typeCast(
      llvm::IRBuilder<>& builder, llvm::Value* value, llvm::Type* type,
      AST::BuiltinType::TypeId srcTypeId = AST::BuiltinType::TypeId::UNKNOWN,
      AST::BuiltinType::TypeId dstTypeId = AST::BuiltinType::TypeId::UNKNOWN);

  static llvm::Value* castToBool(llvm::IRBuilder<>& builder, llvm::Value* value);

  static llvm::Value* typeUpgrade(
      llvm::IRBuilder<>& builder, llvm::Value* value, llvm::Type* type,
      AST::BuiltinType::TypeId srcTypeId,
      AST::BuiltinType::TypeId dstTypeId);

  static bool typeUpgrade(llvm::IRBuilder<>& builder, llvm::Value*& lhs,
                          llvm::Value*& rhs,
                          AST::BuiltinType::TypeId lhsTypeId,
                          AST::BuiltinType::TypeId rhsTypeId,
                          AST::BuiltinType::TypeId& resultTypeId,
                          bool& isUnsigned);

  static llvm::AllocaInst* createEntryBlockAlloca(llvm::Function* func,
                                                  const std::string& varName,
                                                  llvm::Type* varType);

  static llvm::BranchInst* terminateBlockByBr(llvm::IRBuilder<>& builder,
                                            llvm::BasicBlock* basicBlock);

  static llvm::Value* createCmpEq(
      llvm::IRBuilder<>& builder, llvm::Value* lhs, llvm::Value* rhs,
      AST::BuiltinType::TypeId lhsTypeId, AST::BuiltinType::TypeId rhsTypeId);

  static llvm::Value* createIntegerCmp(llvm::IRBuilder<>& builder,
                                       IntCmpPred pred, llvm::Value* lhs,
                                       llvm::Value* rhs, bool isUnsigned);

  static llvm::Value* createLoad(llvm::IRBuilder<>& builder, llvm::Value* lhs);

  static llvm::Value* createAssign(
      llvm::IRBuilder<>& builder, llvm::Value* lhs, llvm::Value* rhs,
      AST::BuiltinType::TypeId srcTypeId = AST::BuiltinType::TypeId::UNKNOWN,
      AST::BuiltinType::TypeId dstTypeId = AST::BuiltinType::TypeId::UNKNOWN);

  static llvm::Value* createAdd(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                                llvm::Value* rhs,
                                AST::BuiltinType::TypeId lhsTypeId,
                                AST::BuiltinType::TypeId rhsTypeId);

  static llvm::Value* createSub(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                                llvm::Value* rhs,
                                AST::BuiltinType::TypeId lhsTypeId,
                                AST::BuiltinType::TypeId rhsTypeId);

  static llvm::Value* createMul(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                                llvm::Value* rhs,
                                AST::BuiltinType::TypeId lhsTypeId,
                                AST::BuiltinType::TypeId rhsTypeId);

  static llvm::Value* createDiv(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                                llvm::Value* rhs,
                                AST::BuiltinType::TypeId lhsTypeId,
                                AST::BuiltinType::TypeId rhsTypeId,
                                bool isUnsigned);

  static llvm::Value* createMod(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                                llvm::Value* rhs,
                                AST::BuiltinType::TypeId lhsTypeId,
                                AST::BuiltinType::TypeId rhsTypeId,
                                bool isUnsigned);

  static llvm::Value* createBitwiseAnd(llvm::IRBuilder<>& builder,
                                       llvm::Value* lhs, llvm::Value* rhs,
                                       AST::BuiltinType::TypeId lhsTypeId,
                                       AST::BuiltinType::TypeId rhsTypeId);

  static llvm::Value* createBitwiseOr(llvm::IRBuilder<>& builder,
                                      llvm::Value* lhs, llvm::Value* rhs,
                                      AST::BuiltinType::TypeId lhsTypeId,
                                      AST::BuiltinType::TypeId rhsTypeId);

  static llvm::Value* createBitwiseXor(llvm::IRBuilder<>& builder,
                                       llvm::Value* lhs, llvm::Value* rhs,
                                       AST::BuiltinType::TypeId lhsTypeId,
                                       AST::BuiltinType::TypeId rhsTypeId);

  static llvm::Value* createShl(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                                llvm::Value* rhs,
                                AST::BuiltinType::TypeId lhsTypeId,
                                AST::BuiltinType::TypeId rhsTypeId);

  static llvm::Value* createShr(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                                llvm::Value* rhs,
                                AST::BuiltinType::TypeId lhsTypeId,
                                AST::BuiltinType::TypeId rhsTypeId,
                                bool isUnsigned);

  static llvm::Value* getOneValue(llvm::IRBuilder<>& builder,
                                  size_t valueBitWidth);

  static bool isUnsignedTypeId(AST::BuiltinType::TypeId typeId);
  static AST::BuiltinType::TypeId integerPromotion(
      AST::BuiltinType::TypeId typeId);
  static AST::BuiltinType::TypeId usualArithmeticConversion(
      AST::BuiltinType::TypeId lhsTypeId, AST::BuiltinType::TypeId rhsTypeId,
      bool& isUnsigned);
  static AST::BuiltinType::TypeId varTypeToTypeId(AST::VarType* varType);
};
