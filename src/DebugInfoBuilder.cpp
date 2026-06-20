#include "DebugInfoBuilder.hpp"

#include <llvm/BinaryFormat/Dwarf.h>
#include <llvm/IR/DIBuilder.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Type.h>
#include <llvm/Support/Path.h>

#include "AbstractSyntaxTree.hpp"
#include "CodeGenerator.hpp"

DebugInfoBuilder::DebugInfoBuilder(llvm::Module& module)
    : module_(module),
      context_(module.getContext()),
      dib_(new llvm::DIBuilder(module)),
      compileUnit_(nullptr),
      file_(nullptr),
      initialized_(false),
      codeGenerator_(nullptr) {}

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

void DebugInfoBuilder::setCodeGenerator(CodeGenerator* generator) {
  codeGenerator_ = generator;
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

llvm::DIType* DebugInfoBuilder::getOrCreateStructDIType(
    AST::StructType* structType) {
  // Member offsets come from StructLayout so DWARF matches struct GEP lowering.
  if (structType == nullptr || codeGenerator_ == nullptr) {
    return dib_->createBasicType("struct", 32, llvm::dwarf::DW_ATE_unsigned);
  }

  auto cached = structTypeCache_.find(structType);
  if (cached != structTypeCache_.end()) {
    return cached->second;
  }

  llvm::Type* llvmType = structType->getType(*codeGenerator_);
  llvm::StructType* llvmStruct = llvm::cast<llvm::StructType>(llvmType);
  const uint64_t sizeInBits =
      module_.getDataLayout().getTypeSizeInBits(llvmType);
  const unsigned alignInBits =
      module_.getDataLayout().getABITypeAlign(llvmType).value() * 8;
  const llvm::StructLayout* layout =
      module_.getDataLayout().getStructLayout(llvmStruct);

  std::vector<llvm::Metadata*> members;
  size_t memberIndex = 0;
  for (AST::FieldDecl* field : *structType->structBody_) {
    llvm::Type* fieldLlvmType = field->varType_->getType(*codeGenerator_);
    llvm::DIType* fieldDiType =
        getOrCreateDIType(fieldLlvmType, field->varType_);
    const uint64_t memberSizeBits =
        module_.getDataLayout().getTypeSizeInBits(fieldLlvmType);
    const uint32_t memberAlignBits =
        module_.getDataLayout().getABITypeAlign(fieldLlvmType).value() * 8;
    for (const std::string& name : *field->memberList_) {
      const uint64_t offsetBits = layout->getElementOffset(memberIndex) * 8;
      members.push_back(dib_->createMemberType(
          compileUnit_, name, file_, 0, memberSizeBits, memberAlignBits,
          offsetBits, llvm::DINode::FlagZero, fieldDiType));
      ++memberIndex;
    }
  }

  llvm::DIType* composite = dib_->createStructType(
      compileUnit_, structType->typeName_, file_, 0, sizeInBits, alignInBits,
      llvm::DINode::FlagZero, nullptr, dib_->getOrCreateArray(members));
  structTypeCache_[structType] = composite;
  llvmTypeCache_[llvmType] = composite;
  return composite;
}

llvm::DIType* DebugInfoBuilder::getOrCreateUnionDIType(
    AST::UnionType* unionType) {
  if (unionType == nullptr || codeGenerator_ == nullptr) {
    return dib_->createBasicType("union", 32, llvm::dwarf::DW_ATE_unsigned);
  }

  auto cached = unionTypeCache_.find(unionType);
  if (cached != unionTypeCache_.end()) {
    return cached->second;
  }

  llvm::Type* llvmType = unionType->getType(*codeGenerator_);
  const uint64_t sizeInBits =
      module_.getDataLayout().getTypeSizeInBits(llvmType);
  const unsigned alignInBits =
      module_.getDataLayout().getABITypeAlign(llvmType).value() * 8;

  std::vector<llvm::Metadata*> members;
  for (AST::FieldDecl* field : *unionType->unionBody_) {
    llvm::Type* fieldLlvmType = field->varType_->getType(*codeGenerator_);
    llvm::DIType* fieldDiType =
        getOrCreateDIType(fieldLlvmType, field->varType_);
    const uint64_t memberSizeBits =
        module_.getDataLayout().getTypeSizeInBits(fieldLlvmType);
    const uint32_t memberAlignBits =
        module_.getDataLayout().getABITypeAlign(fieldLlvmType).value() * 8;
    for (const std::string& name : *field->memberList_) {
      members.push_back(dib_->createMemberType(
          compileUnit_, name, file_, 0, memberSizeBits, memberAlignBits, 0,
          llvm::DINode::FlagZero, fieldDiType));
    }
  }

  llvm::DIType* composite = dib_->createUnionType(
      compileUnit_, unionType->typeName_, file_, 0, sizeInBits, alignInBits,
      llvm::DINode::FlagZero, dib_->getOrCreateArray(members));
  unionTypeCache_[unionType] = composite;
  llvmTypeCache_[llvmType] = composite;
  return composite;
}

llvm::DIType* DebugInfoBuilder::getOrCreateDIType(llvm::Type* llvmType,
                                                  AST::VarType* varType) {
  // LLVM integer types carry no signedness; prefer the AST VarType when present.
  if (varType != nullptr && varType->isStructType()) {
    return getOrCreateStructDIType(static_cast<AST::StructType*>(varType));
  }
  if (varType != nullptr && varType->isUnionType()) {
    return getOrCreateUnionDIType(static_cast<AST::UnionType*>(varType));
  }
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
    if (codeGenerator_ != nullptr) {
      if (AST::StructType* astStruct = codeGenerator_->findStructType(structTy)) {
        return getOrCreateStructDIType(astStruct);
      }
      if (AST::UnionType* astUnion = codeGenerator_->findUnionType(structTy)) {
        return getOrCreateUnionDIType(astUnion);
      }
    }
    std::string name =
        structTy->hasName() ? structTy->getName().str() : "struct";
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

llvm::DIScope* DebugInfoBuilder::createLexicalBlock(llvm::DIScope* parent,
                                                    unsigned line,
                                                    unsigned col) {
  if (!initialized_ || parent == nullptr || line == 0) {
    return parent;
  }

  return dib_->createLexicalBlock(parent, file_, line, col > 0 ? col : 1);
}

void DebugInfoBuilder::insertAllocaDeclare(
    llvm::AllocaInst* alloca, llvm::DILocalVariable* variable, unsigned line,
    unsigned col, llvm::DIScope* scope) {
  llvm::DIExpression* expr = llvm::DIExpression::get(context_, {});
  llvm::DILocation* location = llvm::DILocation::get(context_, line, col, scope);
  // Keep dbg.declare in the entry block, immediately after the matching alloca.
  if (llvm::Instruction* insertBefore = alloca->getNextNode()) {
    dib_->insertDeclare(alloca, variable, expr, location, insertBefore);
  } else {
    dib_->insertDeclare(alloca, variable, expr, location, alloca->getParent());
  }
}

void DebugInfoBuilder::declareAlloca(
    llvm::AllocaInst* alloca, llvm::DIScope* scope, const std::string& name,
    llvm::Type* llvmType, AST::VarType* varType, unsigned line, unsigned col,
    unsigned paramArgNo) {
  if (!initialized_ || scope == nullptr || alloca == nullptr || line == 0) {
    return;
  }

  llvm::DIType* diType = getOrCreateDIType(llvmType, varType);
  unsigned useCol = col > 0 ? col : 1;

  llvm::DILocalVariable* variable = nullptr;
  if (paramArgNo > 0) {
    variable = dib_->createParameterVariable(scope, name, paramArgNo, file_, line,
                                             diType);
  } else {
    variable = dib_->createAutoVariable(scope, name, file_, line, diType);
  }

  insertAllocaDeclare(alloca, variable, line, useCol, scope);
}

void DebugInfoBuilder::setLocation(llvm::IRBuilder<>& builder, unsigned line,
                                   llvm::DIScope* scope, unsigned col) {
  if (scope == nullptr) {
    return;
  }

  llvm::DILocation* location =
      llvm::DILocation::get(context_, line, col, scope);
  builder.SetCurrentDebugLocation(location);
}

void DebugInfoBuilder::finalize() {
  if (!initialized_) {
    return;
  }
  // Required so LLVM attaches completed debug metadata before object emission.
  dib_->finalize();
}
