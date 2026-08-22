#include <llvm/IR/Value.h>

#include <functional>
#include <stdexcept>

#include "ast/Nodes.hpp"
#include "irgen/CodeGenerator.hpp"
#include "irgen/IrIdioms.hpp"
#include "irgen/Operators.hpp"
#include "types/VarTypeQuery.hpp"

// Assignment, arithmetic, increment/decrement, bitwise, and shift — the
// operators that compute a value from operands of the same kind. The
// comparison and short-circuit operators are next door in irgen/LogicToIr.cpp,
// because they answer a different question (a truth value, typed int) and need
// their own conversion rules; irgen/ExprToIr.cpp holds everything that is not
// an operator at all.
//
// == This file is not irgen/Operators.hpp ==
//
// Everything here is an AST member: it reads lhs_ and rhs_, evaluates them,
// and asks them their C types. The instruction each operator finally becomes —
// sdiv vs udiv, a GEP for pointer arithmetic, the usual arithmetic conversions
// applied first — is one level down in irgen/Operators.hpp (`ops::`), which
// sees only llvm::Value* and AST::BuiltinTypeId and never an AST node. That
// header explains why the rules live apart from the walk.
//
// == Why every operator appears twice ==
//
// `a + b` and `a += b` compute the same thing and differ only in what they do
// with the result, so each operator is one function in irgen/Operators.hpp
// (`ops::createAdd`, …) called from two places here:
//
//   Add::genCode           evaluate both sides, apply, yield the value
//   AddAssign::genCodePtr  load the lhs, apply, store back, yield the address
//
// genBinaryCode and genCompoundAssignPtr below are those two shapes stated
// once; a new binary operator needs one ops:: function and two four-line
// members, not two copies of the lowering.
//
// Compound assignment yields the *address*, not the value, because `(a += b)`
// is an lvalue in lcc's lowering — genCode() then loads through it via
// loadFromLValuePtr, so the value form costs one load and no duplication.

namespace AST {

llvm::Value* BinaryExpr::genBinaryCode(
    CodeGenerator& generator,
    const std::function<llvm::Value*(llvm::Value*, llvm::Value*)>& applyOp) {
  llvm::Value* lhs = lhs_->genCode(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return applyOp(lhs, rhs);
}

llvm::Value* BinaryExpr::genCodePtr(CodeGenerator& generator) {
  (void)generator;
  throw std::logic_error(nonLValueErrorMessage());
}

const char* Add::nonLValueErrorMessage() const {
  return "Add operator \"+\" can not return left value!";
}

const char* Sub::nonLValueErrorMessage() const {
  return "Sub operator \"-\" can not return left value!";
}

const char* Mul::nonLValueErrorMessage() const {
  return "Mul operator \"*\" can not return left value!";
}

const char* Div::nonLValueErrorMessage() const {
  return "Div operator \"/\" can not return left value!";
}

const char* Mod::nonLValueErrorMessage() const {
  return "Mod operator \"%\" can not return left value!";
}

const char* BitwiseAnd::nonLValueErrorMessage() const {
  return "Bitwise AND operator \"&\" can not return left value!";
}

const char* BitwiseOr::nonLValueErrorMessage() const {
  return "Bitwise OR operator \"|\" can not return left value!";
}

const char* BitwiseXor::nonLValueErrorMessage() const {
  return "Bitwise XOR operator \"^\" can not return left value!";
}

const char* LeftShift::nonLValueErrorMessage() const {
  return "Left shift operator \"<<\" can not return left value!";
}

const char* RightShift::nonLValueErrorMessage() const {
  return "Right shift operator \">>\" can not return left value!";
}

llvm::Value* UnaryExpr::genIncDecCode(CodeGenerator& generator, bool increment,
                                      bool returnOperandPtr,
                                      const char* invalidTypeMessage) {
  llvm::Value* operand = operand_->genCodePtr(generator);
  VarType* lvalueVarType = operand_->getLValueVarType(generator);
  llvm::Value* value = generator.getBuilder().CreateLoad(
      vartype::memoryAccessType(lvalueVarType, generator), operand);
  if (value != nullptr && (value->getType()->isIntegerTy() ||
                           value->getType()->isFloatingPointTy() ||
                           value->getType()->isPointerTy())) {
    // Non-integers have no integer width; fall back to 64 so getOneValue yields
    // an i64 "1". createAdd/createSub then reinterpret it: a one-element GEP
    // step for pointers, or a promoted 1.0 for floats.
    const size_t valueBitWidth =
        value->getType()->isIntegerTy()
            ? static_cast<llvm::IntegerType*>(value->getType())->getBitWidth()
            : 64;
    llvm::Value* oneValue =
        iridiom::getOneValue(generator.getBuilder(), valueBitWidth);
    llvm::Value* updated =
        increment ? ops::createAdd(generator.getBuilder(), value, oneValue,
                                   lvalueVarType, nullptr, generator,
                                   operand_->getLValueTypeId(generator),
                                   BuiltinTypeId::INT)
                  : ops::createSub(generator.getBuilder(), value, oneValue,
                                   lvalueVarType, nullptr, generator,
                                   operand_->getLValueTypeId(generator),
                                   BuiltinTypeId::INT);
    generator.getBuilder().CreateStore(updated, operand);
    return returnOperandPtr ? operand : value;
  }

  throw std::logic_error(invalidTypeMessage);
}

const char* PostfixInc::nonLValueErrorMessage() const {
  return "Postfix inc operator \"++\" can not return left value!";
}

const char* PostfixDec::nonLValueErrorMessage() const {
  return "Postfix dec operator \"--\" can not return left value!";
}

const char* BitwiseNot::nonLValueErrorMessage() const {
  return "Bitwise NOT operator \"~\" can not return left value!";
}

llvm::Value* Assign::genCodePtr(CodeGenerator& generator) {
  return genSimpleAssignPtr(generator);
}

llvm::Value* LhsRhsAssign::genCode(CodeGenerator& generator) {
  return loadFromLValuePtr(generator);
}

llvm::Value* LhsRhsAssign::genSimpleAssignPtr(CodeGenerator& generator) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  return iridiom::createAssign(generator.getBuilder(), lhs, rhs,
                               lhs_->getLValueVarType(generator), generator,
                               rhs_->getExprTypeId(generator),
                               lhs_->getLValueTypeId(generator));
}

llvm::Value* LhsRhsAssign::genCompoundAssignPtr(
    CodeGenerator& generator,
    const std::function<llvm::Value*(llvm::Value*, llvm::Value*)>& applyOp) {
  llvm::Value* lhs = lhs_->genCodePtr(generator);
  llvm::Value* rhs = rhs_->genCode(generator);
  VarType* lhsVarType = lhs_->getLValueVarType(generator);
  llvm::Value* loaded = generator.getBuilder().CreateLoad(
      vartype::memoryAccessType(lhsVarType, generator), lhs);
  return iridiom::createAssign(
      generator.getBuilder(), lhs, applyOp(loaded, rhs), lhsVarType, generator,
      rhs_->getExprTypeId(generator), lhs_->getLValueTypeId(generator));
}

llvm::Value* Add::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createAdd(
            generator.getBuilder(), lhs, rhs, lhs_->getExprVarType(generator),
            rhs_->getExprVarType(generator), generator,
            lhs_->getExprTypeId(generator), rhs_->getExprTypeId(generator));
      });
}

llvm::Value* Sub::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createSub(
            generator.getBuilder(), lhs, rhs, lhs_->getExprVarType(generator),
            rhs_->getExprVarType(generator), generator,
            lhs_->getExprTypeId(generator), rhs_->getExprTypeId(generator));
      });
}

llvm::Value* Mul::genCode(CodeGenerator& generator) {
  return genBinaryCode(generator,
                       [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
                         return ops::createMul(generator.getBuilder(), lhs, rhs,
                                               lhs_->getExprTypeId(generator),
                                               rhs_->getExprTypeId(generator));
                       });
}

llvm::Value* Div::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createDiv(generator.getBuilder(), lhs, rhs,
                              lhs_->getExprTypeId(generator),
                              rhs_->getExprTypeId(generator),
                              Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}

llvm::Value* Mod::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createMod(generator.getBuilder(), lhs, rhs,
                              lhs_->getExprTypeId(generator),
                              rhs_->getExprTypeId(generator),
                              Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}

llvm::Value* PostfixInc::genCode(CodeGenerator& generator) {
  return genIncDecCode(
      generator, true, false,
      "Postfix inc operator \"++\" must applies to variables of type integer, "
      "floating point, or pointer!");
}

llvm::Value* PostfixDec::genCode(CodeGenerator& generator) {
  return genIncDecCode(
      generator, false, false,
      "Postfix dec operator \"--\" must applies to variables of type integer, "
      "floating point, or pointer!");
}

llvm::Value* PrefixInc::genCode(CodeGenerator& generator) {
  return loadFromLValuePtr(generator);
}

llvm::Value* PrefixInc::genCodePtr(CodeGenerator& generator) {
  return genIncDecCode(
      generator, true, true,
      "Prefix inc operator \"++\" must applies to variables of type integer, "
      "floating point, or pointer!");
}

llvm::Value* PrefixDec::genCode(CodeGenerator& generator) {
  return loadFromLValuePtr(generator);
}

llvm::Value* PrefixDec::genCodePtr(CodeGenerator& generator) {
  return genIncDecCode(
      generator, false, true,
      "Prefix dec operator \"--\" must applies to variables of type integer, "
      "floating point, or pointer!");
}

llvm::Value* AddAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(generator, [this, &generator](llvm::Value* loaded,
                                                            llvm::Value* rhs) {
    return ops::createAdd(
        generator.getBuilder(), loaded, rhs, lhs_->getLValueVarType(generator),
        rhs_->getExprVarType(generator), generator,
        lhs_->getLValueTypeId(generator), rhs_->getExprTypeId(generator));
  });
}

llvm::Value* SubAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(generator, [this, &generator](llvm::Value* loaded,
                                                            llvm::Value* rhs) {
    return ops::createSub(
        generator.getBuilder(), loaded, rhs, lhs_->getLValueVarType(generator),
        rhs_->getExprVarType(generator), generator,
        lhs_->getLValueTypeId(generator), rhs_->getExprTypeId(generator));
  });
}

llvm::Value* MulAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createMul(generator.getBuilder(), loaded, rhs,
                              lhs_->getLValueTypeId(generator),
                              rhs_->getExprTypeId(generator));
      });
}

llvm::Value* DivAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createDiv(generator.getBuilder(), loaded, rhs,
                              lhs_->getLValueTypeId(generator),
                              rhs_->getExprTypeId(generator),
                              Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}

llvm::Value* ModAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createMod(generator.getBuilder(), loaded, rhs,
                              lhs_->getLValueTypeId(generator),
                              rhs_->getExprTypeId(generator),
                              Expr::binaryIsUnsigned(lhs_, rhs_, generator));
      });
}

llvm::Value* BitwiseAnd::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createBitwiseAnd(generator.getBuilder(), lhs, rhs,
                                     lhs_->getExprTypeId(generator),
                                     rhs_->getExprTypeId(generator));
      });
}

llvm::Value* BitwiseOr::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createBitwiseOr(generator.getBuilder(), lhs, rhs,
                                    lhs_->getExprTypeId(generator),
                                    rhs_->getExprTypeId(generator));
      });
}

llvm::Value* BitwiseXor::genCode(CodeGenerator& generator) {
  return genBinaryCode(
      generator, [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
        return ops::createBitwiseXor(generator.getBuilder(), lhs, rhs,
                                     lhs_->getExprTypeId(generator),
                                     rhs_->getExprTypeId(generator));
      });
}

llvm::Value* BitwiseNot::genCode(CodeGenerator& generator) {
  llvm::Value* operand = operand_->genCode(generator);
  if (operand->getType()->isIntegerTy()) {
    return generator.getBuilder().CreateNot(operand);
  }

  throw std::logic_error(
      "Bitwise NOT operator \"~\" must be applied to variable of integer.");
}

llvm::Value* BitwiseAndAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createBitwiseAnd(generator.getBuilder(), loaded, rhs,
                                     lhs_->getLValueTypeId(generator),
                                     rhs_->getExprTypeId(generator));
      });
}

llvm::Value* BitwiseOrAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createBitwiseOr(generator.getBuilder(), loaded, rhs,
                                    lhs_->getLValueTypeId(generator),
                                    rhs_->getExprTypeId(generator));
      });
}

llvm::Value* BitwiseXorAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createBitwiseXor(generator.getBuilder(), loaded, rhs,
                                     lhs_->getLValueTypeId(generator),
                                     rhs_->getExprTypeId(generator));
      });
}

llvm::Value* LeftShift::genCode(CodeGenerator& generator) {
  return genBinaryCode(generator,
                       [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
                         return ops::createShl(generator.getBuilder(), lhs, rhs,
                                               lhs_->getExprTypeId(generator),
                                               rhs_->getExprTypeId(generator));
                       });
}

llvm::Value* RightShift::genCode(CodeGenerator& generator) {
  return genBinaryCode(generator,
                       [this, &generator](llvm::Value* lhs, llvm::Value* rhs) {
                         return ops::createShr(generator.getBuilder(), lhs, rhs,
                                               lhs_->getExprTypeId(generator),
                                               rhs_->getExprTypeId(generator));
                       });
}

llvm::Value* LeftShiftAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createShl(generator.getBuilder(), loaded, rhs,
                              lhs_->getLValueTypeId(generator),
                              rhs_->getExprTypeId(generator));
      });
}

llvm::Value* RightShiftAssign::genCodePtr(CodeGenerator& generator) {
  return genCompoundAssignPtr(
      generator, [this, &generator](llvm::Value* loaded, llvm::Value* rhs) {
        return ops::createShr(generator.getBuilder(), loaded, rhs,
                              lhs_->getLValueTypeId(generator),
                              rhs_->getExprTypeId(generator));
      });
}

}  // namespace AST
