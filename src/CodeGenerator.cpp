#include "CodeGenerator.hpp"

#include <llvm/Analysis/LoopAnalysisManager.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/Verifier.h>
#include <llvm/MC/TargetRegistry.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/Host.h>
#include <llvm/Support/TargetSelect.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Target/TargetMachine.h>
#include <llvm/Target/TargetOptions.h>

#include <iostream>

#include "AbstractSyntaxTree.hpp"

llvm::LLVMContext g_context;

llvm::IRBuilder<> g_builder(g_context);

CodeGenerator::CodeGenerator()
    : module_(new llvm::Module("lcc", g_context)),
      dataLayout_(new llvm::DataLayout(module_)),
      structTypeTable_(new StructTypeTable),
      unionTypeTable_(new UnionTypeTable),
      globalBlock_(NULL),
      globalFunc_(NULL),
      currentBlock_(NULL),
      currentFunc_(NULL) {}

CodeGenerator::~CodeGenerator() {
  delete structTypeTable_;
  structTypeTable_ = NULL;
  delete unionTypeTable_;
  unionTypeTable_ = NULL;

  // llvm::DataLayout will be cleaned up automatically, as it is owned by
  // llvm::Module, so do not need to delete it.
  delete module_;
  module_ = NULL;
}

void CodeGenerator::pushSymbolTable() {
  symbolTableStack_.push_back(new SymbolTable);
}

void CodeGenerator::popSymbolTable() {
  if (symbolTableStack_.empty()) {
    return;
  }

  delete symbolTableStack_.back();
  symbolTableStack_.pop_back();
}

llvm::TypeSize CodeGenerator::getTypeSize(llvm::Type* type) {
  return dataLayout_->getTypeAllocSize(type);
}

llvm::Type* CodeGenerator::findType(const std::string& typeName) {
  if (symbolTableStack_.empty()) {
    return NULL;
  }

  for (auto iter = symbolTableStack_.end() - 1;
       iter >= symbolTableStack_.begin(); --iter) {
    auto pairIter = (*iter)->find(typeName);
    if (pairIter != (*iter)->end()) {
      return pairIter->second.getType();
    }
  }

  return NULL;
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

llvm::Value* CodeGenerator::findVariable(const std::string& varName) {
  if (symbolTableStack_.empty()) {
    return NULL;
  }

  for (auto iter = symbolTableStack_.end() - 1;
       iter >= symbolTableStack_.begin(); --iter) {
    auto pairIter = (*iter)->find(varName);
    if (pairIter != (*iter)->end()) {
      return pairIter->second.getVariable();
    }
  }

  return NULL;
}

bool CodeGenerator::addVariable(const std::string& varName, llvm::Value* var) {
  if (symbolTableStack_.empty()) {
    return false;
  }

  SymbolTable* topSymbolTable = symbolTableStack_.back();
  auto pairIter = topSymbolTable->find(varName);
  if (pairIter != topSymbolTable->end()) {
    // Variable already exists!
    return false;
  }

  (*topSymbolTable)[varName] = Symbol(var, false);
  return true;
}

llvm::Value* CodeGenerator::findConstant(const std::string& varName) {
  if (symbolTableStack_.empty()) {
    return NULL;
  }

  for (auto iter = symbolTableStack_.end() - 1;
       iter >= symbolTableStack_.begin(); --iter) {
    auto pairIter = (*iter)->find(varName);
    if (pairIter != (*iter)->end()) {
      return pairIter->second.getConstant();
    }
  }

  return NULL;
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

  return NULL;
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

  return NULL;
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
    return NULL;
  }

  for (auto iter = symbolTableStack_.end() - 1;
       iter >= symbolTableStack_.begin(); --iter) {
    auto pairIter = (*iter)->find(funcName);
    if (pairIter != (*iter)->end()) {
      return pairIter->second.getFunction();
    }
  }

  return NULL;
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

void CodeGenerator::leaveFunction() { currentFunc_ = NULL; }

void CodeGenerator::enterLoop(llvm::BasicBlock* continueBlock,
                              llvm::BasicBlock* breakBlock) {
  continueBlockStack_.push_back(continueBlock);
  breakBlockStack_.push_back(breakBlock);
}

void CodeGenerator::leaveLoop() {
  assert(continueBlockStack_.size() == breakBlockStack_.size());
  if (continueBlockStack_.empty() || breakBlockStack_.empty()) {
    return;
  }

  continueBlockStack_.pop_back();
  breakBlockStack_.pop_back();
}

llvm::BasicBlock* CodeGenerator::getContinueBlock() {
  if (continueBlockStack_.empty()) {
    return NULL;
  }

  return continueBlockStack_.back();
}

llvm::BasicBlock* CodeGenerator::getBreakBlock() {
  if (breakBlockStack_.empty()) {
    return NULL;
  }

  return breakBlockStack_.back();
}

void CodeGenerator::switchInsertPointToGlobalBlock() {
  currentBlock_ = g_builder.GetInsertBlock();
  g_builder.SetInsertPoint(globalBlock_);
}

void CodeGenerator::switchInsertPointToCurrentBlock() {
  g_builder.SetInsertPoint(currentBlock_);
}

void CodeGenerator::genIrCode(AST::Program* root,
                              const std::string& optimizationLevel) {
  if (root == NULL) {
    std::cerr << "AST root is NULL!" << std::endl;
    return;
  }

  // Create top level symbol table, and push it to stack.
  pushSymbolTable();

  // Create global block for global variables.
  globalFunc_ = llvm::Function::Create(
      llvm::FunctionType::get(g_builder.getVoidTy(), false),
      llvm::GlobalValue::InternalLinkage, "globalFunc", module_);
  globalBlock_ =
      llvm::BasicBlock::Create(g_context, "globalBlock", globalFunc_);

  root->genCode(*this);

  globalBlock_->eraseFromParent();
  globalFunc_->eraseFromParent();

  // Pop top level symbol table, and destroy it.
  popSymbolTable();

  optimizeCode(optimizationLevel);
}

void CodeGenerator::genObjectCode(const std::string& fileName) {
  llvm::InitializeAllTargetInfos();
  llvm::InitializeAllTargets();
  llvm::InitializeAllTargetMCs();
  llvm::InitializeAllAsmParsers();
  llvm::InitializeAllAsmPrinters();

  std::string error;
  std::string targetTriple = llvm::sys::getDefaultTargetTriple();
  const llvm::Target* target =
      llvm::TargetRegistry::lookupTarget(targetTriple, error);
  if (target == NULL) {
    throw std::runtime_error(error);
  }

  std::string cpu = "generic";
  std::string features;
  llvm::TargetOptions options;
  auto optionalModel = llvm::Optional<llvm::Reloc::Model>();
  llvm::TargetMachine* targetMachine = target->createTargetMachine(
      targetTriple, cpu, features, options, optionalModel);

  module_->setDataLayout(targetMachine->createDataLayout());
  module_->setTargetTriple(targetTriple);

  std::error_code errCode;
  llvm::raw_fd_ostream objFileStream(fileName, errCode, llvm::sys::fs::OF_None);
  if (errCode.value() != 0) {
    throw std::runtime_error("Failed to open file " + fileName + " errCode " +
                             errCode.message());
  }

  llvm::legacy::PassManager pm;
  if (targetMachine->addPassesToEmitFile(pm, objFileStream, nullptr,
                                         llvm::CGFT_ObjectFile)) {
    throw std::runtime_error("Failed to emit object file!");
  }

  pm.run(*module_);
  objFileStream.flush();
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

  module_->print(irFileStream, NULL);
  if (llvm::verifyModule(*module_, &irFileStream) != 0) {
    std::cout << "Errors in IR code!" << std::endl;
  }
}

void CodeGenerator::optimizeCode(const std::string& optimizationLevel) {
  if (optimizationLevel.empty()) {
    return;
  }

  llvm::LoopAnalysisManager lam;
  llvm::FunctionAnalysisManager fam;
  llvm::CGSCCAnalysisManager cgam;
  llvm::ModuleAnalysisManager mam;

  llvm::PassBuilder pb;
  pb.registerModuleAnalyses(mam);
  pb.registerCGSCCAnalyses(cgam);
  pb.registerFunctionAnalyses(fam);
  pb.registerLoopAnalyses(lam);
  pb.crossRegisterProxies(lam, fam, cgam, mam);

  const llvm::OptimizationLevel* level;
  if (optimizationLevel == "O0") {
    level = &llvm::OptimizationLevel::O0;
  } else if (optimizationLevel == "O1") {
    level = &llvm::OptimizationLevel::O1;
  } else if (optimizationLevel == "O2") {
    level = &llvm::OptimizationLevel::O2;
  } else if (optimizationLevel == "O3") {
    level = &llvm::OptimizationLevel::O3;
  } else if (optimizationLevel == "Os") {
    level = &llvm::OptimizationLevel::Os;
  } else if (optimizationLevel == "Oz") {
    level = &llvm::OptimizationLevel::Oz;
  } else {
    std::cout << "Default optimization level -O0." << std::endl;
    level = &llvm::OptimizationLevel::O0;
  }

  llvm::ModulePassManager mpm = pb.buildPerModuleDefaultPipeline(*level);
  mpm.run(*module_, mam);
}