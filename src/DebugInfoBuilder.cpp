#include "DebugInfoBuilder.hpp"

#include <llvm/BinaryFormat/Dwarf.h>
#include <llvm/IR/DIBuilder.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Type.h>
#include <llvm/Support/Path.h>

#include "AbstractSyntaxTree.hpp"

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

llvm::DIType* DebugInfoBuilder::getOrCreateBuiltinDIType(
    AST::BuiltinTypeId typeId) {
  switch (typeId) {
    case AST::BuiltinTypeId::BOOL:
      return dib_->createBasicType("bool", 8, llvm::dwarf::DW_ATE_boolean);
    case AST::BuiltinTypeId::CHAR:
      return dib_->createBasicType("char", 8, llvm::dwarf::DW_ATE_signed_char);
    case AST::BuiltinTypeId::UCHAR:
      return dib_->createBasicType("unsigned char", 8,
                                   llvm::dwarf::DW_ATE_unsigned_char);
    case AST::BuiltinTypeId::SHORT:
      return dib_->createBasicType("short", 16, llvm::dwarf::DW_ATE_signed);
    case AST::BuiltinTypeId::USHORT:
      return dib_->createBasicType("unsigned short", 16,
                                   llvm::dwarf::DW_ATE_unsigned);
    case AST::BuiltinTypeId::INT:
      return dib_->createBasicType("int", 32, llvm::dwarf::DW_ATE_signed);
    case AST::BuiltinTypeId::UINT:
      return dib_->createBasicType("unsigned int", 32,
                                   llvm::dwarf::DW_ATE_unsigned);
    case AST::BuiltinTypeId::LONG:
      return dib_->createBasicType("long", 64, llvm::dwarf::DW_ATE_signed);
    case AST::BuiltinTypeId::ULONG:
      return dib_->createBasicType("unsigned long", 64,
                                   llvm::dwarf::DW_ATE_unsigned);
    case AST::BuiltinTypeId::FLOAT:
      return dib_->createBasicType("float", 32, llvm::dwarf::DW_ATE_float);
    case AST::BuiltinTypeId::DOUBLE:
      return dib_->createBasicType("double", 64, llvm::dwarf::DW_ATE_float);
    case AST::BuiltinTypeId::VOID:
      return getOrCreateVoidType();
    default:
      return dib_->createBasicType("int", 32, llvm::dwarf::DW_ATE_signed);
  }
}

llvm::DIType* DebugInfoBuilder::getOrCreateDIType(llvm::Type* llvmType,
                                                  AST::VarType* varType) {
  // LLVM integer types carry no signedness; prefer the AST VarType when present.
  if (varType != nullptr && varType->isBuiltinType()) {
    return getOrCreateBuiltinDIType(
        static_cast<AST::BuiltinType*>(varType)->typeId_);
  }

  if (llvmType == nullptr) {
    return getOrCreateVoidType();
  }

  auto cached = llvmTypeCache_.find(llvmType);
  if (cached != llvmTypeCache_.end()) {
    return cached->second;
  }

  llvm::DIType* diType = getOrCreateLlvmType(llvmType);
  llvmTypeCache_[llvmType] = diType;
  return diType;
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
  if (type->isArrayTy()) {
    llvm::Type* elemTy = type->getArrayElementType();
    llvm::DIType* elemDi = getOrCreateLlvmType(elemTy);
    const uint64_t count = type->getArrayNumElements();
    llvm::Metadata* subrange = dib_->getOrCreateSubrange(0, count);
    llvm::DINodeArray subscripts = dib_->getOrCreateArray({subrange});
    return dib_->createArrayType(
        module_.getDataLayout().getTypeAllocSizeInBits(type),
        module_.getDataLayout().getABITypeAlign(type).value() * 8, elemDi,
        subscripts);
  }
  if (type->isPointerTy()) {
    llvm::DIType* pointee = getOrCreateLlvmType(type->getPointerElementType());
    const unsigned pointerBits =
        module_.getDataLayout().getPointerSizeInBits(0);
    return dib_->createPointerType(pointee, pointerBits);
  }
  if (type->isStructTy()) {
    llvm::StructType* structTy = llvm::cast<llvm::StructType>(type);
    std::string name = structTy->hasName() ? structTy->getName().str() : "struct";
    return dib_->createBasicType(
        name, module_.getDataLayout().getTypeSizeInBits(type),
        llvm::dwarf::DW_ATE_unsigned);
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

void DebugInfoBuilder::insertAllocaDeclare(
    llvm::AllocaInst* alloca, llvm::DILocalVariable* variable, unsigned line,
    unsigned col, llvm::DISubprogram* subprogram) {
  llvm::DIExpression* expr = llvm::DIExpression::get(context_, {});
  llvm::DILocation* location =
      llvm::DILocation::get(context_, line, col, subprogram);
  // Keep dbg.declare in the entry block, immediately after the matching alloca.
  if (llvm::Instruction* insertBefore = alloca->getNextNode()) {
    dib_->insertDeclare(alloca, variable, expr, location, insertBefore);
  } else {
    dib_->insertDeclare(alloca, variable, expr, location, alloca->getParent());
  }
}

void DebugInfoBuilder::declareAlloca(
    llvm::AllocaInst* alloca, llvm::DISubprogram* subprogram,
    const std::string& name, llvm::Type* llvmType, AST::VarType* varType,
    unsigned line, unsigned col, unsigned paramArgNo) {
  if (!initialized_ || subprogram == nullptr || alloca == nullptr ||
      line == 0) {
    return;
  }

  llvm::DIType* diType = getOrCreateDIType(llvmType, varType);
  unsigned useCol = col > 0 ? col : 1;

  llvm::DILocalVariable* variable = nullptr;
  if (paramArgNo > 0) {
    variable = dib_->createParameterVariable(subprogram, name, paramArgNo, file_,
                                             line, diType);
  } else {
    variable = dib_->createAutoVariable(subprogram, name, file_, line, diType);
  }

  insertAllocaDeclare(alloca, variable, line, useCol, subprogram);
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
