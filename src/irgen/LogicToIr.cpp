#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Value.h>

#include <functional>
#include <stdexcept>

#include "ast/Nodes.hpp"
#include "irgen/CodeGenerator.hpp"
#include "irgen/Operators.hpp"
#include "irgen/TypeConversion.hpp"

// The operators that yield a truth value: &&, ||, !, the six comparisons, and
// the conditional ?: that consumes one. Split from the arithmetic operators in
// irgen/OperatorToIr.cpp because everything about them is different — the
// result type is always int regardless of the operands, the comparisons need
// pointer-aware conversion rules, and three of them deviate from C.
//
// == Why the results are widened ==
//
// C says these produce int — 0 or 1 — but LLVM's icmp/fcmp produce i1. Every
// genCode() here widens through boolToInt, and the matching getExprTypeId()
// overrides in irgen/ExprTypeQuery.cpp report INT so that conversion and
// operator selection agree with the value actually produced. Leaving the i1 in
// place would let it be *sign* extended later, making `int r = a < b` store -1.
//
// == The three lazy-evaluation deviations from C ==
//
// Three, not all of lcc's: the deviations that come from evaluating eagerly
// live here, and the rest live with the rules they bend — types/TypeRules.hpp
// for the conversion ladder, irgen/Operators.hpp for the shift operands, and
// irgen/StmtToIr.cpp for switch's default label.
//
// lcc lowers the "lazy" operators eagerly, with select instead of branches, so
// an untaken operand's side effects still run:
//
//   - && and ||   LogicExpr::genBoolBinaryCode  (CreateLogicalAnd/Or)
//   - ?:          TernaryCondition::genTernarySelect  (CreateSelect)
//
// So `p != NULL && *p` is not safe here, and `f() ? g() : h()` calls both g and
// h. Fixing either means splitting into basic blocks and joining with a phi —
// the same shape StmtToIr.cpp already builds for if/else. The comma operator in
// irgen/ExprToIr.cpp, by contrast, is correct: it evaluates the left side for
// effect and yields the right.

namespace AST {

namespace {

// C's relational, equality, and logical operators yield int — 0 or 1 — not a
// one-bit value. LLVM's icmp/fcmp produce i1, so widen here, at the single
// point each of those operators produces its result.
//
// This has to happen in genCode(), not at the use site: getExprTypeId() below
// reports INT for these nodes, and every consumer (typeCast, the usual
// arithmetic conversion in typeUpgrade, variadic promotion in FuncCall) derives
// signedness from that type id alone. An i1 left in place would be *sign*
// extended on the way to i32, making `int r = a < b` store -1.
//
// Zero extension, not sign: the comparison is unsigned-1-bit, so `zext`. Any
// consumer needing the bit back — an if/while condition, `&&` — calls
// castToBool, and -O1 and up fold the zext/icmp pair away entirely.
llvm::Value* boolToInt(llvm::IRBuilder<>& builder, llvm::Value* boolValue) {
  return builder.CreateZExt(boolValue, builder.getInt32Ty());
}

}  // namespace

const char* LogicNot::nonLValueErrorMessage() const {
  return "Logic NOT operator \"!\" can not return left value!";
}

llvm::Value* LogicExpr::genCodePtr(CodeGenerator& generator) {
  (void)generator;
  throw std::logic_error(nonLValueErrorMessage());
}

llvm::Value* LogicExpr::genBoolBinaryCode(
    CodeGenerator& generator,
    const std::function<llvm::Value*(llvm::Value*, llvm::Value*)>& combine) {
  // Both operands are evaluated here before combine() (a select-based
  // CreateLogicalAnd/Or), so && and || do NOT short-circuit as in C: the RHS
  // and its side effects always run.
  llvm::Value* lhs =
      convert::castToBool(generator.getBuilder(), lhs_->genCode(generator));
  llvm::Value* rhs =
      convert::castToBool(generator.getBuilder(), rhs_->genCode(generator));
  return boolToInt(generator.getBuilder(), combine(lhs, rhs));
}

llvm::Value* LogicExpr::genEqualityCode(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return boolToInt(generator.getBuilder(),
                   ops::createCmpEq(generator.getBuilder(), lhs, rhs,
                                    lhs_->getExprTypeId(generator),
                                    rhs_->getExprTypeId(generator)));
}

llvm::Value* LogicExpr::genOrderedCompare(CodeGenerator& generator,
                                          int intCmpPred, int floatCmpPred,
                                          const char* unsupportedOp) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  llvm::Value* cmp = ops::createCompare(
      generator.getBuilder(), static_cast<ops::IntCmpPred>(intCmpPred),
      static_cast<llvm::CmpInst::Predicate>(floatCmpPred), lhs, rhs,
      lhs_->getExprTypeId(generator), rhs_->getExprTypeId(generator));
  if (cmp != nullptr) {
    return boolToInt(generator.getBuilder(), cmp);
  }

  throw std::logic_error(std::string("Unsupported type for operator \"") +
                         unsupportedOp + "\"");
}

const char* LogicAnd::nonLValueErrorMessage() const {
  return "Logic AND operator \"&&\" can not return left value!";
}

const char* LogicOr::nonLValueErrorMessage() const {
  return "Logic OR operator \"||\" can not return left value!";
}

const char* LogicEq::nonLValueErrorMessage() const {
  return "Logic EQ operator \"==\" can not return left value!";
}

const char* LogicNotEq::nonLValueErrorMessage() const {
  return "Logic operator \"!=\" can not return left value!";
}

const char* LogicLessThan::nonLValueErrorMessage() const {
  return "Logic operator \"<\" can not return left value!";
}

const char* LogicLessEq::nonLValueErrorMessage() const {
  return "Logic operator \"<=\" can not return left value!";
}

const char* LogicGreaterThan::nonLValueErrorMessage() const {
  return "Logic operator \">\" can not return left value!";
}

const char* LogicGreaterEq::nonLValueErrorMessage() const {
  return "Logic operator \">=\" can not return left value!";
}

llvm::Value* LogicAnd::genCode(CodeGenerator& generator) {
  return genBoolBinaryCode(
      generator, [&generator](llvm::Value* lhs, llvm::Value* rhs) {
        return generator.getBuilder().CreateLogicalAnd(lhs, rhs);
      });
}

llvm::Value* LogicOr::genCode(CodeGenerator& generator) {
  return genBoolBinaryCode(
      generator, [&generator](llvm::Value* lhs, llvm::Value* rhs) {
        return generator.getBuilder().CreateLogicalOr(lhs, rhs);
      });
}

llvm::Value* LogicNot::genCode(CodeGenerator& generator) {
  return boolToInt(generator.getBuilder(),
                   generator.getBuilder().CreateICmpEQ(
                       convert::castToBool(generator.getBuilder(),
                                           operand_->genCode(generator)),
                       generator.getBuilder().getInt1(false)));
}

llvm::Value* LogicEq::genCode(CodeGenerator& generator) {
  return genEqualityCode(generator);
}

llvm::Value* LogicNotEq::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(ops::IntCmpPred::NE),
                           static_cast<int>(llvm::CmpInst::FCMP_ONE), "!=");
}

llvm::Value* LogicLessThan::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(ops::IntCmpPred::LT),
                           static_cast<int>(llvm::CmpInst::FCMP_OLT), "<");
}

llvm::Value* LogicLessEq::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(ops::IntCmpPred::LE),
                           static_cast<int>(llvm::CmpInst::FCMP_OLE), "<=");
}

llvm::Value* LogicGreaterThan::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(ops::IntCmpPred::GT),
                           static_cast<int>(llvm::CmpInst::FCMP_OGT), ">");
}

llvm::Value* LogicGreaterEq::genCode(CodeGenerator& generator) {
  return genOrderedCompare(generator, static_cast<int>(ops::IntCmpPred::GE),
                           static_cast<int>(llvm::CmpInst::FCMP_OGE), ">=");
}

llvm::Value* TernaryCondition::genTernarySelect(
    CodeGenerator& generator,
    const std::function<llvm::Value*(Expr*)>& evalBranch,
    const char* typeMismatchMessage) const {
  llvm::Value* condition = convert::castToBool(generator.getBuilder(),
                                               condition_->genCode(generator));
  if (condition == nullptr) {
    throw std::logic_error(
        "Condition is not a bool expression in ternary condition expression!");
  }

  // Both arms are evaluated before CreateSelect, so unlike C's ?: the untaken
  // branch's side effects still run. Result types are unified via typeUpgrade.
  llvm::Value* trueVal = evalBranch(trueExpr_);
  llvm::Value* falseVal = evalBranch(falseExpr_);
  bool isUnsigned = false;
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
  if (trueVal->getType() == falseVal->getType() ||
      convert::typeUpgrade(generator.getBuilder(), trueVal, falseVal,
                           trueExpr_->getExprTypeId(generator),
                           falseExpr_->getExprTypeId(generator), resultTypeId,
                           isUnsigned)) {
    return generator.getBuilder().CreateSelect(condition, trueVal, falseVal);
  }

  throw std::logic_error(typeMismatchMessage);
}

llvm::Value* TernaryCondition::genCode(CodeGenerator& generator) {
  return genTernarySelect(
      generator, [&generator](Expr* expr) { return expr->genCode(generator); },
      "Unmatched type of true and false expressions for ternary operator "
      "\"? :\"");
}

llvm::Value* TernaryCondition::genCodePtr(CodeGenerator& generator) {
  return genTernarySelect(
      generator,
      [&generator](Expr* expr) { return expr->genCodePtr(generator); },
      "Unmatched type of true and false expressions for ternary operator "
      "\"? :\" which returns left value!");
}

}  // namespace AST
