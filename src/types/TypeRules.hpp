#pragma once

#include "ast/BuiltinTypeId.hpp"

/// \file
/// C type rules that LLVM's type system cannot express. LLVM integer types
/// (i8, i32, ...) carry no signed/unsigned flag, so lcc keeps C signedness in
/// AST::BuiltinTypeId and consults these predicates to choose sdiv/udiv,
/// sext/zext, icmp slt/ult, SIToFP/UIToFP, and so on.
///
/// This is a leaf module: pure functions over BuiltinTypeId, with no dependency
/// on LLVM or on AST nodes. Mapping an AST type to a BuiltinTypeId or an
/// llvm::Type* is types/VarTypeQuery.hpp; the lowering that acts on these
/// answers is irgen/TypeConversion.hpp and irgen/Operators.hpp.
///
/// == Why these are constexpr, and why the bodies are here ==
///
/// Which type an operand pair converts to depends only on the two C types --
/// never on the values, and never on LLVM. A rule that reads nothing but its
/// arguments can be evaluated while lcc itself is being compiled, so these are
/// constexpr and live in the header rather than behind a call into a .cpp.
/// types/TypeRules.cpp spends that ability on static_asserts, which check the
/// ladder below at build time instead of leaving it to the test suite.
///
/// Two deliberate simplifications, both visible below:
///   - float never survives a binary operation; any floating operand yields
///     double. Real C keeps float when neither operand is double.
///   - char/short/bool are the only types promoted; C's bit-fields and enums
///     with fixed underlying types are out of scope for lcc's C subset.

/// \namespace typerules
/// C's type rules as pure predicates over AST::BuiltinTypeId: signedness,
/// integer promotion, and the usual arithmetic conversions. Decides which type
/// an operand pair converts to; emits nothing.
namespace typerules {

/// Named without the AST:: prefix in the bodies below; the enum itself belongs
/// to ast/, which is this module's only dependency.
using AST::BuiltinTypeId;

[[nodiscard]] constexpr bool isUnsignedTypeId(BuiltinTypeId typeId) {
  switch (typeId) {
    case BuiltinTypeId::UCHAR:
    case BuiltinTypeId::USHORT:
    case BuiltinTypeId::UINT:
    case BuiltinTypeId::ULONG:
      return true;
    default:
      return false;
  }
}

[[nodiscard]] constexpr bool isIntegerTypeId(BuiltinTypeId typeId) {
  switch (typeId) {
    case BuiltinTypeId::CHAR:
    case BuiltinTypeId::SHORT:
    case BuiltinTypeId::INT:
    case BuiltinTypeId::LONG:
    case BuiltinTypeId::UCHAR:
    case BuiltinTypeId::USHORT:
    case BuiltinTypeId::UINT:
    case BuiltinTypeId::ULONG:
    case BuiltinTypeId::BOOL:
      return true;
    default:
      return false;
  }
}

[[nodiscard]] constexpr bool isFloatingTypeId(BuiltinTypeId typeId) {
  return typeId == BuiltinTypeId::FLOAT || typeId == BuiltinTypeId::DOUBLE;
}

/// C integer promotion: anything narrower than int is widened to int before it
/// takes part in arithmetic. This is why `char a, b; a + b` has type int, and
/// why lcc emits an i32 add there rather than an i8 one.
[[nodiscard]] constexpr BuiltinTypeId integerPromotion(BuiltinTypeId typeId) {
  switch (typeId) {
    case BuiltinTypeId::CHAR:
    case BuiltinTypeId::SHORT:
    case BuiltinTypeId::UCHAR:
    case BuiltinTypeId::USHORT:
    case BuiltinTypeId::BOOL:
      return BuiltinTypeId::INT;
    default:
      return typeId;
  }
}

/// The "usual arithmetic conversions": given two operand types, the one type
/// both are converted to. Promote each operand first, then walk a fixed ladder
/// from widest to narrowest and take the first rung that either operand
/// reaches:
///
///   double  >  unsigned long  >  long  >  unsigned int  >  int
///
/// The long rung is the subtle one, and the reason it is not simply "either
/// operand is long, so the answer is long" by luck. C converts to the signed
/// type only when that type can represent every value of the unsigned one
/// (C11 6.3.1.8). lcc targets LP64, where long is 64 bits and unsigned int is
/// 32, so it can — and the rung above has already taken every pair involving
/// unsigned long, which is exactly the case where it cannot. What reaches here
/// is long against int or unsigned int, and long covers both.
///
/// Signedness is not reported separately. A caller choosing udiv over sdiv,
/// lshr over ashr, or icmp ult over slt asks isUnsignedTypeId() about the type
/// returned here. This took a `bool&` out-parameter until that was checked: on
/// every rung above, an unsigned result and an unsigned answer occur together,
/// so the second output only restated the first.
[[nodiscard]] constexpr BuiltinTypeId usualArithmeticConversion(
    BuiltinTypeId lhsTypeId, BuiltinTypeId rhsTypeId) {
  lhsTypeId = integerPromotion(lhsTypeId);
  rhsTypeId = integerPromotion(rhsTypeId);

  if (isFloatingTypeId(lhsTypeId) || isFloatingTypeId(rhsTypeId)) {
    return BuiltinTypeId::DOUBLE;
  }

  if (lhsTypeId == BuiltinTypeId::ULONG || rhsTypeId == BuiltinTypeId::ULONG) {
    return BuiltinTypeId::ULONG;
  }
  if (lhsTypeId == BuiltinTypeId::LONG || rhsTypeId == BuiltinTypeId::LONG) {
    return BuiltinTypeId::LONG;
  }
  if (isUnsignedTypeId(lhsTypeId) || isUnsignedTypeId(rhsTypeId)) {
    return BuiltinTypeId::UINT;
  }

  return BuiltinTypeId::INT;
}

}  // namespace typerules
