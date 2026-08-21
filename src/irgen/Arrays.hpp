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

/// \file
/// Array declarator bounds and array initializers — everything VarDecl::genCode
/// delegates to once a declarator turns out to have [ ] on it. Three steps, in
/// the order the walker calls them: resolveBounds fills in an inferred [ ],
/// buildVarType turns the bounds into a type, and one of the four builders
/// below initializes the storage.
///
/// Nothing in here repeats the word "array": the namespace already says it, so
/// a call site reads arrays::buildVarType, not arrays::buildArrayVarType.
///
/// Split out of irgen/DeclToIr.cpp, where it was over half the file. The walker
/// there is about declarations; how `int a[][5] = {{1},{2,3}}` picks its row
/// count, and which of four shapes an initializer lowers to, is a subject of
/// its own.
///
/// There are four builders rather than one because two independent axes cross:
///
///            brace { … }              string "…"
///   global   buildBraceInitializer    buildGlobalStringInitializer
///   local    storeBraceInitializer    storeLocalStringInitializer
///
/// A global initializer must be a compile-time llvm::Constant, so it is
/// *assembled* and returned; a local one runs inside a function, so it is
/// *emitted* as GEP/store pairs against storage the caller already has. Brace
/// and string differ again in where element values come from — AST expressions
/// versus the bytes of a literal, zero-padded out to the declared bound.
///
/// Both brace paths normalize to one slot per element with nullptr meaning
/// zero-fill before they diverge, which is what keeps 1D and 2D from needing
/// two spellings of the same loop.

/// \namespace arrays
/// Array declarator bounds, and the four initializer shapes AST::VarDecl's
/// lowering delegates to.
namespace arrays {

/// Element type and length of a one-dimensional array type.
struct Info1D {
  AST::VarType* elemVarType;
  size_t length;
};

/// True for the `[]` sentinel a declarator leaves behind, before
/// resolveBounds has replaced it with a length from the initializer.
[[nodiscard]] bool isInferredBound(size_t bound);

[[nodiscard]] bool isCharElementType(AST::VarType* baseType);

/// Non-null only when expr is a string literal, which is what distinguishes
/// `char s[] = "hi"` from every other single-expression initializer.
[[nodiscard]] AST::ConstStr* asConstStr(AST::Expr* expr);

/// Value as an llvm::Constant, or std::logic_error naming the context. Every
/// global initializer has to clear this bar, array or not.
[[nodiscard]] llvm::Constant* asConstant(llvm::Value* value,
                                         const std::string& context);

/// Declarator bounds with any inferred (`[]`) dimension replaced by a length
/// read off the initializer. Only the first dimension may be inferred.
[[nodiscard]] std::vector<size_t> resolveBounds(const AST::VarInit* var,
                                                AST::VarType* baseType);

/// The type a declarator denotes: one ArrayType per bound, nested innermost
/// first around baseType, so `int a[8][5]` gives int[8][5] — a[i] is int[5] and
/// a[i][j] is int.
///
/// Takes bounds already resolved above and throws on any still inferred. The
/// two are one step split in half, because resolving needs the initializer and
/// this does not.
///
/// The caller owns the returned chain down to, but not including, baseType:
/// that is what AST::VarInit::arrayVarType_ holds and ~VarInit releases through
/// AST::releaseArrayTypeChain.
[[nodiscard]] AST::VarType* buildVarType(AST::VarType* baseType,
                                         const std::vector<size_t>& bounds);

[[nodiscard]] Info1D get1DInfo(AST::VarType* varType);

void storeBraceInitializer(CodeGenerator& generator, llvm::Value* storagePtr,
                           llvm::Type* llvmArrayType, AST::VarType* varType,
                           const AST::InitList& initList);

[[nodiscard]] llvm::Constant* buildBraceInitializer(
    CodeGenerator& generator, AST::VarType* varType, llvm::Type* llvmVarType,
    const AST::InitList& initList);

[[nodiscard]] llvm::Constant* buildGlobalStringInitializer(
    llvm::Type* charLlvmType, size_t length, const std::string& str);

void storeLocalStringInitializer(CodeGenerator& generator,
                                 llvm::Value* storagePtr,
                                 llvm::Type* llvmArrayType,
                                 llvm::Type* charLlvmType, size_t length,
                                 const std::string& str);

}  // namespace arrays
