#pragma once

#include "ast/BuiltinTypeId.hpp"

// C type rules that LLVM's type system cannot express. LLVM integer types
// (i8, i32, ...) carry no signed/unsigned flag, so lcc keeps C signedness in
// AST::BuiltinTypeId and consults these predicates to choose sdiv/udiv,
// sext/zext, icmp slt/ult, SIToFP/UIToFP, and so on.
//
// This is a leaf module: pure functions over BuiltinTypeId, with no dependency
// on LLVM or on AST nodes. Mapping an AST type to a BuiltinTypeId or an
// llvm::Type* is types/VarTypeQuery.hpp; the lowering that acts on these
// answers is irgen/TypeConversion.hpp and irgen/Operators.hpp.
namespace typerules {

bool isUnsignedTypeId(AST::BuiltinTypeId typeId);

bool isIntegerTypeId(AST::BuiltinTypeId typeId);

bool isFloatingTypeId(AST::BuiltinTypeId typeId);

AST::BuiltinTypeId integerPromotion(AST::BuiltinTypeId typeId);

AST::BuiltinTypeId usualArithmeticConversion(AST::BuiltinTypeId lhsTypeId,
                                             AST::BuiltinTypeId rhsTypeId,
                                             bool& isUnsigned);

}  // namespace typerules
