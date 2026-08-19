#pragma once

#include "ast/BuiltinTypeId.hpp"

namespace llvm {

class LLVMContext;
class Type;

}  // namespace llvm

// C's scalar width table: which llvm::Type each AST::BuiltinTypeId is
// represented by — char -> i8, int -> i32, long -> i64, and so on. Stated once
// here, so adding a scalar type such as `long long` is one edit rather than two
// switches that can silently drift apart.
//
// Nearly a leaf, in the way types/TypeRules.hpp beside it is one: it needs no
// AST node and no TypeEnv, only the enum and a context to build types in. It
// names llvm::Type, which TypeRules deliberately does not, so it is a separate
// file rather than a section of that one.
//
// Asking for so little is the point. A width lookup has no name to resolve and
// no aggregate to map, so it takes a bare LLVMContext — which is what lets
// irgen/TypeConversion.cpp call it, holding an IRBuilder but no type
// environment.
//
// Split out of types/VarTypeQuery.hpp, where it was the one function that took
// no AST::VarType. Both of its callers — irgen/TypeToIr.cpp and
// irgen/TypeConversion.cpp — use nothing else from there, so reaching this
// table meant including nine VarType queries to call the one function that
// queries no VarType at all.
namespace builtinmap {

// The llvm::Type a C builtin type is represented by; null for UNKNOWN.
llvm::Type* toLlvmType(AST::BuiltinTypeId typeId, llvm::LLVMContext& context);

}  // namespace builtinmap
