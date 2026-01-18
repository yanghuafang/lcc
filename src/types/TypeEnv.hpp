#pragma once

#include <string>
#include <string_view>

namespace AST {

class StructType;
class UnionType;
class VarType;

}  // namespace AST

namespace llvm {

class LLVMContext;
class StructType;
class Type;
class TypeSize;
class Value;

}  // namespace llvm

/// A *type environment*: the bindings a type expression must be interpreted
/// against. Compiler texts write this as Γ, the map from names in scope to the
/// types they denote; here it is the context to build llvm::Types in, the
/// tag/typedef namespaces to look names up in, and the AST<->LLVM aggregate
/// mapping that member access (. and ->) reads back.
///
/// The direction matters: this interface does not resolve anything. A node
/// resolves *itself* against it — VarType::getType(TypeEnv&) in
/// irgen/TypeToIr.cpp — because in C the same spelling denotes different types
/// in different scopes, so a type node is only meaningful paired with an
/// environment.
///
/// CodeGenerator implements it. Type materialization is expressed against this
/// narrow interface rather than CodeGenerator itself so that
/// types/VarTypeQuery.hpp, irgen/TypeConversion.hpp, irgen/Operators.hpp, and
/// DebugInfoBuilder do not depend on the whole code generator.
///
/// Deliberately absent: llvm::IRBuilder. Materializing a type must never emit
/// instructions, and withholding the builder makes that a compile-time
/// guarantee rather than a convention.
class TypeEnv {
 public:
  virtual ~TypeEnv() = default;

  [[nodiscard]] virtual llvm::LLVMContext& getContext() noexcept = 0;

  [[nodiscard]] virtual llvm::TypeSize getTypeSize(llvm::Type* type) = 0;

  /// Struct/union/enum tags, innermost scope first.
  [[nodiscard]] virtual llvm::Type* findType(std::string_view typeName) = 0;

  [[nodiscard]] virtual AST::VarType* findTypedefAlias(
      std::string_view aliasName) = 0;

  virtual bool addStructType(llvm::StructType* llvmType,
                             AST::StructType* astType) = 0;

  [[nodiscard]] virtual AST::StructType* findStructType(
      llvm::StructType* type) = 0;

  virtual bool addUnionType(llvm::StructType* llvmType,
                            AST::UnionType* astType) = 0;

  [[nodiscard]] virtual AST::UnionType* findUnionType(
      llvm::StructType* type) = 0;

  /// Enum members become integer constants in the current scope, so defining an
  /// enum type has this one side effect on the symbol table.
  virtual bool addConstant(const std::string& varName, llvm::Value* var) = 0;
};
