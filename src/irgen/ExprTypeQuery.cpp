#include <llvm/IR/DerivedTypes.h>

#include "ast/Nodes.hpp"
#include "irgen/CodeGenerator.hpp"
#include "types/TypeRules.hpp"
#include "types/VarTypeQuery.hpp"

// What type an expression *has* — the getExpr*/getLValue* queries for every
// Expr node, and lcc's stand-in for a semantic-analysis pass.
//
// Nothing here emits an instruction. That is the whole reason this is its own
// file rather than the top of irgen/ExprToIr.cpp, where it used to live: the
// three lowering files answer "what IR does this become", and this one answers
// "what does C say this is" — a question their lowering has to ask before it
// can pick an instruction. Same division of labour as types/TypeRules.hpp
// (decides) against irgen/TypeConversion.hpp (emits), one level up.
//
// == Why the queries exist at all ==
//
// LLVM 20 pointers are opaque: an IR `ptr` value has no pointee type, so the
// element type for a load, store, or GEP cannot be read back off the value. It
// has to come from the AST, which is what these queries and
// types/VarTypeQuery.hpp exist to provide. Anywhere the lowering files pass a
// VarType* alongside an llvm::Value*, that is why.
//
// == The four queries ==
//
//   getExprVarType()   the AST type of the expression's *value*
//   getLValueVarType() the AST type of the storage it designates
//   getExprTypeId()    the same as the first, narrowed to a BuiltinTypeId
//   getLValueTypeId()  the same as the second
//
// The VarType* pair is what load/store/GEP need; the TypeId pair is what
// conversion and operator selection need, because a BuiltinTypeId records the
// signedness an llvm::Type does not. Expr supplies defaults for all four, so a
// node overrides only the ones where it differs.

namespace AST {

VarType* Expr::getExprVarType(CodeGenerator& generator) const {
  return nullptr;
}

VarType* Expr::getLValueVarType(CodeGenerator& generator) const {
  return nullptr;
}

BuiltinTypeId Expr::getExprTypeId(CodeGenerator& generator) const {
  VarType* varType = getExprVarType(generator);
  if (varType != nullptr) {
    return vartype::resolvedVarTypeToTypeId(varType, generator);
  }

  return BuiltinTypeId::UNKNOWN;
}

BuiltinTypeId Expr::getLValueTypeId(CodeGenerator& generator) const {
  VarType* varType = getLValueVarType(generator);
  if (varType != nullptr) {
    return vartype::resolvedVarTypeToTypeId(varType, generator);
  }

  return BuiltinTypeId::UNKNOWN;
}

BuiltinTypeId Expr::binaryExprTypeId(Expr* lhs, Expr* rhs,
                                     CodeGenerator& generator) {
  return typerules::usualArithmeticConversion(lhs->getExprTypeId(generator),
                                              rhs->getExprTypeId(generator));
}

bool Expr::binaryIsUnsigned(Expr* lhs, Expr* rhs, CodeGenerator& generator) {
  return typerules::isUnsignedTypeId(binaryExprTypeId(lhs, rhs, generator));
}

BuiltinTypeId BinaryExpr::getExprTypeId(CodeGenerator& generator) const {
  return binaryExprTypeId(lhs_, rhs_, generator);
}

VarType* Variable::getExprVarType(CodeGenerator& generator) const {
  return generator.symbols().findVariableType(varName_);
}

VarType* Variable::getLValueVarType(CodeGenerator& generator) const {
  return getExprVarType(generator);
}

BuiltinTypeId Constant::getExprTypeId(CodeGenerator& generator) const {
  (void)generator;
  return typeId_;
}

BuiltinTypeId ConstStr::getExprTypeId(CodeGenerator& generator) const {
  (void)generator;
  return BuiltinTypeId::UNKNOWN;
}

VarType* CommaExpr::getExprVarType(CodeGenerator& generator) const {
  return rhs_->getExprVarType(generator);
}

VarType* FuncCall::getExprVarType(CodeGenerator& generator) const {
  return generator.symbols().findFuncRetType(funcName_);
}

VarType* StructRef::getExprVarType(CodeGenerator& generator) const {
  return getLValueVarType(generator);
}

VarType* StructRef::getLValueVarType(CodeGenerator& generator) const {
  VarType* structVarType = vartype::resolveAggregateVarType(
      struct_->getExprVarType(generator), generator);
  if (structVarType == nullptr) {
    return nullptr;
  }

  return structVarType->getMemberVarType(memberName_);
}

VarType* StructDeref::getExprVarType(CodeGenerator& generator) const {
  return getLValueVarType(generator);
}

VarType* StructDeref::getLValueVarType(CodeGenerator& generator) const {
  VarType* pointerVarType = vartype::resolveTypedefVarType(
      structPtr_->getExprVarType(generator), generator);
  if (pointerVarType == nullptr || !pointerVarType->isPointerType()) {
    return nullptr;
  }

  VarType* pointeeType = vartype::resolveAggregateVarType(
      pointerVarType->getElementVarType(), generator);
  if (pointeeType == nullptr) {
    return nullptr;
  }

  return pointeeType->getMemberVarType(memberName_);
}

VarType* Subscript::getExprVarType(CodeGenerator& generator) const {
  return getLValueVarType(generator);
}

VarType* Subscript::getLValueVarType(CodeGenerator& generator) const {
  VarType* arrayVarType = array_->getExprVarType(generator);
  if (arrayVarType == nullptr) {
    return nullptr;
  }

  return arrayVarType->getElementVarType();
}

VarType* TypeCast::getExprVarType(CodeGenerator& generator) const {
  (void)generator;
  return varType_;
}

BuiltinTypeId SizeOf::getExprTypeId(CodeGenerator& generator) const {
  (void)generator;
  return BuiltinTypeId::LONG;
}

VarType* UnaryPlus::getExprVarType(CodeGenerator& generator) const {
  return operand_->getExprVarType(generator);
}

VarType* UnaryMinus::getExprVarType(CodeGenerator& generator) const {
  return operand_->getExprVarType(generator);
}

BuiltinTypeId UnaryMinus::getExprTypeId(CodeGenerator& generator) const {
  return operand_->getExprTypeId(generator);
}

VarType* PointerDeref::getExprVarType(CodeGenerator& generator) const {
  VarType* pointerVarType = operand_->getExprVarType(generator);
  pointerVarType = vartype::resolveTypedefVarType(pointerVarType, generator);
  if (pointerVarType == nullptr) {
    return nullptr;
  }

  return pointerVarType->getElementVarType();
}

VarType* PointerDeref::getLValueVarType(CodeGenerator& generator) const {
  return getExprVarType(generator);
}

VarType* Assign::getExprVarType(CodeGenerator& generator) const {
  return rhs_->getExprVarType(generator);
}

VarType* PostfixInc::getExprVarType(CodeGenerator& generator) const {
  return getLValueVarType(generator);
}

VarType* PostfixInc::getLValueVarType(CodeGenerator& generator) const {
  return operand_->getLValueVarType(generator);
}

VarType* PostfixDec::getExprVarType(CodeGenerator& generator) const {
  return getLValueVarType(generator);
}

VarType* PostfixDec::getLValueVarType(CodeGenerator& generator) const {
  return operand_->getLValueVarType(generator);
}

VarType* PrefixInc::getExprVarType(CodeGenerator& generator) const {
  return getLValueVarType(generator);
}

VarType* PrefixInc::getLValueVarType(CodeGenerator& generator) const {
  return operand_->getLValueVarType(generator);
}

VarType* PrefixDec::getExprVarType(CodeGenerator& generator) const {
  return getLValueVarType(generator);
}

VarType* PrefixDec::getLValueVarType(CodeGenerator& generator) const {
  return operand_->getLValueVarType(generator);
}

VarType* TernaryCondition::getExprVarType(CodeGenerator& generator) const {
  return trueExpr_->getExprVarType(generator);
}

VarType* LhsRhsAssign::getLValueVarType(CodeGenerator& generator) const {
  // Expr-as-statement (lhs = rhs;) loads through lhs; rhs type is not the
  // lvalue type.
  return lhs_->getLValueVarType(generator);
}

// C: the result of &&, ||, ==, !=, <, <=, >, >= has type int. Without this
// override the base Expr::getExprTypeId() answers UNKNOWN, which fails
// typeUpgrade's integer test and makes `(a < b) * 3` throw "Mul with
// unsupported types!". genCode() widens the i1 to match (see boolToInt).
BuiltinTypeId LogicExpr::getExprTypeId(CodeGenerator& generator) const {
  (void)generator;
  return BuiltinTypeId::INT;
}

// C: `!x` has type int, like the binary logic operators above.
BuiltinTypeId LogicNot::getExprTypeId(CodeGenerator& generator) const {
  (void)generator;
  return BuiltinTypeId::INT;
}

}  // namespace AST
