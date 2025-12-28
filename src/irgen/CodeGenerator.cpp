#include "irgen/CodeGenerator.hpp"

#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

#include <iostream>
#include <memory>

#include "ast/Nodes.hpp"
#include "irgen/DebugInfoBuilder.hpp"

CodeGenerator::CodeGenerator()
    : builder_(context_),
      module_(std::make_unique<llvm::Module>("lcc", context_)),
      globalBlock_(nullptr),
      globalFunc_(nullptr),
      currentBlock_(nullptr),
      currentFunc_(nullptr) {}

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

  // Requires enterFunction() on the owning function (see FuncDecl::genCode).
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

  symbols_.pushScope();

  // IRBuilder requires an insert point even for global initializers. Use a
  // temporary internal function/block, emit globals, then erase it.
  globalFunc_ = llvm::Function::Create(
      llvm::FunctionType::get(builder_.getVoidTy(), false),
      llvm::GlobalValue::InternalLinkage, "globalFunc", module_.get());
  globalBlock_ = llvm::BasicBlock::Create(context_, "globalBlock", globalFunc_);

  root->genCode(*this);

  globalBlock_->eraseFromParent();
  globalFunc_->eraseFromParent();

  symbols_.popScope();
}
