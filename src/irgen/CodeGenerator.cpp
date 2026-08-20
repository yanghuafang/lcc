#include "irgen/CodeGenerator.hpp"

#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>

#include <cassert>
#include <iostream>
#include <memory>

#include "ast/Nodes.hpp"
#include "irgen/DebugInfoBuilder.hpp"

namespace {

// Global initializers need an insert point even though they belong to no
// function, so the module walk runs with a throwaway internal one around it.
// Creating and erasing that function are two statements with the entire AST
// walk in between, and the walk throws — an escaped exception used to leave a
// stray `globalFunc` in the emitted module and two dangling pointers on the
// generator. Both ends live here instead.
//
// The generator's members are taken by reference rather than returned, so that
// clearing them is part of the same destructor that erases what they point to.
class ScopedGlobalInitBlock {
 public:
  ScopedGlobalInitBlock(llvm::LLVMContext& context, llvm::Module& module,
                        llvm::Function*& func, llvm::BasicBlock*& block)
      : func_(func), block_(block) {
    func_ = llvm::Function::Create(
        llvm::FunctionType::get(llvm::Type::getVoidTy(context), false),
        llvm::GlobalValue::InternalLinkage, "globalFunc", &module);
    block_ = llvm::BasicBlock::Create(context, "globalBlock", func_);
  }

  ~ScopedGlobalInitBlock() {
    block_->eraseFromParent();
    func_->eraseFromParent();
    block_ = nullptr;
    func_ = nullptr;
  }

  ScopedGlobalInitBlock(const ScopedGlobalInitBlock&) = delete;
  ScopedGlobalInitBlock& operator=(const ScopedGlobalInitBlock&) = delete;

 private:
  llvm::Function*& func_;
  llvm::BasicBlock*& block_;
};

}  // namespace

CodeGenerator::CodeGenerator()
    : builder_(context_),
      module_(std::make_unique<llvm::Module>("lcc", context_)) {}

// Out of line, not `= default` in the header: module_ and debugInfo_ are
// unique_ptrs to types the header only forward-declares, so the deleters have
// to be instantiated where those types are complete. Every member cleans up
// after itself, including the scope stacks — which may still be non-empty here
// if a lowering threw partway through a nested scope.
CodeGenerator::~CodeGenerator() = default;

// Read the layout off the module every time rather than caching a copy: the
// driver stamps the target's real layout on before the AST walk starts (see
// driver/Pipeline.cpp), and a copy taken in the constructor would freeze
// LLVM's default — which is big-endian with 4-byte-aligned i64, so every
// sizeof of an aggregate would be computed for a machine nobody ships.
llvm::TypeSize CodeGenerator::getTypeSize(llvm::Type* type) {
  return module_->getDataLayout().getTypeAllocSize(type);
}

llvm::Function* CodeGenerator::getCurrentFunction() const {
  return currentFunc_;
}

void CodeGenerator::enterFunction(llvm::Function* func) { currentFunc_ = func; }

void CodeGenerator::leaveFunction() {
  // Lexical scopes are per-function; do not carry into the next DISubprogram.
  debugScopeStack_.clear();
  currentFunc_ = nullptr;
}

void CodeGenerator::switchInsertPointToGlobalBlock() {
  currentBlock_ = builder_.GetInsertBlock();
  builder_.SetInsertPoint(globalBlock_);
}

void CodeGenerator::switchInsertPointToCurrentBlock() {
  // A file-scope declaration switches to the global block with no insert point
  // set at all, so the saved block is null and there is nothing to restore.
  // SetInsertPoint would dereference it; ClearInsertionPoint is the API for
  // "no insertion point", and leaves the builder as it was found.
  if (currentBlock_ == nullptr) {
    builder_.ClearInsertionPoint();
    return;
  }

  builder_.SetInsertPoint(currentBlock_);
}

void CodeGenerator::setDebugLocation(const AST::SourceLoc& loc) {
  if (!isDebugInfoEnabled() || loc.line == 0) {
    return;
  }

  llvm::Function* func = getCurrentFunction();
  if (func == nullptr) {
    return;
  }

  llvm::DISubprogram* subprogram = func->getSubprogram();
  if (subprogram == nullptr) {
    return;
  }

  unsigned col = loc.col > 0 ? loc.col : 1;
  llvm::DIScope* scope = getCurrentDebugScope();
  if (scope == nullptr) {
    return;
  }
  debugInfo_->setLocation(builder_, loc.line, scope, col);
}

void CodeGenerator::pushDebugLexicalBlock(const AST::SourceLoc& loc) {
  if (!isDebugInfoEnabled() || loc.line == 0) {
    return;
  }

  llvm::DIScope* parent = getCurrentDebugScope();
  if (parent == nullptr) {
    return;
  }

  unsigned col = loc.col > 0 ? loc.col : 1;
  llvm::DIScope* block = debugInfo_->createLexicalBlock(parent, loc.line, col);
  if (block != nullptr) {
    debugScopeStack_.push_back(block);
  }
}

void CodeGenerator::popDebugLexicalBlock() {
  if (!debugScopeStack_.empty()) {
    debugScopeStack_.pop_back();
  }
}

llvm::DIScope* CodeGenerator::getCurrentDebugScope() const {
  if (!debugScopeStack_.empty()) {
    return debugScopeStack_.back();
  }

  llvm::Function* func = getCurrentFunction();
  if (func == nullptr) {
    return nullptr;
  }

  return func->getSubprogram();
}

void CodeGenerator::declareDebugAlloca(
    llvm::AllocaInst* alloca, const std::string& name, llvm::Type* llvmType,
    AST::VarType* varType, const AST::SourceLoc& loc, unsigned paramArgNo) {
  if (!isDebugInfoEnabled() || alloca == nullptr || loc.line == 0) {
    return;
  }

  // Requires an active ScopedFunction on the owning function (see
  // FuncDecl::genCode).
  llvm::Function* func = getCurrentFunction();
  if (func == nullptr) {
    return;
  }

  llvm::DISubprogram* subprogram = func->getSubprogram();
  if (subprogram == nullptr) {
    return;
  }

  // Parameters belong on the subprogram scope; locals use the innermost lexical
  // block.
  llvm::DIScope* scope = paramArgNo > 0
                             ? static_cast<llvm::DIScope*>(subprogram)
                             : getCurrentDebugScope();
  if (scope == nullptr) {
    return;
  }

  debugInfo_->declareAlloca(alloca, scope, name, llvmType, varType, loc.line,
                            loc.col, paramArgNo);
}

void CodeGenerator::buildModule(AST::Program* root, bool generateDebugInfo,
                                const std::string& sourcePath) {
  if (root == nullptr) {
    std::cerr << "AST root is nullptr!" << '\n';
    return;
  }

  if (generateDebugInfo) {
    debugInfo_ = std::make_unique<DebugInfoBuilder>(*module_);
    debugInfo_->initialize(sourcePath);
    debugInfo_->setTypeEnv(this);
  }

  ScopedSymbolTable moduleScope(symbols_);
  ScopedGlobalInitBlock globalInit(context_, *module_, globalFunc_,
                                   globalBlock_);

  root->genCode(*this);
}
