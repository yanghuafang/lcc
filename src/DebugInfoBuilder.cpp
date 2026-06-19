#include "DebugInfoBuilder.hpp"

#include <llvm/BinaryFormat/Dwarf.h>
#include <llvm/IR/DIBuilder.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/Support/Path.h>

DebugInfoBuilder::DebugInfoBuilder(llvm::Module& module)
    : module_(module),
      context_(module.getContext()),
      dib_(new llvm::DIBuilder(module)),
      compileUnit_(nullptr),
      file_(nullptr),
      initialized_(false) {}

DebugInfoBuilder::~DebugInfoBuilder() { delete dib_; }

void DebugInfoBuilder::initialize(const std::string& sourcePath) {
  if (initialized_) {
    return;
  }

  llvm::SmallString<256> dir(sourcePath);
  llvm::sys::path::remove_filename(dir);
  llvm::StringRef fileName = llvm::sys::path::filename(sourcePath);

  // DIFile uses the user -i path so LLDB resolves the generated C source, not lcc.
  file_ = dib_->createFile(fileName, dir);
  compileUnit_ = dib_->createCompileUnit(
      llvm::dwarf::DW_LANG_C, file_, "lcc",
      /*isOptimized=*/false, "", 0, "",
      llvm::DICompileUnit::FullDebug, 0);
  initialized_ = true;
}

llvm::DIType* DebugInfoBuilder::getOrCreateVoidType() {
  return dib_->createBasicType("void", 0, llvm::dwarf::DW_ATE_address);
}

llvm::DIType* DebugInfoBuilder::getOrCreateLlvmType(llvm::Type* type) {
  if (type == nullptr) {
    return getOrCreateVoidType();
  }

  if (type->isVoidTy()) {
    return getOrCreateVoidType();
  }

  if (type->isIntegerTy(1)) {
    return dib_->createBasicType("bool", 8, llvm::dwarf::DW_ATE_boolean);
  }
  if (type->isIntegerTy(8)) {
    return dib_->createBasicType("char", 8, llvm::dwarf::DW_ATE_signed_char);
  }
  if (type->isIntegerTy(16)) {
    return dib_->createBasicType("short", 16, llvm::dwarf::DW_ATE_signed);
  }
  if (type->isIntegerTy(32)) {
    return dib_->createBasicType("int", 32, llvm::dwarf::DW_ATE_signed);
  }
  if (type->isIntegerTy(64)) {
    return dib_->createBasicType("long", 64, llvm::dwarf::DW_ATE_signed);
  }
  if (type->isFloatTy()) {
    return dib_->createBasicType("float", 32, llvm::dwarf::DW_ATE_float);
  }
  if (type->isDoubleTy()) {
    return dib_->createBasicType("double", 64, llvm::dwarf::DW_ATE_float);
  }
  if (type->isPointerTy()) {
    llvm::DIType* pointee = getOrCreateLlvmType(
        type->getPointerElementType());
    const unsigned pointerBits =
        module_.getDataLayout().getPointerSizeInBits(0);
    return dib_->createPointerType(pointee, pointerBits);
  }

  return dib_->createBasicType("unknown", 32, llvm::dwarf::DW_ATE_signed);
}

llvm::DISubprogram* DebugInfoBuilder::createFunction(
    llvm::Function* func, const std::string& name, unsigned line,
    llvm::FunctionType* funcType) {
  if (!initialized_) {
    return nullptr;
  }

  std::vector<llvm::Metadata*> paramTypes;
  // DISubroutineType lists the return type first, then parameter types.
  llvm::DIType* retType = getOrCreateLlvmType(funcType->getReturnType());
  paramTypes.push_back(retType);

  for (llvm::Type* paramType : funcType->params()) {
    llvm::Type* lowered = paramType;
    // Match FuncDecl::genCode: array parameters are passed as pointers in LLVM IR.
    if (paramType->isArrayTy()) {
      lowered = paramType->getArrayElementType()->getPointerTo();
    }
    paramTypes.push_back(getOrCreateLlvmType(lowered));
  }

  llvm::DISubroutineType* signature = dib_->createSubroutineType(
      dib_->getOrCreateTypeArray(paramTypes));

  llvm::DISubprogram* subprogram = dib_->createFunction(
      compileUnit_, name, name, file_, line, signature, line,
      llvm::DINode::FlagZero, llvm::DISubprogram::SPFlagDefinition);
  func->setSubprogram(subprogram);
  return subprogram;
}

void DebugInfoBuilder::setLocation(llvm::IRBuilder<>& builder, unsigned line,
                                   llvm::DISubprogram* subprogram,
                                   unsigned col) {
  if (subprogram == nullptr) {
    return;
  }

  llvm::DILocation* location =
      llvm::DILocation::get(context_, line, col, subprogram);
  builder.SetCurrentDebugLocation(location);
}

void DebugInfoBuilder::finalize() {
  if (!initialized_) {
    return;
  }
  // Required so LLVM attaches completed debug metadata before object emission.
  dib_->finalize();
}
