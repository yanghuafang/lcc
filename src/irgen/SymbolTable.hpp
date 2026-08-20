#pragma once

#include <cstddef>
#include <map>
#include <string>
#include <variant>
#include <vector>

namespace AST {

class StructType;
class UnionType;
class VarType;

}  // namespace AST

namespace llvm {

class Function;
class StructType;
class Type;
class Value;

}  // namespace llvm

// C's name lookup: a stack of scopes, innermost first.
//
// Every find* below walks the stack from the top down, so an inner declaration
// shadows an outer one and lookup stops at the first hit. Push on entering a
// block, function body, or loop; pop on leaving. Use ScopedSymbolTable at the
// bottom of this file rather than pairing push/pop by hand — a lowering that
// throws mid-walk would otherwise leave the stack unbalanced.
//
// Split out of CodeGenerator, which owned this alongside an LLVMContext, a
// Module, and an IRBuilder. Scope handling is the one part of the code
// generator that is pure bookkeeping — no IR is emitted here — so it is the
// part that can be read, and tested, without a compiler around it.
//
// == Two stacks, not one ==
//
//   scopeStack_         variables, functions, types, and enum constants — all
//                       four in a single map, discriminated by Symbol's tag.
//                       A name therefore collides across those four kinds,
//                       which real C would allow to coexist.
//   typedefScopeStack_  typedef aliases, kept separate precisely so that a
//                       typedef name and a variable of the same name do not
//                       collide.
//
// The struct/union registries are *not* scoped and are not part of that stack:
// they map an llvm::StructType* back to the AST node it came from, so member
// access (. and ->) can recover field names and offsets that the LLVM type no
// longer carries. Function signatures are likewise flat — one C translation
// unit has one function namespace.
class SymbolTable {
 public:
  // Push a scope (block, function body, if-branch, loop body).
  void pushScope();

  // Pop the innermost scope.
  void popScope();

  // --- Types (struct/union/enum tags) ---

  [[nodiscard]] llvm::Type* findType(const std::string& typeName);

  // False if the name is already taken in the *current* scope.
  bool addType(const std::string& typeName, llvm::Type* type);

  // --- Typedef aliases ---

  [[nodiscard]] AST::VarType* findTypedefAlias(const std::string& aliasName);

  bool addTypedefAlias(const std::string& aliasName, AST::VarType* varType);

  // True when aliasName is a typedef in the innermost scope only.
  [[nodiscard]] bool hasTypedefAliasInCurrentScope(
      const std::string& aliasName) const;

  // --- Variables ---

  [[nodiscard]] llvm::Value* findVariable(const std::string& varName);

  bool addVariable(const std::string& varName, llvm::Value* var,
                   AST::VarType* varType = nullptr);

  // The C type recorded alongside the variable's storage.
  [[nodiscard]] AST::VarType* findVariableType(const std::string& varName);

  // --- Constants (enum members) ---

  [[nodiscard]] llvm::Value* findConstant(const std::string& varName);

  bool addConstant(const std::string& varName, llvm::Value* var);

  // --- Functions ---

  [[nodiscard]] llvm::Function* findFunction(const std::string& funcName);

  bool addFunction(const std::string& funcName, llvm::Function* func);

  // Parameter and return C types, recorded so a call site can cast its
  // arguments; llvm::FunctionType carries no signedness of its own.
  void setFuncSignature(const std::string& funcName, AST::VarType* retType,
                        const std::vector<AST::VarType*>& paramTypes);

  [[nodiscard]] AST::VarType* findFuncRetType(const std::string& funcName);

  [[nodiscard]] AST::VarType* findFuncParamType(const std::string& funcName,
                                                size_t index);

  // --- Aggregate registries (unscoped; llvm::StructType* -> AST node) ---

  [[nodiscard]] AST::StructType* findStructType(llvm::StructType* type);

  bool addStructType(llvm::StructType* llvmType, AST::StructType* astType);

  [[nodiscard]] AST::UnionType* findUnionType(llvm::StructType* type);

  bool addUnionType(llvm::StructType* llvmType, AST::UnionType* astType);

 private:
  // One map stores functions, types, variables, and constants.
  //
  // The alternative stored is the discriminator: an unset Symbol holds
  // monostate, and each getter asks the variant for one specific alternative
  // and yields nullptr when the symbol is something else. That is the same
  // behaviour a hand-rolled tag plus a void* gives, minus the pointer casts —
  // llvm::Function derives from llvm::Value, so round-tripping one through
  // void* and casting back to the other is the kind of mistake a tag can only
  // catch by convention, and the variant by construction.
  //
  // Variable and Constant wrap llvm::Value* in distinct types because they are
  // distinct alternatives holding the same pointer type, which a variant
  // cannot tell apart on its own.
  class Symbol {
   public:
    Symbol() = default;
    explicit Symbol(llvm::Function* func)
        : content_(std::in_place_type<llvm::Function*>, func) {}
    explicit Symbol(llvm::Type* type)
        : content_(std::in_place_type<llvm::Type*>, type) {}
    explicit Symbol(llvm::Value* value, bool isConst,
                    AST::VarType* varType = nullptr)
        : content_(isConst ? Content{std::in_place_type<Constant>, value}
                           : Content{std::in_place_type<Variable>, value}),
          varType_(varType) {}

    [[nodiscard]] llvm::Function* getFunction() const noexcept {
      const auto* func = std::get_if<llvm::Function*>(&content_);
      return func != nullptr ? *func : nullptr;
    }

    [[nodiscard]] llvm::Type* getType() const noexcept {
      const auto* type = std::get_if<llvm::Type*>(&content_);
      return type != nullptr ? *type : nullptr;
    }

    [[nodiscard]] llvm::Value* getVariable() const noexcept {
      const auto* variable = std::get_if<Variable>(&content_);
      return variable != nullptr ? variable->value : nullptr;
    }

    [[nodiscard]] llvm::Value* getConstant() const noexcept {
      const auto* constant = std::get_if<Constant>(&content_);
      return constant != nullptr ? constant->value : nullptr;
    }

    [[nodiscard]] AST::VarType* getVarType() const noexcept { return varType_; }

   private:
    // Constructors rather than aggregates: std::in_place_type below
    // direct-initializes the alternative, and parenthesized aggregate
    // initialization is a C++20 feature.
    struct Variable {
      explicit Variable(llvm::Value* val) noexcept : value(val) {}
      llvm::Value* value;
    };
    struct Constant {
      explicit Constant(llvm::Value* val) noexcept : value(val) {}
      llvm::Value* value;
    };

    using Content = std::variant<std::monostate, llvm::Function*, llvm::Type*,
                                 Variable, Constant>;

    Content content_;
    AST::VarType* varType_ = nullptr;
  };

  // One scope level. The stacks below own these by value: a scope is pushed and
  // popped, never shared, so there is nothing for a pointer to express here
  // except a chance to leak one. Unwinding out of a half-finished walk drains
  // them without help from a destructor.
  using Scope = std::map<std::string, Symbol>;
  using TypedefScope = std::map<std::string, AST::VarType*>;

  using StructTypeTable = std::map<llvm::StructType*, AST::StructType*>;
  using UnionTypeTable = std::map<llvm::StructType*, AST::UnionType*>;

  std::vector<Scope> scopeStack_;
  std::vector<TypedefScope> typedefScopeStack_;

  StructTypeTable structTypeTable_;
  UnionTypeTable unionTypeTable_;

  std::map<std::string, AST::VarType*> funcRetTypes_;
  std::map<std::string, std::vector<AST::VarType*>> funcParamTypes_;
};

// RAII guard for the scope stack. It lives here rather than at the call sites
// so the push/pop pairing is visible next to the stack it balances, and so an
// exception during codegen cannot leave a scope pushed.
class ScopedSymbolTable {
 public:
  explicit ScopedSymbolTable(SymbolTable& symbols) : symbols_(symbols) {
    symbols_.pushScope();
  }
  ~ScopedSymbolTable() { symbols_.popScope(); }

  ScopedSymbolTable(const ScopedSymbolTable&) = delete;
  ScopedSymbolTable& operator=(const ScopedSymbolTable&) = delete;

 private:
  SymbolTable& symbols_;
};
