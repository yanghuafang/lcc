#pragma once

#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>

#include <memory>
#include <string>
#include <string_view>
#include <vector>

#include "irgen/ControlFlowContext.hpp"
#include "irgen/SymbolTable.hpp"
#include "types/TypeEnv.hpp"

namespace AST {

class Program;
class VarType;
struct SourceLoc;

}  // namespace AST

namespace llvm {

class TypeSize;
class Type;
class Function;
class BasicBlock;
class AllocaInst;
class DIScope;

class Module;

}  // namespace llvm

class DebugInfoBuilder;

/// Owns one translation unit's LLVM state: Context, Module, IRBuilder, and the
/// two bookkeeping subsystems an AST walk runs against. AST nodes call back
/// here for builder access, name lookup, and jump targets.
///
/// This is the context an AST walk runs against, and nothing more. It does not
/// know that a middle end or a target backend exist — the phase ordering lives
/// in driver/Pipeline.hpp, which is what keeps irgen/ dependent on only ast/
/// and types/.
///
/// Implements TypeEnv, the narrow slice of this interface that AST type nodes
/// need to turn themselves into llvm::Type (see types/TypeEnv.hpp).
///
/// What is left here after the split is the part that genuinely needs LLVM:
///
/// 1. LLVM plumbing — getContext / getBuilder / getModule. The IRBuilder always
///    has an insert point, so "where does this instruction land" is a property
///    of the generator, not a parameter.
///
/// 2. Which function is being emitted — enterFunction / leaveFunction /
///    getCurrentFunction, paired by ScopedFunction below. Kept here rather than
///    beside the jump targets because it is what creates basic blocks and
///    entry-block allocas, and because leaveFunction also drops the DWARF
///    lexical scopes, which are per-function.
///
/// 3. Debug info — thin forwarding to DebugInfoBuilder, no-ops without -g, so
///    the walkers never branch on whether debug info is enabled.
///
/// The two subsystems it composes emit no IR of their own and are reached
/// through symbols() and controlFlow():
///
///    symbols()      irgen/SymbolTable.hpp        scoped name lookup
///    controlFlow()  irgen/ControlFlowContext.hpp break / continue targets
///
/// The seven TypeEnv overrides below forward straight into symbols(). They
/// exist as members because TypeEnv is the interface types/ and the irgen
/// services are written against — they must not have to know a SymbolTable
/// exists — not because a facade was wanted for its own sake. Nothing else
/// forwards.
///
/// One structural quirk worth knowing: global initializers need an insert point
/// even though they belong to no function, so buildModule() creates a throwaway
/// function and block for them and erases it afterwards. That is what
/// switchInsertPointToGlobalBlock / ...ToCurrentBlock switch between, and what
/// ScopedGlobalInsertPoint below pairs.
class CodeGenerator final : public TypeEnv {
 public:
  CodeGenerator();
  ~CodeGenerator() override;

  [[nodiscard]] llvm::LLVMContext& getContext() noexcept override {
    return context_;
  }
  [[nodiscard]] llvm::IRBuilder<>& getBuilder() noexcept { return builder_; }
  [[nodiscard]] llvm::Module& getModule() noexcept { return *module_; }

  /// Scoped name lookup: variables, functions, types, typedefs, constants.
  [[nodiscard]] SymbolTable& symbols() noexcept { return symbols_; }

  /// Where break and continue jump to.
  [[nodiscard]] ControlFlowContext& controlFlow() noexcept {
    return controlFlow_;
  }

  [[nodiscard]] llvm::TypeSize getTypeSize(llvm::Type* type) override;

  // --- TypeEnv, forwarded to symbols() ---

  [[nodiscard]] llvm::Type* findType(std::string_view typeName) override {
    return symbols_.findType(typeName);
  }

  [[nodiscard]] AST::VarType* findTypedefAlias(
      std::string_view aliasName) override {
    return symbols_.findTypedefAlias(aliasName);
  }

  bool addConstant(const std::string& varName, llvm::Value* var) override {
    return symbols_.addConstant(varName, var);
  }

  [[nodiscard]] AST::StructType* findStructType(
      llvm::StructType* type) override {
    return symbols_.findStructType(type);
  }

  bool addStructType(llvm::StructType* llvmType,
                     AST::StructType* astType) override {
    return symbols_.addStructType(llvmType, astType);
  }

  [[nodiscard]] AST::UnionType* findUnionType(llvm::StructType* type) override {
    return symbols_.findUnionType(type);
  }

  bool addUnionType(llvm::StructType* llvmType,
                    AST::UnionType* astType) override {
    return symbols_.addUnionType(llvmType, astType);
  }

  // --- The function currently being emitted ---

  [[nodiscard]] llvm::Function* getCurrentFunction() const noexcept;

  void enterFunction(llvm::Function* func);

  void leaveFunction();

  /// Switch insert point to global block for global variable declaration.
  void switchInsertPointToGlobalBlock();

  /// Switch insert point back to current local block.
  void switchInsertPointToCurrentBlock();

  /// Walk the AST and emit it into the module. This is the whole of irgen's
  /// contribution: what happens to the module afterwards (middle end, object /
  /// assembly emission) is sequenced by driver/Pipeline.hpp.
  void buildModule(AST::Program* root, bool generateDebugInfo = false,
                   const std::string& sourcePath = "");

  [[nodiscard]] bool isDebugInfoEnabled() const noexcept {
    return debugInfo_ != nullptr;
  }
  [[nodiscard]] DebugInfoBuilder* debugInfo() noexcept {
    return debugInfo_.get();
  }

  /// Attach the node's source line to the next IR instructions (-g, inside a
  /// function).
  void setDebugLocation(const AST::SourceLoc& loc);

  /// Nested { } scopes for DWARF lexical blocks (used by Block::genCode).
  void pushDebugLexicalBlock(const AST::SourceLoc& loc);
  void popDebugLexicalBlock();
  [[nodiscard]] llvm::DIScope* getCurrentDebugScope() const;

  void declareDebugAlloca(
      llvm::AllocaInst* alloca, const std::string& name, llvm::Type* llvmType,
      AST::VarType* varType, const AST::SourceLoc& loc,
      unsigned paramArgNo = 0);  // 1-based for params; 0 = local

 private:
  /// Declared first so it is destroyed last: members are torn down in reverse
  /// declaration order; llvm::Module and llvm::IRBuilder require a live
  /// LLVMContext.
  llvm::LLVMContext context_;
  llvm::IRBuilder<> builder_;
  /// Top-level container for all LLVM IR in this compilation unit. Owned here,
  /// and declared above every member that refers into it (debugInfo_ holds a
  /// DIBuilder over this module) so reverse-order destruction tears the two
  /// down in the order LLVM requires.
  std::unique_ptr<llvm::Module> module_;

  SymbolTable symbols_;
  ControlFlowContext controlFlow_;

  /// Be used to switch insert point to global block.
  llvm::BasicBlock* globalBlock_ = nullptr;
  llvm::Function* globalFunc_ = nullptr;
  /// Be used to switch insert point back to local current block.
  llvm::BasicBlock* currentBlock_ = nullptr;
  llvm::Function* currentFunc_ = nullptr;

  std::unique_ptr<DebugInfoBuilder> debugInfo_;
  std::vector<llvm::DIScope*> debugScopeStack_;
};

/// RAII guard for the DWARF lexical-block stack. Its symbol-table counterpart,
/// ScopedSymbolTable, lives in irgen/SymbolTable.hpp beside the stack it
/// balances.
class ScopedDebugLexicalBlock {
 public:
  explicit ScopedDebugLexicalBlock(CodeGenerator& generator,
                                   const AST::SourceLoc& loc)
      : generator_(generator) {
    generator_.pushDebugLexicalBlock(loc);
  }
  ~ScopedDebugLexicalBlock() { generator_.popDebugLexicalBlock(); }

  ScopedDebugLexicalBlock(const ScopedDebugLexicalBlock&) = delete;
  ScopedDebugLexicalBlock& operator=(const ScopedDebugLexicalBlock&) = delete;

 private:
  CodeGenerator& generator_;
};

/// The function currently being emitted, for the length of a scope. Walkers do
/// not call enterFunction / leaveFunction by hand: a function body throws in a
/// dozen places, and leaveFunction is also what drops the per-function DWARF
/// lexical scopes, so an escaped exception used to carry both into whatever was
/// emitted next.
class ScopedFunction {
 public:
  explicit ScopedFunction(CodeGenerator& generator, llvm::Function* func)
      : generator_(generator) {
    generator_.enterFunction(func);
  }
  ~ScopedFunction() { generator_.leaveFunction(); }

  ScopedFunction(const ScopedFunction&) = delete;
  ScopedFunction& operator=(const ScopedFunction&) = delete;

 private:
  CodeGenerator& generator_;
};

/// Emit into the module's global-initializer block for the length of a scope,
/// then put the builder back. What runs in between is an initializer
/// expression, which throws when its value will not convert — and the two call
/// sites had already drifted apart on that point, one restoring the insert
/// point before its null check and the other after. A guard makes the question
/// unaskable.
class ScopedGlobalInsertPoint {
 public:
  explicit ScopedGlobalInsertPoint(CodeGenerator& generator)
      : generator_(generator) {
    generator_.switchInsertPointToGlobalBlock();
  }
  ~ScopedGlobalInsertPoint() { generator_.switchInsertPointToCurrentBlock(); }

  ScopedGlobalInsertPoint(const ScopedGlobalInsertPoint&) = delete;
  ScopedGlobalInsertPoint& operator=(const ScopedGlobalInsertPoint&) = delete;

 private:
  CodeGenerator& generator_;
};
