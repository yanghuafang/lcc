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
static_assert(typerules::usualArithmeticConversion(BuiltinTypeId::CHAR,
                                                   BuiltinTypeId::CHAR) ==
              BuiltinTypeId::INT);
static_assert(typerules::usualArithmeticConversion(BuiltinTypeId::INT,
                                                   BuiltinTypeId::INT) ==
              BuiltinTypeId::INT);
static_assert(typerules::usualArithmeticConversion(BuiltinTypeId::INT,
                                                   BuiltinTypeId::UINT) ==
              BuiltinTypeId::UINT);
static_assert(typerules::usualArithmeticConversion(BuiltinTypeId::LONG,
                                                   BuiltinTypeId::INT) ==
              BuiltinTypeId::LONG);
static_assert(typerules::usualArithmeticConversion(BuiltinTypeId::ULONG,
                                                   BuiltinTypeId::INT) ==
              BuiltinTypeId::ULONG);
// float never survives a binary operation; either floating operand gives
// double.
static_assert(typerules::usualArithmeticConversion(BuiltinTypeId::FLOAT,
                                                   BuiltinTypeId::INT) ==
              BuiltinTypeId::DOUBLE);
static_assert(typerules::usualArithmeticConversion(BuiltinTypeId::FLOAT,
                                                   BuiltinTypeId::FLOAT) ==
              BuiltinTypeId::DOUBLE);
// The documented LP64 simplification: long could represent every unsigned int
// on this target, yet the pair converts to unsigned long rather than long.
static_assert(typerules::usualArithmeticConversion(BuiltinTypeId::LONG,
                                                   BuiltinTypeId::UINT) ==
              BuiltinTypeId::ULONG);

// The ladder is symmetric in its operands.
static_assert(typerules::usualArithmeticConversion(BuiltinTypeId::INT,
                                                   BuiltinTypeId::LONG) ==
              typerules::usualArithmeticConversion(BuiltinTypeId::LONG,
                                                   BuiltinTypeId::INT));
static_assert(typerules::usualArithmeticConversion(BuiltinTypeId::UINT,
                                                   BuiltinTypeId::LONG) ==
              typerules::usualArithmeticConversion(BuiltinTypeId::LONG,
                                                   BuiltinTypeId::UINT));

// --- Signedness of the result -----------------------------------------------

static_assert(typerules::isUnsignedTypeId(typerules::usualArithmeticConversion(
    BuiltinTypeId::INT, BuiltinTypeId::UINT)));
static_assert(!typerules::isUnsignedTypeId(typerules::usualArithmeticConversion(
    BuiltinTypeId::INT, BuiltinTypeId::LONG)));
static_assert(!typerules::isUnsignedTypeId(typerules::usualArithmeticConversion(
    BuiltinTypeId::FLOAT, BuiltinTypeId::UINT)));

}  // namespace
