#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Value.h>

#include <functional>
#include <stdexcept>

#include "ast/Nodes.hpp"
#include "irgen/CodeGenerator.hpp"
#include "irgen/Operators.hpp"
#include "irgen/TypeConversion.hpp"
#include "types/BuiltinTypeMap.hpp"
#include "types/TypeRules.hpp"

// The operators that yield a truth value: &&, ||, !, the six comparisons, and
// the conditional ?: that consumes one. Split from the arithmetic operators in
// irgen/OperatorToIr.cpp because everything about them is different — the
// result type is always int regardless of the operands, the comparisons need
// pointer-aware conversion rules, and three of them create control flow.
//
// == Why the results are widened ==
//
// C says these produce int — 0 or 1 — but LLVM's icmp/fcmp produce i1. Every
// genCode() here widens through boolToInt, and the matching getExprTypeId()
// overrides in irgen/ExprTypeQuery.cpp report INT so that conversion and
// operator selection agree with the value actually produced. Leaving the i1 in
// place would let it be *sign* extended later, making `int r = a < b` store -1.
//
// == The three operators that branch ==
//
// `&&`, `||` and `?:` do not evaluate all of their operands. C requires that:
// `p != 0 && *p` must not dereference a null `p`, and `f() ? g() : h()` calls
// exactly one of g and h. So each lowers to real control flow — a conditional
// branch, a block for the operand that may be skipped, and a phi joining the
// paths — which is the shape irgen/StmtToIr.cpp already builds for if/else:
//
//   - && and ||   LogicExpr::genShortCircuitCode
//   - ?:          TernaryCondition::genTernaryBranch
//
// Two consequences worth knowing. The phi's incoming block is whichever block
// the operand *finished* in, not the one it started in, because an operand may
// itself be one of these three and leave the builder in its own join block.
// And inside a constant initializer there is no control flow to branch through
// — see CodeGenerator::inGlobalInitBlock — so both fall back to the eager
// select form there, which the IRBuilder's folder reduces to a constant.

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

// && and || differ only in which lhs value settles the answer on its own, so
// one function serves both: isAnd picks the branch targets and the value the
// expression is worth when the rhs is skipped.
llvm::Value* LogicExpr::genShortCircuitCode(CodeGenerator& generator,
                                            bool isAnd) {
  llvm::IRBuilder<>& builder = generator.getBuilder();

  if (generator.inGlobalInitBlock()) {
    llvm::Value* lhs = convert::castToBool(builder, lhs_->genCode(generator));
    llvm::Value* rhs = convert::castToBool(builder, rhs_->genCode(generator));
    return boolToInt(builder, isAnd ? builder.CreateLogicalAnd(lhs, rhs)
                                    : builder.CreateLogicalOr(lhs, rhs));
  }

  llvm::Value* lhs = convert::castToBool(builder, lhs_->genCode(generator));
  // After the lhs, not before: a nested && or ?: on the left leaves the builder
  // in its own join block, and that block is the phi's predecessor.
  llvm::BasicBlock* lhsExit = builder.GetInsertBlock();
  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* rhsBlock = llvm::BasicBlock::Create(
      generator.getContext(), isAnd ? "land.rhs" : "lor.rhs", func);
  llvm::BasicBlock* endBlock = llvm::BasicBlock::Create(
      generator.getContext(), isAnd ? "land.end" : "lor.end", func);

  builder.CreateCondBr(lhs, isAnd ? rhsBlock : endBlock,
                       isAnd ? endBlock : rhsBlock);

  builder.SetInsertPoint(rhsBlock);
  llvm::Value* rhs = convert::castToBool(builder, rhs_->genCode(generator));
  llvm::BasicBlock* rhsExit = builder.GetInsertBlock();
  builder.CreateBr(endBlock);

  builder.SetInsertPoint(endBlock);
  llvm::PHINode* phi = builder.CreatePHI(builder.getInt1Ty(), 2);
  // Reaching the join straight from the lhs means the shortcut was taken, and
  // the shortcut settles the answer: false for &&, true for ||.
  phi->addIncoming(builder.getInt1(!isAnd), lhsExit);
  phi->addIncoming(rhs, rhsExit);
  return boolToInt(builder, phi);
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
  return genShortCircuitCode(generator, /*isAnd=*/true);
}

llvm::Value* LogicOr::genCode(CodeGenerator& generator) {
  return genShortCircuitCode(generator, /*isAnd=*/false);
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

llvm::Value* TernaryCondition::genTernaryBranch(
    CodeGenerator& generator,
    const std::function<llvm::Value*(Expr*)>& evalBranch,
    const char* typeMismatchMessage) const {
  llvm::IRBuilder<>& builder = generator.getBuilder();
  llvm::Value* condition =
      convert::castToBool(builder, condition_->genCode(generator));
  if (condition == nullptr) {
    throw std::logic_error(
        "Condition is not a bool expression in ternary condition expression!");
  }

  if (generator.inGlobalInitBlock()) {
    llvm::Value* trueVal = evalBranch(trueExpr_);
    llvm::Value* falseVal = evalBranch(falseExpr_);
    BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
    if (trueVal->getType() == falseVal->getType() ||
        convert::typeUpgrade(
            builder, trueVal, falseVal, trueExpr_->getExprTypeId(generator),
            falseExpr_->getExprTypeId(generator), resultTypeId)) {
      return builder.CreateSelect(condition, trueVal, falseVal);
    }
    throw std::logic_error(typeMismatchMessage);
  }

  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* trueBlock =
      llvm::BasicBlock::Create(generator.getContext(), "cond.true", func);
  llvm::BasicBlock* falseBlock =
      llvm::BasicBlock::Create(generator.getContext(), "cond.false", func);
  llvm::BasicBlock* endBlock =
      llvm::BasicBlock::Create(generator.getContext(), "cond.end", func);
  builder.CreateCondBr(condition, trueBlock, falseBlock);

  // Each arm runs in its own block, which is the whole point — the untaken one
  // never executes. Neither arm branches to the join yet: unifying the two
  // result types may need a conversion, and that conversion has to be emitted
  // into the arm that produced the value, not into the join where the other
  // path never computed it.
  builder.SetInsertPoint(trueBlock);
  llvm::Value* trueVal = evalBranch(trueExpr_);
  llvm::BasicBlock* trueExit = builder.GetInsertBlock();

  builder.SetInsertPoint(falseBlock);
  llvm::Value* falseVal = evalBranch(falseExpr_);
  llvm::BasicBlock* falseExit = builder.GetInsertBlock();

  llvm::Type* resultType = trueVal->getType();
  BuiltinTypeId resultTypeId = BuiltinTypeId::UNKNOWN;
  if (trueVal->getType() != falseVal->getType()) {
    // Same ladder convert::typeUpgrade walks for an operand pair, applied one
    // arm at a time so each cast lands in its own block.
    resultTypeId = typerules::usualArithmeticConversion(
        trueExpr_->getExprTypeId(generator),
        falseExpr_->getExprTypeId(generator));
    resultType = builtinmap::toLlvmType(resultTypeId, generator.getContext());
    if (resultType == nullptr) {
      throw std::logic_error(typeMismatchMessage);
    }
  }

  builder.SetInsertPoint(trueExit);
  trueVal =
      convert::typeCast(builder, trueVal, resultType,
                        trueExpr_->getExprTypeId(generator), resultTypeId);
  if (trueVal == nullptr) {
    throw std::logic_error(typeMismatchMessage);
  }
  builder.CreateBr(endBlock);

  builder.SetInsertPoint(falseExit);
  falseVal =
      convert::typeCast(builder, falseVal, resultType,
                        falseExpr_->getExprTypeId(generator), resultTypeId);
  if (falseVal == nullptr) {
    throw std::logic_error(typeMismatchMessage);
  }
  builder.CreateBr(endBlock);

  builder.SetInsertPoint(endBlock);
  llvm::PHINode* phi = builder.CreatePHI(resultType, 2);
  phi->addIncoming(trueVal, trueExit);
  phi->addIncoming(falseVal, falseExit);
  return phi;
}

llvm::Value* TernaryCondition::genCode(CodeGenerator& generator) {
  return genTernaryBranch(
      generator, [&generator](Expr* expr) { return expr->genCode(generator); },
      "Unmatched type of true and false expressions for ternary operator "
      "\"? :\"");
}

llvm::Value* TernaryCondition::genCodePtr(CodeGenerator& generator) {
  return genTernaryBranch(
      generator,
      [&generator](Expr* expr) { return expr->genCodePtr(generator); },
      "Unmatched type of true and false expressions for ternary operator "
      "\"? :\" which returns left value!");
}

}  // namespace AST
