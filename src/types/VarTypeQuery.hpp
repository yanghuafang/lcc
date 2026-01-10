#pragma once

#include "ast/BuiltinTypeId.hpp"

namespace AST {

class VarType;

}  // namespace AST

class TypeEnv;

namespace llvm {

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
//
// Every function below takes an AST::VarType, which is what makes this file
// one subject. The scalar width table that used to sit among them takes only a
// BuiltinTypeId and no AST node at all, so it is types/BuiltinTypeMap.hpp now.
namespace vartype {

AST::BuiltinTypeId varTypeToTypeId(const AST::VarType* varType);

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
