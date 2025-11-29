#pragma once

#include <llvm/IR/IRBuilder.h>

#include "ast/BuiltinTypeId.hpp"

namespace AST {

class VarType;

}  // namespace AST

class TypeEnv;

// One function per C binary operator, lowering it to the matching LLVM
// instruction. Each applies the usual arithmetic conversions to its operands
// first (via convert::typeUpgrade), then picks the signed or unsigned opcode
// using the C signedness carried in AST::BuiltinTypeId — sdiv vs udiv, srem vs
// urem, ashr vs lshr, icmp slt vs ult — since LLVM integer types do not record
// signedness themselves.
//
// These live apart from the AST nodes because each is shared by an operator and
// its compound-assignment twin: Add::genCode and AddAssign::genCode both call
// createAdd, so the conversion and opcode-selection rules are stated once.
namespace ops {

// Relation for icmp only (EQ/LT/… plus signed vs unsigned). Float/double
// comparisons use fcmp and llvm::CmpInst::Predicate instead — see createCmpEq
// and compareOrdered in irgen/ExprToIr.cpp, which pick icmp vs fcmp after
// usual arithmetic conversion.
enum class IntCmpPred { EQ, NE, LT, LE, GT, GE };

llvm::Value* createCmpEq(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                         llvm::Value* rhs, AST::BuiltinTypeId lhsTypeId,
                         AST::BuiltinTypeId rhsTypeId);

llvm::Value* createIntegerCmp(llvm::IRBuilder<>& builder, IntCmpPred pred,
                              llvm::Value* lhs, llvm::Value* rhs,
                              bool isUnsigned);

llvm::Value* createAdd(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, AST::VarType* lhsVarType,
                       AST::VarType* rhsVarType, TypeEnv& env,
                       AST::BuiltinTypeId lhsTypeId,
                       AST::BuiltinTypeId rhsTypeId);

llvm::Value* createSub(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, AST::VarType* lhsVarType,
                       AST::VarType* rhsVarType, TypeEnv& env,
                       AST::BuiltinTypeId lhsTypeId,
                       AST::BuiltinTypeId rhsTypeId);

llvm::Value* createMul(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, AST::BuiltinTypeId lhsTypeId,
                       AST::BuiltinTypeId rhsTypeId);

llvm::Value* createDiv(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, AST::BuiltinTypeId lhsTypeId,
                       AST::BuiltinTypeId rhsTypeId, bool isUnsigned);

llvm::Value* createMod(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, AST::BuiltinTypeId lhsTypeId,
                       AST::BuiltinTypeId rhsTypeId, bool isUnsigned);

llvm::Value* createBitwiseAnd(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, AST::BuiltinTypeId lhsTypeId,
                              AST::BuiltinTypeId rhsTypeId);

llvm::Value* createBitwiseOr(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                             llvm::Value* rhs, AST::BuiltinTypeId lhsTypeId,
                             AST::BuiltinTypeId rhsTypeId);

llvm::Value* createBitwiseXor(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                              llvm::Value* rhs, AST::BuiltinTypeId lhsTypeId,
                              AST::BuiltinTypeId rhsTypeId);

llvm::Value* createShl(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, AST::BuiltinTypeId lhsTypeId,
                       AST::BuiltinTypeId rhsTypeId);

llvm::Value* createShr(llvm::IRBuilder<>& builder, llvm::Value* lhs,
                       llvm::Value* rhs, AST::BuiltinTypeId lhsTypeId,
                       AST::BuiltinTypeId rhsTypeId, bool isUnsigned);

}  // namespace ops
