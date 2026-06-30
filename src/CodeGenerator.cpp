#include "CodeGenerator.hpp"

#include <llvm/IR/Instructions.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>

#include <iostream>
#include <memory>

#include "AbstractSyntaxTree.hpp"
#include "DebugInfoBuilder.hpp"
#include "IrOptimizer.hpp"
#include "TargetBackend.hpp"

CodeGenerator::CodeGenerator()
    : context_(),
      builder_(context_),
      module_(new llvm::Module("lcc", context_)),
      // DataLayout(Module*) removed in LLVM 20; layout string comes from the module.
      dataLayout_(new llvm::DataLayout(module_->getDataLayout())),
      structTypeTable_(new StructTypeTable),
      unionTypeTable_(new UnionTypeTable),
      globalBlock_(nullptr),
      globalFunc_(nullptr),
      currentBlock_(nullptr),
      currentFunc_(nullptr) {}

CodeGenerator::~CodeGenerator() {
  // Scope stacks may be unbalanced after a failed lowering; drain owned tables
  // and drop non-owning debug-scope metadata.
  while (!symbolTableStack_.empty()) {
    delete symbolTableStack_.back();
    symbolTableStack_.pop_back();
  }
  while (!typedefTableStack_.empty()) {
    delete typedefTableStack_.back();
    typedefTableStack_.pop_back();
  }

  debugScopeStack_.clear();

  delete structTypeTable_;
  structTypeTable_ = nullptr;
  delete unionTypeTable_;
  unionTypeTable_ = nullptr;
  // Constructed separately from Module; not owned by the module.
  delete dataLayout_;
  dataLayout_ = nullptr;
  delete module_;
  module_ = nullptr;
}

void CodeGenerator::pushSymbolTable() {
  symbolTableStack_.push_back(new SymbolTable);
  typedefTableStack_.push_back(new TypedefTable);
}

void CodeGenerator::popSymbolTable() {
  if (symbolTableStack_.empty()) {
    return;
  }

  delete symbolTableStack_.back();
  symbolTableStack_.pop_back();

  if (!typedefTableStack_.empty()) {
    delete typedefTableStack_.back();
    typedefTableStack_.pop_back();
  }
}

llvm::TypeSize CodeGenerator::getTypeSize(llvm::Type* type) {
  return dataLayout_->getTypeAllocSize(type);
}

llvm::Type* CodeGenerator::findType(const std::string& typeName) {
  if (symbolTableStack_.empty()) {
    return nullptr;
  }

  for (auto iter = symbolTableStack_.end() - 1;
       iter >= symbolTableStack_.begin(); --iter) {
    auto pairIter = (*iter)->find(typeName);
    if (pairIter != (*iter)->end()) {
      return pairIter->second.getType();
    }
  }

  return nullptr;
}

bool CodeGenerator::addType(const std::string& typeName, llvm::Type* type) {
  if (symbolTableStack_.empty()) {
    return false;
  }

  SymbolTable* topSymbolTable = symbolTableStack_.back();
  auto pairIter = topSymbolTable->find(typeName);
  if (pairIter != topSymbolTable->end()) {
    // Type already exists!
    return false;
  }

  (*topSymbolTable)[typeName] = Symbol(type);
  return true;
}

AST::VarType* CodeGenerator::findTypedefAlias(const std::string& aliasName) {
  if (typedefTableStack_.empty()) {
    return nullptr;
  }

  for (auto iter = typedefTableStack_.end() - 1;
       iter >= typedefTableStack_.begin(); --iter) {
    auto pairIter = (*iter)->find(aliasName);
    if (pairIter != (*iter)->end()) {
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

  TypedefTable* topTable = typedefTableStack_.back();
  auto pairIter = topTable->find(aliasName);
  if (pairIter != topTable->end()) {
    return false;
  }

  (*topTable)[aliasName] = varType;
  return true;
}

bool CodeGenerator::hasTypedefAliasInCurrentScope(
    const std::string& aliasName) {
  if (typedefTableStack_.empty()) {
    return false;
  }

  TypedefTable* topTable = typedefTableStack_.back();
  return topTable->find(aliasName) != topTable->end();
}

llvm::Value* CodeGenerator::findVariable(const std::string& varName) {
  if (symbolTableStack_.empty()) {
    return nullptr;
  }

  for (auto iter = symbolTableStack_.end() - 1;
       iter >= symbolTableStack_.begin(); --iter) {
    auto pairIter = (*iter)->find(varName);
    if (pairIter != (*iter)->end()) {
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

  SymbolTable* topSymbolTable = symbolTableStack_.back();
  auto pairIter = topSymbolTable->find(varName);
  if (pairIter != topSymbolTable->end()) {
    // Variable already exists!
    return false;
  }

  if (hasTypedefAliasInCurrentScope(varName)) {
    return false;
  }

  (*topSymbolTable)[varName] = Symbol(var, false, varType);
  return true;
}

AST::VarType* CodeGenerator::findVariableType(const std::string& varName) {
  if (symbolTableStack_.empty()) {
    return nullptr;
  }

  for (auto iter = symbolTableStack_.end() - 1;
       iter >= symbolTableStack_.begin(); --iter) {
    auto pairIter = (*iter)->find(varName);
    if (pairIter != (*iter)->end()) {
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
  if (symbolTableStack_.empty()) {
    return nullptr;
  }

  for (auto iter = symbolTableStack_.end() - 1;
       iter >= symbolTableStack_.begin(); --iter) {
    auto pairIter = (*iter)->find(varName);
    if (pairIter != (*iter)->end()) {
      return pairIter->second.getConstant();
    }
  }

  return nullptr;
}

bool CodeGenerator::addConstant(const std::string& varName, llvm::Value* var) {
  if (symbolTableStack_.empty()) {
    return false;
  }

  SymbolTable* topSymbolTable = symbolTableStack_.back();
  auto pairIter = topSymbolTable->find(varName);
  if (pairIter != topSymbolTable->end()) {
    // Variable already exists!
    return false;
  }

  (*topSymbolTable)[varName] = Symbol(var, true);
  return true;
}

AST::StructType* CodeGenerator::findStructType(llvm::StructType* type) {
  auto pairIter = structTypeTable_->find(type);
  if (pairIter != structTypeTable_->end()) {
    return pairIter->second;
  }

  return nullptr;
}

bool CodeGenerator::addStructType(llvm::StructType* llvmType,
                                  AST::StructType* astType) {
  auto pairIter = structTypeTable_->find(llvmType);
  if (pairIter != structTypeTable_->end()) {
    // Reflection on llvmType already exist!
    return false;
  }

  (*structTypeTable_)[llvmType] = astType;
  return true;
}

AST::UnionType* CodeGenerator::findUnionType(llvm::StructType* type) {
  auto pairIter = unionTypeTable_->find(type);
  if (pairIter != unionTypeTable_->end()) {
    return pairIter->second;
  }

  return nullptr;
}

bool CodeGenerator::addUnionType(llvm::StructType* llvmType,
                                 AST::UnionType* astType) {
  auto pairIter = unionTypeTable_->find(llvmType);
  if (pairIter != unionTypeTable_->end()) {
    // Reflection on llvmType already exist!
    return false;
  }

  (*unionTypeTable_)[llvmType] = astType;
  return true;
}

llvm::Function* CodeGenerator::findFunction(const std::string& funcName) {
  if (symbolTableStack_.empty()) {
    return nullptr;
  }

  for (auto iter = symbolTableStack_.end() - 1;
       iter >= symbolTableStack_.begin(); --iter) {
    auto pairIter = (*iter)->find(funcName);
    if (pairIter != (*iter)->end()) {
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

  SymbolTable* topSymbolTable = symbolTableStack_.back();
  auto pairIter = topSymbolTable->find(funcName);
  if (pairIter != topSymbolTable->end()) {
    // funcName already exists!
    return false;
  }

  (*topSymbolTable)[funcName] = Symbol(func);
  return true;
}

llvm::Function* CodeGenerator::getCurrentFunction() { return currentFunc_; }

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

llvm::BasicBlock* CodeGenerator::getSwitchFallthroughBlock() {
  return switchFallthroughBlock_;
}

llvm::BasicBlock* CodeGenerator::getContinueBlock() {
  if (continueBlockStack_.empty()) {
    return nullptr;
  }

  return continueBlockStack_.back();
}

llvm::BasicBlock* CodeGenerator::getBreakBlock() {
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
  llvm::DIScope* block =
      debugInfo_->createLexicalBlock(parent, loc.line, col);
  if (block != nullptr) {
    debugScopeStack_.push_back(block);
  }
}

void CodeGenerator::popDebugLexicalBlock() {
  if (!debugScopeStack_.empty()) {
    debugScopeStack_.pop_back();
  }
}

llvm::DIScope* CodeGenerator::getCurrentDebugScope() {
  if (!debugScopeStack_.empty()) {
    return debugScopeStack_.back();
  }

  llvm::Function* func = getCurrentFunction();
  if (func == nullptr) {
    return nullptr;
  }

  return func->getSubprogram();
}

void CodeGenerator::declareDebugAlloca(llvm::AllocaInst* alloca,
                                       const std::string& name,
                                       llvm::Type* llvmType,
                                       AST::VarType* varType,
                                       const AST::SourceLoc& loc,
                                       unsigned paramArgNo) {
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

  // Parameters belong on the subprogram scope; locals use the innermost lexical block.
  llvm::DIScope* scope =
      paramArgNo > 0 ? static_cast<llvm::DIScope*>(subprogram)
                     : getCurrentDebugScope();
  if (scope == nullptr) {
    return;
  }

  debugInfo_->declareAlloca(alloca, scope, name, llvmType, varType,
                            loc.line, loc.col, paramArgNo);
}

void CodeGenerator::genIrCode(AST::Program* root,
                              const std::string& optimizationLevel,
                              bool generateDebugInfo,
                              const std::string& sourcePath,
                              const std::string& preOptIrPath,
                              const std::string& postOptIrPath,
                              const std::string& irStatsPath) {
  if (root == nullptr) {
    std::cerr << "AST root is nullptr!" << std::endl;
    return;
  }

  if (generateDebugInfo) {
    debugInfo_ = std::make_unique<DebugInfoBuilder>(*module_);
    debugInfo_->initialize(sourcePath);
    debugInfo_->setCodeGenerator(this);
  }

  // Create top level symbol table, and push it to stack.
  pushSymbolTable();

  // IRBuilder requires an insert point even for global initializers. Use a
  // temporary internal function/block, emit globals, then erase it.
  globalFunc_ = llvm::Function::Create(
      llvm::FunctionType::get(builder_.getVoidTy(), false),
      llvm::GlobalValue::InternalLinkage, "globalFunc", module_);
  globalBlock_ =
      llvm::BasicBlock::Create(context_, "globalBlock", globalFunc_);

  root->genCode(*this);

  globalBlock_->eraseFromParent();
  globalFunc_->eraseFromParent();

  // Pop top level symbol table, and destroy it.
  popSymbolTable();

  // Middle-end snapshots: raw frontend IR, then the module after IrOptimizer
  // and debug finalization (-g). main's -l dumps later (post-genObjectCode) with
  // target triple/data layout for compile-tests.sh golden files.
  if (!preOptIrPath.empty()) {
    dumpIrCode(preOptIrPath);
  }

  // -g skips LLVM optimizations so dbg.declare allocas survive; dbg.value salvage
  // for -O1+ is out of scope for this teaching compiler.
  const std::string optLevel =
      generateDebugInfo ? std::string{} : optimizationLevel;
  IrOptimizer{}.run(*module_, optLevel, {.irStatsPath = irStatsPath});
  if (generateDebugInfo) {
    if (!optimizationLevel.empty() && optimizationLevel != "O0") {
      std::cerr << "Warning: -g disables LLVM optimizations (ignoring -"
                << optimizationLevel
                << "); use -g without -O for debuggable output." << std::endl;
    }
    debugInfo_->finalize();
  }

  if (!postOptIrPath.empty()) {
    dumpIrCode(postOptIrPath);
  }
}

void CodeGenerator::setTargetBackendOptions(const TargetBackendOptions& options) {
  targetBackendOptions_ = options;
}

void CodeGenerator::genObjectCode(const std::string& fileName) {
  TargetBackend{}.emitObject(*module_, fileName, targetBackendOptions_);
}

void CodeGenerator::genAssemblyCode(const std::string& fileName) {
  TargetBackend{}.emitAssembly(*module_, fileName, targetBackendOptions_);
}

void CodeGenerator::dumpIrCode(const std::string& fileName) {
  if (fileName.empty()) {
    return;
  }

  std::error_code errCode;
  llvm::raw_fd_ostream irFileStream(fileName, errCode);
  if (errCode.value() != 0) {
    throw std::runtime_error("Failed to create file " + fileName + " errCode " +
                             errCode.message());
  }

  module_->print(irFileStream, nullptr);
  if (llvm::verifyModule(*module_, &irFileStream) != 0) {
    std::cout << "Errors in IR code!" << std::endl;
  }
}