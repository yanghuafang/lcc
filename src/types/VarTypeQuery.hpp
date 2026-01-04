#pragma once

#include "ast/BuiltinTypeId.hpp"

namespace AST {

class VarType;

}  // namespace AST

class TypeEnv;

namespace llvm {

class LLVMContext;
class Type;

}  // namespace llvm

// Queries that answer "what type does this AST node denote?" — mapping an
// AST::VarType to either an AST::BuiltinTypeId or a materialized llvm::Type*.
//
// These exist because LLVM 20+ uses opaque pointers: an IR pointer value no
// longer carries its pointee type, so GEP, load, and store must recover the
// element type from the AST instead of from the llvm::Value. Nothing here emits
// instructions; the C type arithmetic these answers feed into lives in
// types/TypeRules.hpp, and the lowering that acts on them in
// irgen/IrIdioms.hpp.
namespace vartype {

AST::BuiltinTypeId varTypeToTypeId(AST::VarType* varType);

// The llvm::Type a C builtin type is represented by; null for UNKNOWN.
//
// The single statement of C's width table — char -> i8, int -> i32, long ->
// i64, and so on. Both AST::BuiltinType::getType (irgen/TypeToIr.cpp) and the
// usual-arithmetic-conversion lowering (irgen/TypeConversion.cpp) answer from
// here, so adding a scalar type such as `long long` is one edit rather than two
// switches that can silently drift apart.
//
// Takes a bare LLVMContext rather than a TypeEnv because that is all it needs:
// no name to look up, no aggregate to map. Asking for less is what keeps the
// table usable from irgen/TypeConversion.cpp, which holds an IRBuilder but no
// type environment.
llvm::Type* builtinTypeIdToLlvmType(AST::BuiltinTypeId typeId,
                                    llvm::LLVMContext& context);

// Peels DefinedType aliases before the queries below.
AST::VarType* resolveTypedefVarType(AST::VarType* varType, TypeEnv& env);

AST::BuiltinTypeId resolvedVarTypeToTypeId(AST::VarType* varType, TypeEnv& env);

// The struct or union a VarType denotes, through typedef aliases and struct tag
// names — a DefinedType such as "Employee" after "typedef struct Employee
// Employee". Null when it denotes neither. Member access (. and ->) needs this
// before it can look a field name up.
AST::VarType* resolveAggregateVarType(AST::VarType* varType, TypeEnv& env);

// LLVM element type for GEP / PtrDiff on a pointer expression (from AST, not
// IR).
llvm::Type* pointerArithmeticElementType(AST::VarType* ptrExprVarType,
                                         TypeEnv& env);

// LLVM type stored through ptr (load/store), after array-to-pointer decay.
llvm::Type* memoryAccessType(AST::VarType* lvalueVarType, TypeEnv& env);

}  // namespace vartype
