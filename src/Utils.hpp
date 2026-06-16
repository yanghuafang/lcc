#pragma once

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

class CodeGenerator;

class Utils {
 public:
  enum class IntCmpPred { EQ, NE, LT, LE, GT, GE };

  // int -> int, float/double, pointer
  // float/double -> int, pointer
  // pointer -> int, pointer
  static llvm::Value* typeCast(
      llvm::Value* value, llvm::Type* type,
      AST::BuiltinType::TypeId srcTypeId = AST::BuiltinType::TypeId::UNKNOWN,
      AST::BuiltinType::TypeId dstTypeId = AST::BuiltinType::TypeId::UNKNOWN);

  // int, float/double, pointer -> bool
  static llvm::Value* castToBool(llvm::Value* value);

  // int1(bool) -> int8 -> int16 -> int32 -> int64 ->float ->double
  static llvm::Value* typeUpgrade(
      llvm::Value* value, llvm::Type* type,
      AST::BuiltinType::TypeId srcTypeId,
      AST::BuiltinType::TypeId dstTypeId);

  // Upgrade lhs and/or rhs to type of higher precedence.
  // char/short -> int ->unsigned ->long ->double
  // float -> double
  static bool typeUpgrade(llvm::Value*& lhs, llvm::Value*& rhs,
                          AST::BuiltinType::TypeId lhsTypeId,
                          AST::BuiltinType::TypeId rhsTypeId,
                          AST::BuiltinType::TypeId& resultTypeId,
                          bool& isUnsigned);

  // Create an alloca instruction in the entry block of the current function.
  static llvm::AllocaInst* createEntryBlockAlloca(llvm::Function* func,
                                                  const std::string& varName,
                                                  llvm::Type* varType);

  // Create an unconditional branch if the current block does not have a
  // terminator. It does nothing if current block already has a terminator.
  // Take IfStmt for example, there are 3 blocks: thenBlock, elseBlock and
  // endBlock. At the end of thenBlock and elseBlock, there should be an
  // unconditional branch to endBlock should be created respectively.
  static llvm::BranchInst* terminateBlockByBr(llvm::BasicBlock* basicBlock);

  // Create an equal comparision instruction. Automatic type casting will be
  // done if two input values are of different types.
  static llvm::Value* createCmpEq(
      llvm::Value* lhs, llvm::Value* rhs,
      AST::BuiltinType::TypeId lhsTypeId, AST::BuiltinType::TypeId rhsTypeId);

  static llvm::Value* createIntegerCmp(IntCmpPred pred, llvm::Value* lhs,
                                       llvm::Value* rhs, bool isUnsigned);

  // Create a load instruction.
  // When lhs is type of array, only return a pointer to the first element.
  static llvm::Value* createLoad(llvm::Value* lhs, CodeGenerator& generator);

  // Create an assignment instruction. Automatic type casting/upgrading will be
  // done if the input values are of different types.
  static llvm::Value* createAssign(
      llvm::Value* lhs, llvm::Value* rhs, CodeGenerator& generator,
      AST::BuiltinType::TypeId srcTypeId = AST::BuiltinType::TypeId::UNKNOWN,
      AST::BuiltinType::TypeId dstTypeId = AST::BuiltinType::TypeId::UNKNOWN);

  // Create an addition instruction. Automatic type casting/upgrading will be
  // done if the input values are of different types.
  static llvm::Value* createAdd(llvm::Value* lhs, llvm::Value* rhs,
                                AST::BuiltinType::TypeId lhsTypeId,
                                AST::BuiltinType::TypeId rhsTypeId,
                                CodeGenerator& generator);

  // Create a substraction instruction. Automatic type casting/upgrading will
  // be done if the input values are of different types.
  static llvm::Value* createSub(llvm::Value* lhs, llvm::Value* rhs,
                                AST::BuiltinType::TypeId lhsTypeId,
                                AST::BuiltinType::TypeId rhsTypeId,
                                CodeGenerator& generator);

  // Create a multiplication instruction. Automatic type casting/upgrading will
  // be done if the input values are of different types.
  static llvm::Value* createMul(llvm::Value* lhs, llvm::Value* rhs,
                                AST::BuiltinType::TypeId lhsTypeId,
                                AST::BuiltinType::TypeId rhsTypeId,
                                CodeGenerator& generator);

  // Create a division instruction. Automatic type casting/upgrading will
  // be done if the input values are of different types.
  static llvm::Value* createDiv(llvm::Value* lhs, llvm::Value* rhs,
                                AST::BuiltinType::TypeId lhsTypeId,
                                AST::BuiltinType::TypeId rhsTypeId,
                                bool isUnsigned, CodeGenerator& generator);

  // Create a modulo instruction. Automatic type casting/upgrading will
  // be done if the input values are of different types.
  static llvm::Value* createMod(llvm::Value* lhs, llvm::Value* rhs,
                                AST::BuiltinType::TypeId lhsTypeId,
                                AST::BuiltinType::TypeId rhsTypeId,
                                bool isUnsigned, CodeGenerator& generator);

  // Create a bitwise AND instruction. Automatic type casting/upgrading will
  // be done if the input values are of different types.
  static llvm::Value* createBitwiseAnd(llvm::Value* lhs, llvm::Value* rhs,
                                      AST::BuiltinType::TypeId lhsTypeId,
                                      AST::BuiltinType::TypeId rhsTypeId,
                                      CodeGenerator& generator);

  // Create a bitwise OR instruction. Automatic type casting/upgrading will
  // be done if the input values are of different types.
  static llvm::Value* createBitwiseOr(llvm::Value* lhs, llvm::Value* rhs,
                                      AST::BuiltinType::TypeId lhsTypeId,
                                      AST::BuiltinType::TypeId rhsTypeId,
                                      CodeGenerator& generator);

  // Create a bitwise XOR instruction. Automatic type casting/upgrading will
  // be done if the input values are of different types.
  static llvm::Value* createBitwiseXor(llvm::Value* lhs, llvm::Value* rhs,
                                       AST::BuiltinType::TypeId lhsTypeId,
                                       AST::BuiltinType::TypeId rhsTypeId,
                                       CodeGenerator& generator);

  // Create a SHL instruction. Automatic type casting/upgrading will
  // be done if the input values are of different types.
  static llvm::Value* createShl(llvm::Value* lhs, llvm::Value* rhs,
                                AST::BuiltinType::TypeId lhsTypeId,
                                AST::BuiltinType::TypeId rhsTypeId,
                                CodeGenerator& generator);

  // Create a SHR instruction. Automatic type casting/upgrading will
  // be done if the input values are of different types.
  static llvm::Value* createShr(llvm::Value* lhs, llvm::Value* rhs,
                                AST::BuiltinType::TypeId lhsTypeId,
                                AST::BuiltinType::TypeId rhsTypeId,
                                bool isUnsigned, CodeGenerator& generator);

  // Dump AST graph to file.
  static void dumpAbstractSyntaxTree(const std::string& fileName,
                                     const std::string& graph);

  static llvm::Value* getOneValue(size_t valueBitWidth);

  static bool isUnsignedTypeId(AST::BuiltinType::TypeId typeId);
  static AST::BuiltinType::TypeId integerPromotion(
      AST::BuiltinType::TypeId typeId);
  static AST::BuiltinType::TypeId usualArithmeticConversion(
      AST::BuiltinType::TypeId lhsTypeId, AST::BuiltinType::TypeId rhsTypeId,
      bool& isUnsigned);
  static llvm::Type* llvmTypeForTypeId(AST::BuiltinType::TypeId typeId);
  static AST::BuiltinType::TypeId varTypeToTypeId(AST::VarType* varType);
};
