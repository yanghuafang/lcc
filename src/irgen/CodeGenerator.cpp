#include "irgen/CodeGenerator.hpp"

#include <llvm/IR/DebugInfoMetadata.h>
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

void CodeGenerator::pushSymbolTable() {
  symbolTableStack_.emplace_back();
  typedefTableStack_.emplace_back();
}

void CodeGenerator::popSymbolTable() {
  if (symbolTableStack_.empty()) {
    return;
  }

  symbolTableStack_.pop_back();

  if (!typedefTableStack_.empty()) {
    typedefTableStack_.pop_back();
  }
}

// Read the layout off the module every time rather than caching a copy: the
// driver stamps the target's real layout on before the AST walk starts (see
// driver/Pipeline.cpp), and a copy taken in the constructor would freeze
// LLVM's default — which is big-endian with 4-byte-aligned i64, so every
// sizeof of an aggregate would be computed for a machine nobody ships.
llvm::TypeSize CodeGenerator::getTypeSize(llvm::Type* type) {
  return module_->getDataLayout().getTypeAllocSize(type);
}

// Innermost scope first. Reverse iterators rather than `end() - 1` walking down
// to `begin()`: that form has to step one past begin() to end the loop, and
// forming an iterator before the first element is undefined even when it is
// never dereferenced. rbegin()/rend() expresses the same walk with no
// out-of-range iterator in it, and needs no empty-stack guard either.
llvm::Type* CodeGenerator::findType(const std::string& typeName) {
  for (auto iter = symbolTableStack_.rbegin(); iter != symbolTableStack_.rend();
       ++iter) {
    auto pairIter = iter->find(typeName);
    if (pairIter != iter->end()) {
      return pairIter->second.getType();
    }
  }

  return nullptr;
}

bool CodeGenerator::addType(const std::string& typeName, llvm::Type* type) {
  if (symbolTableStack_.empty()) {
    return false;
  }

  SymbolTable& topSymbolTable = symbolTableStack_.back();
  if (topSymbolTable.find(typeName) != topSymbolTable.end()) {
    // Type already exists!
    return false;
  }

  topSymbolTable[typeName] = Symbol(type);
  return true;
}

AST::VarType* CodeGenerator::findTypedefAlias(const std::string& aliasName) {
  for (auto iter = typedefTableStack_.rbegin();
       iter != typedefTableStack_.rend(); ++iter) {
    auto pairIter = iter->find(aliasName);
    if (pairIter != iter->end()) {
      return pairIter->second;
    }
  }

  return nullptr;
}

bool CodeGenerator::addTypedefAlias(const std::string& aliasName,
                                    AST::VarType* varType) {
  if (typedefTableStack_.empty()) {
    return false;
  }

  TypedefTable& topTable = typedefTableStack_.back();
  if (topTable.find(aliasName) != topTable.end()) {
    return false;
  }

  topTable[aliasName] = varType;
  return true;
}

bool CodeGenerator::hasTypedefAliasInCurrentScope(
    const std::string& aliasName) const {
  if (typedefTableStack_.empty()) {
    return false;
  }

  const TypedefTable& topTable = typedefTableStack_.back();
  return topTable.find(aliasName) != topTable.end();
}

llvm::Value* CodeGenerator::findVariable(const std::string& varName) {
  for (auto iter = symbolTableStack_.rbegin(); iter != symbolTableStack_.rend();
       ++iter) {
    auto pairIter = iter->find(varName);
    if (pairIter != iter->end()) {
      return pairIter->second.getVariable();
    }
  }

  return nullptr;
}

bool CodeGenerator::addVariable(const std::string& varName, llvm::Value* var,
                                AST::VarType* varType) {
  if (symbolTableStack_.empty()) {
    return false;
  }

  SymbolTable& topSymbolTable = symbolTableStack_.back();
  if (topSymbolTable.find(varName) != topSymbolTable.end()) {
    // Variable already exists!
    return false;
  }

  if (hasTypedefAliasInCurrentScope(varName)) {
    return false;
  }

  topSymbolTable[varName] = Symbol(var, false, varType);
  return true;
}

AST::VarType* CodeGenerator::findVariableType(const std::string& varName) {
  for (auto iter = symbolTableStack_.rbegin(); iter != symbolTableStack_.rend();
       ++iter) {
    auto pairIter = iter->find(varName);
    if (pairIter != iter->end()) {
      return pairIter->second.getVarType();
    }
  }

  return nullptr;
}

void CodeGenerator::setFuncSignature(
    const std::string& funcName, AST::VarType* retType,
    const std::vector<AST::VarType*>& paramTypes) {
  funcRetTypes_[funcName] = retType;
  funcParamTypes_[funcName] = paramTypes;
}

AST::VarType* CodeGenerator::findFuncRetType(const std::string& funcName) {
  auto iter = funcRetTypes_.find(funcName);
  if (iter != funcRetTypes_.end()) {
    return iter->second;
  }

  return nullptr;
}

AST::VarType* CodeGenerator::findFuncParamType(const std::string& funcName,
                                               size_t index) {
  auto iter = funcParamTypes_.find(funcName);
  if (iter == funcParamTypes_.end() || index >= iter->second.size()) {
    return nullptr;
  }

  return iter->second[index];
}

llvm::Value* CodeGenerator::findConstant(const std::string& varName) {
  for (auto iter = symbolTableStack_.rbegin(); iter != symbolTableStack_.rend();
       ++iter) {
    auto pairIter = iter->find(varName);
    if (pairIter != iter->end()) {
      return pairIter->second.getConstant();
    }
  }

  return nullptr;
}

bool CodeGenerator::addConstant(const std::string& varName, llvm::Value* var) {
  if (symbolTableStack_.empty()) {
    return false;
  }

  SymbolTable& topSymbolTable = symbolTableStack_.back();
  if (topSymbolTable.find(varName) != topSymbolTable.end()) {
    // Variable already exists!
    return false;
  }

  topSymbolTable[varName] = Symbol(var, true);
  return true;
}

AST::StructType* CodeGenerator::findStructType(llvm::StructType* type) {
  auto pairIter = structTypeTable_.find(type);
  if (pairIter != structTypeTable_.end()) {
    return pairIter->second;
  }

  return nullptr;
}

bool CodeGenerator::addStructType(llvm::StructType* llvmType,
                                  AST::StructType* astType) {
  // try_emplace leaves an existing entry alone and says so, which is exactly
  // the find-then-insert this used to spell out in two lookups.
  return structTypeTable_.try_emplace(llvmType, astType).second;
}

AST::UnionType* CodeGenerator::findUnionType(llvm::StructType* type) {
  auto pairIter = unionTypeTable_.find(type);
  if (pairIter != unionTypeTable_.end()) {
    return pairIter->second;
  }

  return nullptr;
}

bool CodeGenerator::addUnionType(llvm::StructType* llvmType,
                                 AST::UnionType* astType) {
  return unionTypeTable_.try_emplace(llvmType, astType).second;
}

llvm::Function* CodeGenerator::findFunction(const std::string& funcName) {
  for (auto iter = symbolTableStack_.rbegin(); iter != symbolTableStack_.rend();
       ++iter) {
    auto pairIter = iter->find(funcName);
    if (pairIter != iter->end()) {
      return pairIter->second.getFunction();
    }
  }

  return nullptr;
}

bool CodeGenerator::addFunction(const std::string& funcName,
                                llvm::Function* func) {
  if (symbolTableStack_.empty()) {
    return false;
  }

  SymbolTable& topSymbolTable = symbolTableStack_.back();
  if (topSymbolTable.find(funcName) != topSymbolTable.end()) {
    // funcName already exists!
    return false;
  }

  topSymbolTable[funcName] = Symbol(func);
  return true;
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

void CodeGenerator::enterLoop(llvm::BasicBlock* continueBlock,
                              llvm::BasicBlock* breakBlock) {
  continueBlockStack_.push_back(continueBlock);
  breakBlockStack_.push_back(breakBlock);
}

void CodeGenerator::leaveLoop() {
  // Both stacks are pushed by enterLoop; switch uses breakBlockStack_ only, so
  // do not assert size equality across the two stacks.
  assert(!continueBlockStack_.empty() && !breakBlockStack_.empty() &&
         "leaveLoop without a matching enterLoop");
  if (continueBlockStack_.empty() || breakBlockStack_.empty()) {
    return;
  }

  continueBlockStack_.pop_back();
  breakBlockStack_.pop_back();
}

void CodeGenerator::enterSwitch(llvm::BasicBlock* breakBlock) {
  breakBlockStack_.push_back(breakBlock);
}

void CodeGenerator::leaveSwitch() {
  assert(!breakBlockStack_.empty() &&
         "leaveSwitch without a matching enterSwitch");
  if (breakBlockStack_.empty()) {
    return;
  }

  breakBlockStack_.pop_back();
  switchFallthroughBlock_ = nullptr;
}

void CodeGenerator::setSwitchFallthroughBlock(
    llvm::BasicBlock* fallthroughBlock) {
  switchFallthroughBlock_ = fallthroughBlock;
}

llvm::BasicBlock* CodeGenerator::getSwitchFallthroughBlock() const {
  return switchFallthroughBlock_;
}

llvm::BasicBlock* CodeGenerator::getContinueBlock() const {
  if (continueBlockStack_.empty()) {
    return nullptr;
  }

  return continueBlockStack_.back();
}

llvm::BasicBlock* CodeGenerator::getBreakBlock() const {
  if (breakBlockStack_.empty()) {
    return nullptr;
  }

  return breakBlockStack_.back();
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

  pushSymbolTable();

  // IRBuilder requires an insert point even for global initializers. Use a
  // temporary internal function/block, emit globals, then erase it.
  globalFunc_ = llvm::Function::Create(
      llvm::FunctionType::get(builder_.getVoidTy(), false),
      llvm::GlobalValue::InternalLinkage, "globalFunc", module_.get());
  globalBlock_ = llvm::BasicBlock::Create(context_, "globalBlock", globalFunc_);

  root->genCode(*this);

  globalBlock_->eraseFromParent();
  globalFunc_->eraseFromParent();

  popSymbolTable();
}