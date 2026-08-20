#include "types/TypeRules.hpp"

// Compile-time checks for the rules in types/TypeRules.hpp.
//
// Those rules are constexpr, so the ladder they implement can be verified while
// lcc itself is compiled rather than only by running the suite: a wrong rung
// fails the build, on the line that states the expectation. Checking them is
// all this translation unit does — the rules live in the header, because a
// caller can only constant-evaluate what it can see.

namespace {

using AST::BuiltinTypeId;

// usualArithmeticConversion reports signedness through a reference, which an
// assertion cannot pass directly. A constexpr function can, so these two
// wrappers split its answer into the halves the assertions ask about.
constexpr BuiltinTypeId conversionOf(BuiltinTypeId lhs, BuiltinTypeId rhs) {
  bool isUnsigned = false;
  return typerules::usualArithmeticConversion(lhs, rhs, isUnsigned);
}

constexpr bool conversionIsUnsigned(BuiltinTypeId lhs, BuiltinTypeId rhs) {
  bool isUnsigned = false;
  typerules::usualArithmeticConversion(lhs, rhs, isUnsigned);
  return isUnsigned;
}

// --- Predicates -------------------------------------------------------------

static_assert(typerules::isUnsignedTypeId(BuiltinTypeId::UINT));
static_assert(!typerules::isUnsignedTypeId(BuiltinTypeId::INT));
static_assert(!typerules::isUnsignedTypeId(BuiltinTypeId::DOUBLE));

static_assert(typerules::isIntegerTypeId(BuiltinTypeId::BOOL));
static_assert(!typerules::isIntegerTypeId(BuiltinTypeId::DOUBLE));
static_assert(!typerules::isIntegerTypeId(BuiltinTypeId::VOID));

static_assert(typerules::isFloatingTypeId(BuiltinTypeId::FLOAT));
static_assert(typerules::isFloatingTypeId(BuiltinTypeId::DOUBLE));
static_assert(!typerules::isFloatingTypeId(BuiltinTypeId::LONG));

// --- Integer promotion ------------------------------------------------------

static_assert(typerules::integerPromotion(BuiltinTypeId::CHAR) ==
              BuiltinTypeId::INT);
static_assert(typerules::integerPromotion(BuiltinTypeId::BOOL) ==
              BuiltinTypeId::INT);
static_assert(typerules::integerPromotion(BuiltinTypeId::USHORT) ==
              BuiltinTypeId::INT);
// Anything already int-ranked or wider is left alone.
static_assert(typerules::integerPromotion(BuiltinTypeId::UINT) ==
              BuiltinTypeId::UINT);
static_assert(typerules::integerPromotion(BuiltinTypeId::LONG) ==
              BuiltinTypeId::LONG);

// --- The conversion ladder --------------------------------------------------

// `char a, b; a + b` has type int, which is why lcc emits an i32 add there.
static_assert(conversionOf(BuiltinTypeId::CHAR, BuiltinTypeId::CHAR) ==
              BuiltinTypeId::INT);
static_assert(conversionOf(BuiltinTypeId::INT, BuiltinTypeId::INT) ==
              BuiltinTypeId::INT);
static_assert(conversionOf(BuiltinTypeId::INT, BuiltinTypeId::UINT) ==
              BuiltinTypeId::UINT);
static_assert(conversionOf(BuiltinTypeId::LONG, BuiltinTypeId::INT) ==
              BuiltinTypeId::LONG);
static_assert(conversionOf(BuiltinTypeId::ULONG, BuiltinTypeId::INT) ==
              BuiltinTypeId::ULONG);
// float never survives a binary operation; either floating operand gives
// double.
static_assert(conversionOf(BuiltinTypeId::FLOAT, BuiltinTypeId::INT) ==
              BuiltinTypeId::DOUBLE);
static_assert(conversionOf(BuiltinTypeId::FLOAT, BuiltinTypeId::FLOAT) ==
              BuiltinTypeId::DOUBLE);
// The documented LP64 simplification: long could represent every unsigned int
// on this target, yet the pair converts to unsigned long rather than long.
static_assert(conversionOf(BuiltinTypeId::LONG, BuiltinTypeId::UINT) ==
              BuiltinTypeId::ULONG);

// The ladder is symmetric in its operands.
static_assert(conversionOf(BuiltinTypeId::INT, BuiltinTypeId::LONG) ==
              conversionOf(BuiltinTypeId::LONG, BuiltinTypeId::INT));
static_assert(conversionOf(BuiltinTypeId::UINT, BuiltinTypeId::LONG) ==
              conversionOf(BuiltinTypeId::LONG, BuiltinTypeId::UINT));

// --- Signedness of the result -----------------------------------------------

static_assert(conversionIsUnsigned(BuiltinTypeId::INT, BuiltinTypeId::UINT));
static_assert(!conversionIsUnsigned(BuiltinTypeId::INT, BuiltinTypeId::LONG));
static_assert(!conversionIsUnsigned(BuiltinTypeId::FLOAT, BuiltinTypeId::UINT));

}  // namespace
