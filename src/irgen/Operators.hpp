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
// == This file is not irgen/OperatorToIr.cpp ==
//
// The two are halves of one lowering, split at a single line: whether the code
// still knows it is looking at an AST.
//
//   irgen/OperatorToIr.cpp  the walker. Members of Add, AddAssign, PostfixInc,
//                           and the rest — it reads lhs_ and rhs_, evaluates
//                           them, asks them their C types, and calls in here.
//   irgen/Operators.hpp     this file. Free functions over llvm::Value* and
//                           AST::BuiltinTypeId with no AST node in sight: only
//                           the C rules for which instruction to emit.
//
// Drawing the line there is what lets four different walkers share one rule
// table — OperatorToIr.cpp for arithmetic, LogicToIr.cpp for the comparisons,
// ExprToIr.cpp for the pointer arithmetic inside a subscript, StmtToIr.cpp for
// switch-case equality. Walkers have no headers of their own, so anything more
// than one of them needs has to live in a service like this one; folding these
// functions into OperatorToIr.cpp would cut the other three off.
//
// It is also what states each rule once for an operator and its
// compound-assignment twin: Add::genCode and AddAssign::genCodePtr both call
// createAdd.
namespace ops {

// Relation for icmp only (EQ/LT/… plus signed vs unsigned). Float/double
// comparisons use fcmp and llvm::CmpInst::Predicate instead — see createCmpEq
// and compareOrdered in irgen/LogicToIr.cpp, which pick icmp vs fcmp after
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
