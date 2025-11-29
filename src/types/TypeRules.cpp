#include "types/TypeRules.hpp"

// C's arithmetic type rules, as pure functions over BuiltinTypeId.
//
// Every operand pair in C is brought to one common type before the operation
// happens, and which type that is depends only on the two C types — never on
// the values, and never on LLVM. That independence is why this file compiles
// without LLVM or the AST: it decides, and irgen/TypeConversion.cpp emits.
//
// Two deliberate simplifications, both visible below:
//   - float never survives a binary operation; any floating operand yields
//     double. Real C keeps float when neither operand is double.
//   - char/short/bool are the only types promoted; C's bit-fields and enums
//     with fixed underlying types are out of scope for lcc's C subset.

using AST::BuiltinTypeId;

namespace typerules {

bool isUnsignedTypeId(BuiltinTypeId typeId) {
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

bool isIntegerTypeId(BuiltinTypeId typeId) {
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

bool isFloatingTypeId(BuiltinTypeId typeId) {
  return typeId == BuiltinTypeId::FLOAT || typeId == BuiltinTypeId::DOUBLE;
}

// C integer promotion: anything narrower than int is widened to int before it
// takes part in arithmetic. This is why `char a, b; a + b` has type int, and
// why lcc emits an i32 add there rather than an i8 one.
BuiltinTypeId integerPromotion(BuiltinTypeId typeId) {
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

// The "usual arithmetic conversions": given two operand types, the one type
// both are converted to. Promote each operand first, then walk a fixed ladder
// from widest to narrowest and take the first rung that either operand reaches:
//
//   double  >  unsigned long  >  long  >  unsigned int  >  int
//
// The long rung is the subtle one. `long` and `unsigned int` have the same rank
// position here, and C says the signed type wins only if it can represent every
// value of the unsigned one. lcc targets LP64, where long is 64-bit and
// unsigned int is 32-bit, so long *can* — yet this returns ULONG instead. That
// is a deliberate simplification, and it is why the check below tests
// isUnsignedTypeId on either operand rather than comparing widths.
//
// isUnsigned is an out-parameter rather than derived from the result because
// callers need it to pick the LLVM opcode — udiv vs sdiv, lshr vs ashr, icmp
// ult vs slt — and LLVM's integer types carry no signedness of their own.
BuiltinTypeId usualArithmeticConversion(BuiltinTypeId lhsTypeId,
                                        BuiltinTypeId rhsTypeId,
                                        bool& isUnsigned) {
  lhsTypeId = integerPromotion(lhsTypeId);
  rhsTypeId = integerPromotion(rhsTypeId);

  if (isFloatingTypeId(lhsTypeId) || isFloatingTypeId(rhsTypeId)) {
    isUnsigned = false;
    return BuiltinTypeId::DOUBLE;
  }

  if (lhsTypeId == BuiltinTypeId::ULONG || rhsTypeId == BuiltinTypeId::ULONG) {
    isUnsigned = true;
    return BuiltinTypeId::ULONG;
  }
  if (lhsTypeId == BuiltinTypeId::LONG || rhsTypeId == BuiltinTypeId::LONG) {
    if (isUnsignedTypeId(lhsTypeId) || isUnsignedTypeId(rhsTypeId)) {
      isUnsigned = true;
      return BuiltinTypeId::ULONG;
    }
    isUnsigned = false;
    return BuiltinTypeId::LONG;
  }
  if (isUnsignedTypeId(lhsTypeId) || isUnsignedTypeId(rhsTypeId)) {
    isUnsigned = true;
    return BuiltinTypeId::UINT;
  }

  isUnsigned = false;
  return BuiltinTypeId::INT;
}

}  // namespace typerules
