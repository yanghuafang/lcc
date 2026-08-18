#pragma once

#include <cstddef>
#include <string>
#include <vector>

#include "ast/Nodes.hpp"

class CodeGenerator;

namespace llvm {

class Constant;
class Type;
class Value;

}  // namespace llvm

// Array declarator bounds and array initializers — everything VarDecl::genCode
// delegates to once a declarator turns out to have [ ] on it.
//
// Split out of irgen/DeclToIr.cpp, where it was over half the file. The walker
// there is about declarations; how `int a[][5] = {{1},{2,3}}` picks its row
// count, and which of four shapes an initializer lowers to, is a subject of its
// own.
//
// There are four builders rather than one because two independent axes cross:
//
//                  brace { … }                      string "…"
//   global   buildBraceArrayInitializer   buildGlobalStringArrayInitializer
//   local    storeBraceArrayInitializer   storeLocalStringArrayInitializer
//
// A global initializer must be a compile-time llvm::Constant, so it is
// *assembled* and returned; a local one runs inside a function, so it is
// *emitted* as GEP/store pairs against storage the caller already has. Brace
// and string differ again in where element values come from — AST expressions
// versus the bytes of a literal, zero-padded out to the declared bound.
//
// Both brace paths normalize to one slot per element with nullptr meaning
// zero-fill before they diverge, which is what keeps 1D and 2D from needing
// two spellings of the same loop.
namespace arrayinit {

// Element type and length of a one-dimensional array type.
struct Array1DInfo {
  AST::VarType* elemVarType;
  size_t length;
};

// True for the `[]` sentinel a declarator leaves behind, before
// resolveArrayBounds has replaced it with a length from the initializer.
bool isInferredArrayBound(size_t bound);

bool isCharElementType(AST::VarType* baseType);

// Non-null only when expr is a string literal, which is what distinguishes
// `char s[] = "hi"` from every other single-expression initializer.
AST::ConstStr* asConstStr(AST::Expr* expr);

// Value as an llvm::Constant, or std::logic_error naming the context. Every
// global initializer has to clear this bar, array or not.
llvm::Constant* asConstant(llvm::Value* value, const std::string& context);

// Declarator bounds with any inferred (`[]`) dimension replaced by a length
// read off the initializer. Only the first dimension may be inferred.
std::vector<size_t> resolveArrayBounds(const AST::VarInit* var,
                                       AST::VarType* baseType);

Array1DInfo get1DArrayInfo(AST::VarType* varType);

void storeBraceArrayInitializer(CodeGenerator& generator,
                                llvm::Value* storagePtr,
                                llvm::Type* llvmArrayType,
                                AST::VarType* varType,
                                const AST::InitList& initList);

llvm::Constant* buildBraceArrayInitializer(CodeGenerator& generator,
                                           AST::VarType* varType,
                                           llvm::Type* llvmVarType,
                                           const AST::InitList& initList);

llvm::Constant* buildGlobalStringArrayInitializer(llvm::Type* charLlvmType,
                                                  size_t length,
                                                  const std::string& str);

void storeLocalStringArrayInitializer(CodeGenerator& generator,
                                      llvm::Value* storagePtr,
                                      llvm::Type* llvmArrayType,
                                      llvm::Type* charLlvmType, size_t length,
                                      const std::string& str);

}  // namespace arrayinit
