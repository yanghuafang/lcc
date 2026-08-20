#pragma once

#include <llvm/IR/IRBuilder.h>

#include "ast/BuiltinTypeId.hpp"

namespace llvm {

class Type;
class Value;

}  // namespace llvm

/// \file
/// Emission half of C's conversion rules: given a source and destination
/// AST::BuiltinTypeId, emit the LLVM instruction that performs the conversion —
/// sext vs zext, SIToFP vs UIToFP, FPToSI vs FPToUI, fpext, ptrtoint.
///
/// This is the counterpart to types/TypeRules.hpp, and the pair splits one
/// question in two: `typerules::usualArithmeticConversion` *decides* what the
/// common type of an operand pair is, using only C's rules and no LLVM at all;
/// the functions here *emit* the instructions that get the values there.
/// Keeping the decision LLVM-free is what lets types/ stay a leaf, so these
/// live in irgen/ instead — they need an IRBuilder, and anything holding an
/// IRBuilder belongs on this side of the line.
///
/// The signedness that drives every choice below comes from BuiltinTypeId, not
/// from llvm::Type: an LLVM i32 records no signedness of its own.
namespace convert {

/// Convert value to type. Returns nullptr if no conversion applies.
[[nodiscard]] llvm::Value* typeCast(
    llvm::IRBuilder<>& builder, llvm::Value* value, llvm::Type* type,
    AST::BuiltinTypeId srcTypeId = AST::BuiltinTypeId::UNKNOWN,
    AST::BuiltinTypeId dstTypeId = AST::BuiltinTypeId::UNKNOWN);

/// Truth test for conditions: != 0 for integers and floats, != null for
/// pointers.
[[nodiscard]] llvm::Value* castToBool(llvm::IRBuilder<>& builder,
                                      llvm::Value* value);

/// Widen value toward type, never narrow. Used where C promotes but must not
/// truncate.
llvm::Value* typeUpgrade(llvm::IRBuilder<>& builder, llvm::Value* value,
                         llvm::Type* type, AST::BuiltinTypeId srcTypeId,
                         AST::BuiltinTypeId dstTypeId);

/// Applies the usual arithmetic conversions to a binary operand pair in place,
/// reporting the common type. Returns false when the operands are not both
/// arithmetic, which is how the operator lowering in irgen/Operators.hpp
/// detects the pointer cases it must handle itself. A caller that needs the
/// signedness of resultTypeId asks typerules::isUnsignedTypeId() for it.
bool typeUpgrade(llvm::IRBuilder<>& builder, llvm::Value*& lhs,
                 llvm::Value*& rhs, AST::BuiltinTypeId lhsTypeId,
                 AST::BuiltinTypeId rhsTypeId,
                 AST::BuiltinTypeId& resultTypeId);

}  // namespace convert
