#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Value.h>

#include <exception>
#include <memory>
#include <stdexcept>

#include "ast/Nodes.hpp"
#include "irgen/CodeGenerator.hpp"
#include "irgen/DebugInfoBuilder.hpp"
#include "irgen/IrIdioms.hpp"
#include "irgen/TypeConversion.hpp"
#include "types/VarTypeQuery.hpp"

// Declarations -> LLVM IR: genCode() for Program, FuncDecl, VarDecl, TypeDecl
// and TypedefDecl, plus everything VarDecl::genCode delegates to — array
// declarator bounds, brace and string initializers, and block-scope statics.
//
// Those delegates are file-local below. Brace initializers flatten to a linear
// slot vector (nullptr = zero-fill) before GEP/store for locals or
// ConstantArray assembly for globals; a block-scope static becomes one module
// global per (function, name), with a guard variable when its initializer is
// not a constant.

// Unlike the other walkers, this anonymous namespace sits at global scope
// rather than inside namespace AST: these helpers are not AST members and never
// were, so they name AST types explicitly. The genCode() definitions they serve
// follow, inside namespace AST.
namespace {

// Element type and length of a one-dimensional array type.
struct Array1DInfo {
  AST::VarType* elemVarType;
  size_t length;
};

// Element type plus every dimension of a (possibly multi-dimensional) array.
struct ArrayTypeInfo {
  AST::VarType* elemVarType;
  std::vector<size_t> dims;
};

ArrayTypeInfo getArrayTypeInfo(AST::VarType* varType) {
  ArrayTypeInfo info;
  AST::VarType* type = varType;
  while (type->isArrayType()) {
    auto* arrayType = static_cast<AST::ArrayType*>(type);
    info.dims.push_back(arrayType->length_);
    type = arrayType->baseType_;
  }
  info.elemVarType = type;
  return info;
}

bool initListHasNested(const AST::InitList& initList) {
  for (AST::InitElement* element : initList) {
    if (element->isNested()) {
      return true;
    }
  }
  return false;
}

size_t count1DInitElements(const AST::InitList& initList) {
  for (AST::InitElement* element : initList) {
    if (element->isNested()) {
      throw std::logic_error(
          "Nested brace initializers are not supported for 1D arrays.");
    }
  }
  return initList.size();
}

// Nested {{…},{…}} → outer list size; flat {a,b,c,…} → ceil(n/cols) rows.
size_t infer2DRowCount(const AST::InitList& initList, size_t cols) {
  if (initList.empty()) {
    throw std::logic_error("Cannot infer array size from empty initializer.");
  }
  if (initListHasNested(initList)) {
    return initList.size();
  }
  return ((initList.size() - 1) / cols) + 1;
}

// Brace initializers normalize to one slot per element; nullptr slots
// zero-fill.
std::vector<AST::Expr*> flatten1DInit(const AST::InitList& initList,
                                      size_t length) {
  if (initList.size() > length) {
    throw std::logic_error("Too many elements in array initializer.");
  }

  std::vector<AST::Expr*> flat(length, nullptr);
  for (size_t i = 0; i < initList.size(); ++i) {
    if (initList[i]->isNested()) {
      throw std::logic_error(
          "Nested brace initializers are not supported for 1D arrays.");
    }
    flat[i] = initList[i]->expr_;
  }
  return flat;
}

std::vector<AST::Expr*> flatten2DInit(const AST::InitList& initList,
                                      size_t rows, size_t cols) {
  const size_t total = rows * cols;
  std::vector<AST::Expr*> flat(total, nullptr);

  if (initListHasNested(initList)) {
    if (initList.size() > rows) {
      throw std::logic_error("Too many rows in array initializer.");
    }
    for (size_t row = 0; row < initList.size(); ++row) {
      if (!initList[row]->isNested()) {
        throw std::logic_error("Expected nested row initializer.");
      }
      const AST::InitList& rowInit = *initList[row]->nested_;
      if (rowInit.size() > cols) {
        throw std::logic_error("Too many elements in array initializer row.");
      }
      for (size_t col = 0; col < rowInit.size(); ++col) {
        if (rowInit[col]->isNested()) {
          throw std::logic_error(
              "Array initializer nesting is deeper than the array type.");
        }
        flat[(row * cols) + col] = rowInit[col]->expr_;
      }
    }
    return flat;
  }

  if (initList.size() > total) {
    throw std::logic_error("Too many elements in array initializer.");
  }
  for (size_t i = 0; i < initList.size(); ++i) {
    if (initList[i]->isNested()) {
      throw std::logic_error(
          "Mixed flat and nested array initializers are not supported.");
    }
    flat[i] = initList[i]->expr_;
  }
  return flat;
}

size_t stringInitializerLength(const std::string& str) {
  return str.size() + 1;
}

void validateStringFitsArray(const std::string& str, size_t length) {
  if (stringInitializerLength(str) > length) {
    throw std::logic_error("String initializer is too long for array.");
  }
}

llvm::Constant* asConstant(llvm::Value* value, const std::string& context) {
  auto* constant = llvm::dyn_cast<llvm::Constant>(value);
  if (constant == nullptr) {
    throw std::logic_error(context + " requires a compile-time constant.");
  }
  return constant;
}

llvm::Constant* exprToGlobalInitConstant(CodeGenerator& generator,
                                         AST::Expr* expr,
                                         AST::VarType* elemVarType,
                                         llvm::Type* elemLlvmType) {
  llvm::Value* value = convert::typeCast(
      generator.getBuilder(), expr->genCode(generator), elemLlvmType,
      expr->getExprTypeId(generator), vartype::varTypeToTypeId(elemVarType));
  if (value == nullptr) {
    throw std::logic_error("Array initializer element type mismatch.");
  }
  return asConstant(value, "Global array initializer element");
}

llvm::Constant* buildGlobalArrayInitializer(
    CodeGenerator& generator, AST::VarType* elemVarType,
    llvm::Type* elemLlvmType, size_t length,
    const std::vector<AST::Expr*>& flatInit) {
  std::vector<llvm::Constant*> elements;
  elements.reserve(length);
  for (size_t i = 0; i < length; ++i) {
    if (flatInit[i] == nullptr) {
      elements.push_back(llvm::Constant::getNullValue(elemLlvmType));
      continue;
    }
    elements.push_back(exprToGlobalInitConstant(generator, flatInit[i],
                                                elemVarType, elemLlvmType));
  }

  return llvm::ConstantArray::get(llvm::ArrayType::get(elemLlvmType, length),
                                  elements);
}

llvm::Constant* buildGlobal2DArrayInitializer(
    CodeGenerator& generator, const ArrayTypeInfo& info,
    llvm::Type* llvmArrayType, llvm::Type* elemLlvmType,
    const std::vector<AST::Expr*>& flatInit) {
  const size_t rows = info.dims[0];
  const size_t cols = info.dims[1];
  llvm::Type* rowLlvmType = llvm::ArrayType::get(elemLlvmType, cols);

  std::vector<llvm::Constant*> rowConstants;
  rowConstants.reserve(rows);
  for (size_t row = 0; row < rows; ++row) {
    std::vector<llvm::Constant*> rowElements;
    rowElements.reserve(cols);
    for (size_t col = 0; col < cols; ++col) {
      AST::Expr* expr = flatInit[(row * cols) + col];
      if (expr == nullptr) {
        rowElements.push_back(llvm::Constant::getNullValue(elemLlvmType));
        continue;
      }
      rowElements.push_back(exprToGlobalInitConstant(
          generator, expr, info.elemVarType, elemLlvmType));
    }
    rowConstants.push_back(llvm::ConstantArray::get(
        llvm::cast<llvm::ArrayType>(rowLlvmType), rowElements));
  }

  return llvm::ConstantArray::get(llvm::cast<llvm::ArrayType>(llvmArrayType),
                                  rowConstants);
}

void storeLocalFlatArrayInitializer(CodeGenerator& generator,
                                    llvm::Value* storagePtr,
                                    llvm::Type* llvmArrayType,
                                    AST::VarType* elemVarType,
                                    llvm::Type* elemLlvmType,
                                    const std::vector<size_t>& dims,
                                    const std::vector<AST::Expr*>& flatInit) {
  llvm::IRBuilder<>& builder = generator.getBuilder();
  llvm::IntegerType* indexType = builder.getInt32Ty();
  llvm::Value* zeroIndex = llvm::ConstantInt::get(indexType, 0);
  llvm::Value* zeroValue = llvm::Constant::getNullValue(elemLlvmType);

  const size_t cols = dims.back();
  const size_t rows = dims.size() == 2 ? dims[0] : 1;
  const size_t length = dims.size() == 1 ? dims[0] : rows * cols;

  for (size_t linear = 0; linear < length; ++linear) {
    std::vector<llvm::Value*> gepIndices = {zeroIndex};
    if (dims.size() == 1) {
      gepIndices.push_back(llvm::ConstantInt::get(indexType, linear));
    } else {
      gepIndices.push_back(llvm::ConstantInt::get(indexType, linear / cols));
      gepIndices.push_back(llvm::ConstantInt::get(indexType, linear % cols));
    }

    llvm::Value* elementPtr =
        builder.CreateGEP(llvmArrayType, storagePtr, gepIndices);
    AST::Expr* expr = flatInit[linear];
    if (expr == nullptr) {
      builder.CreateStore(zeroValue, elementPtr);
      continue;
    }

    llvm::Value* value = convert::typeCast(
        builder, expr->genCode(generator), elemLlvmType,
        expr->getExprTypeId(generator), vartype::varTypeToTypeId(elemVarType));
    if (value == nullptr) {
      throw std::logic_error("Array initializer element type mismatch.");
    }
    builder.CreateStore(value, elementPtr);
  }
}

std::string mangleStaticLocalName(llvm::Function* func,
                                  const std::string& varName) {
  return func->getName().str() + "." + varName;
}

// Block-scope static has function lifetime but module storage. Split the
// current block so initializer code runs once on first execution.
llvm::BasicBlock* emitLocalStaticLazyInitPrologue(CodeGenerator& generator,
                                                  llvm::GlobalVariable* guard) {
  llvm::IRBuilder<>& builder = generator.getBuilder();
  llvm::Function* func = generator.getCurrentFunction();
  llvm::BasicBlock* initBlock =
      llvm::BasicBlock::Create(generator.getContext(), "static.init", func);
  llvm::BasicBlock* contBlock =
      llvm::BasicBlock::Create(generator.getContext(), "static.cont", func);

  llvm::Value* inited =
      builder.CreateLoad(builder.getInt1Ty(), guard, "static.inited");
  builder.CreateCondBr(inited, contBlock, initBlock);
  builder.SetInsertPoint(initBlock);
  return contBlock;
}

void emitLocalStaticLazyInitEpilogue(CodeGenerator& generator,
                                     llvm::GlobalVariable* guard,
                                     llvm::BasicBlock* contBlock) {
  llvm::IRBuilder<>& builder = generator.getBuilder();
  builder.CreateStore(llvm::ConstantInt::getTrue(builder.getInt1Ty()), guard);
  builder.CreateBr(contBlock);
  builder.SetInsertPoint(contBlock);
}

llvm::GlobalVariable* createLocalStaticGuard(CodeGenerator& generator,
                                             const std::string& globalName) {
  return new llvm::GlobalVariable(
      generator.getModule(), generator.getBuilder().getInt1Ty(), false,
      llvm::GlobalValue::PrivateLinkage,
      llvm::ConstantInt::getFalse(generator.getBuilder().getInt1Ty()),
      globalName + ".inited");
}

bool isInferredArrayBound(size_t bound) {
  return bound == AST::kInferredArrayBound;
}

bool isCharElementType(AST::VarType* baseType) {
  return vartype::varTypeToTypeId(baseType) == AST::BuiltinTypeId::CHAR;
}

AST::ConstStr* asConstStr(AST::Expr* expr) {
  return dynamic_cast<AST::ConstStr*>(expr);
}

std::vector<size_t> resolveArrayBounds(const AST::VarInit* var,
                                       AST::VarType* baseType) {
  std::vector<size_t> bounds = var->arrayBounds_;
  if (bounds.empty()) {
    return bounds;
  }

  for (size_t i = 1; i < bounds.size(); ++i) {
    if (isInferredArrayBound(bounds[i])) {
      throw std::logic_error("Only the first array dimension may be inferred.");
    }
  }

  for (size_t i = 0; i < bounds.size(); ++i) {
    if (!isInferredArrayBound(bounds[i])) {
      continue;
    }

    if (i != 0) {
      throw std::logic_error("Only the first array dimension may be inferred.");
    }

    if (var->hasBraceInit()) {
      if (bounds.size() == 1) {
        bounds[i] = count1DInitElements(*var->initList_);
      } else if (bounds.size() == 2) {
        bounds[i] = infer2DRowCount(*var->initList_, bounds[1]);
      } else {
        throw std::logic_error(
            "Inferred array size for more than two dimensions is not "
            "supported yet.");
      }
      continue;
    }

    AST::ConstStr* strInit = asConstStr(var->initialExpr_);
    if (strInit != nullptr && isCharElementType(baseType) &&
        bounds.size() == 1) {
      bounds[i] = stringInitializerLength(strInit->str_);
      continue;
    }

    throw std::logic_error("Array with inferred size requires an initializer.");
  }

  return bounds;
}

Array1DInfo get1DArrayInfo(AST::VarType* varType) {
  ArrayTypeInfo info = getArrayTypeInfo(varType);
  if (info.dims.size() != 1) {
    throw std::logic_error("Expected a one-dimensional array type.");
  }
  return {info.elemVarType, info.dims[0]};
}

void storeBraceArrayInitializer(CodeGenerator& generator,
                                llvm::Value* storagePtr,
                                llvm::Type* llvmArrayType,
                                AST::VarType* varType,
                                const AST::InitList& initList) {
  ArrayTypeInfo info = getArrayTypeInfo(varType);
  llvm::Type* elemLlvmType = info.elemVarType->getType(generator);
  if (elemLlvmType == nullptr) {
    throw std::logic_error("Define variable with unknown type!");
  }

  if (info.dims.size() == 1) {
    std::vector<AST::Expr*> flat = flatten1DInit(initList, info.dims[0]);
    storeLocalFlatArrayInitializer(generator, storagePtr, llvmArrayType,
                                   info.elemVarType, elemLlvmType, info.dims,
                                   flat);
    return;
  }

  if (info.dims.size() == 2) {
    std::vector<AST::Expr*> flat =
        flatten2DInit(initList, info.dims[0], info.dims[1]);
    storeLocalFlatArrayInitializer(generator, storagePtr, llvmArrayType,
                                   info.elemVarType, elemLlvmType, info.dims,
                                   flat);
    return;
  }

  throw std::logic_error(
      "Brace initialization for more than two dimensions is not supported "
      "yet.");
}

llvm::Constant* buildBraceArrayInitializer(CodeGenerator& generator,
                                           AST::VarType* varType,
                                           llvm::Type* llvmVarType,
                                           const AST::InitList& initList) {
  ArrayTypeInfo info = getArrayTypeInfo(varType);
  llvm::Type* elemLlvmType = info.elemVarType->getType(generator);
  if (elemLlvmType == nullptr) {
    throw std::logic_error("Define variable with unknown type!");
  }

  if (info.dims.size() == 1) {
    std::vector<AST::Expr*> flat = flatten1DInit(initList, info.dims[0]);
    return buildGlobalArrayInitializer(generator, info.elemVarType,
                                       elemLlvmType, info.dims[0], flat);
  }

  if (info.dims.size() == 2) {
    std::vector<AST::Expr*> flat =
        flatten2DInit(initList, info.dims[0], info.dims[1]);
    return buildGlobal2DArrayInitializer(generator, info, llvmVarType,
                                         elemLlvmType, flat);
  }

  throw std::logic_error(
      "Brace initialization for more than two dimensions is not supported "
      "yet.");
}

llvm::Constant* buildGlobalStringArrayInitializer(llvm::Type* charLlvmType,
                                                  size_t length,
                                                  const std::string& str) {
  validateStringFitsArray(str, length);

  std::vector<llvm::Constant*> elements;
  elements.reserve(length);
  for (unsigned char ch : str) {
    elements.push_back(llvm::ConstantInt::get(charLlvmType, ch));
  }
  elements.push_back(llvm::ConstantInt::get(charLlvmType, 0));
  while (elements.size() < length) {
    elements.push_back(llvm::ConstantInt::get(charLlvmType, 0));
  }

  return llvm::ConstantArray::get(llvm::ArrayType::get(charLlvmType, length),
                                  elements);
}

void storeLocalStringArrayInitializer(CodeGenerator& generator,
                                      llvm::Value* storagePtr,
                                      llvm::Type* llvmArrayType,
                                      llvm::Type* charLlvmType, size_t length,
                                      const std::string& str) {
  validateStringFitsArray(str, length);

  llvm::IRBuilder<>& builder = generator.getBuilder();
  llvm::IntegerType* indexType = builder.getInt32Ty();
  llvm::Value* zeroIndex = llvm::ConstantInt::get(indexType, 0);
  llvm::Value* zeroValue = llvm::ConstantInt::get(charLlvmType, 0);

  size_t i = 0;
  for (; i < str.size(); ++i) {
    llvm::Value* index = llvm::ConstantInt::get(indexType, i);
    llvm::Value* elementPtr =
        builder.CreateGEP(llvmArrayType, storagePtr, {zeroIndex, index});
    llvm::Value* value = llvm::ConstantInt::get(
        charLlvmType, static_cast<unsigned char>(str[i]));
    builder.CreateStore(value, elementPtr);
  }

  llvm::Value* nullIndex = llvm::ConstantInt::get(indexType, i);
  llvm::Value* nullPtr =
      builder.CreateGEP(llvmArrayType, storagePtr, {zeroIndex, nullIndex});
  builder.CreateStore(zeroValue, nullPtr);
  ++i;

  for (; i < length; ++i) {
    llvm::Value* index = llvm::ConstantInt::get(indexType, i);
    llvm::Value* elementPtr =
        builder.CreateGEP(llvmArrayType, storagePtr, {zeroIndex, index});
    builder.CreateStore(zeroValue, elementPtr);
  }
}

void defineBlockStaticVar(CodeGenerator& generator, AST::VarInit* var,
                          AST::VarType* varType, llvm::Type* llvmVarType,
                          AST::VarType* baseVarType, bool isArray,
                          AST::ConstStr* strInit) {
  llvm::Function* func = generator.getCurrentFunction();
  if (func == nullptr) {
    throw std::logic_error("Block-scope static requires a function context.");
  }

  const std::string globalName = mangleStaticLocalName(func, var->varName_);
  llvm::Constant* constantInit = nullptr;
  bool needsRuntimeInit = var->hasBraceInit();

  if (!needsRuntimeInit) {
    if (strInit != nullptr && isArray) {
      Array1DInfo arrayInfo = get1DArrayInfo(varType);
      llvm::Type* elemLlvmType = arrayInfo.elemVarType->getType(generator);
      if (elemLlvmType == nullptr) {
        throw std::logic_error("Define variable with unknown type!");
      }
      constantInit = buildGlobalStringArrayInitializer(
          elemLlvmType, arrayInfo.length, strInit->str_);
    } else if (var->initialExpr_ != nullptr) {
      generator.switchInsertPointToGlobalBlock();
      llvm::Value* initialExpr = convert::typeCast(
          generator.getBuilder(), var->initialExpr_->genCode(generator),
          llvmVarType, var->initialExpr_->getExprTypeId(generator),
          vartype::resolvedVarTypeToTypeId(varType, generator));
      generator.switchInsertPointToCurrentBlock();
      if (initialExpr == nullptr) {
        throw std::logic_error("It failed to init variable " + var->varName_ +
                               " with value of different type!");
      }
      constantInit = llvm::dyn_cast<llvm::Constant>(initialExpr);
      if (constantInit == nullptr) {
        needsRuntimeInit = true;
      }
    } else {
      constantInit = llvm::Constant::getNullValue(llvmVarType);
    }
  }

  llvm::GlobalVariable* globalVar = nullptr;
  if (!needsRuntimeInit) {
    globalVar = new llvm::GlobalVariable(
        generator.getModule(), llvmVarType, baseVarType->isConst_,
        llvm::GlobalValue::InternalLinkage, constantInit, globalName);
  } else {
    globalVar = new llvm::GlobalVariable(
        generator.getModule(), llvmVarType, baseVarType->isConst_,
        llvm::GlobalValue::InternalLinkage,
        llvm::Constant::getNullValue(llvmVarType), globalName);
    llvm::GlobalVariable* guard = createLocalStaticGuard(generator, globalName);
    llvm::BasicBlock* contBlock =
        emitLocalStaticLazyInitPrologue(generator, guard);

    if (var->hasBraceInit()) {
      storeBraceArrayInitializer(generator, globalVar, llvmVarType, varType,
                                 *var->initList_);
    } else if (strInit != nullptr && isArray) {
      Array1DInfo arrayInfo = get1DArrayInfo(varType);
      llvm::Type* elemLlvmType = arrayInfo.elemVarType->getType(generator);
      storeLocalStringArrayInitializer(generator, globalVar, llvmVarType,
                                       elemLlvmType, arrayInfo.length,
                                       strInit->str_);
    } else if (var->initialExpr_ != nullptr) {
      llvm::Value* initializer = convert::typeCast(
          generator.getBuilder(), var->initialExpr_->genCode(generator),
          llvmVarType, var->initialExpr_->getExprTypeId(generator),
          vartype::resolvedVarTypeToTypeId(varType, generator));
      if (initializer == nullptr) {
        throw std::logic_error("It failed to init variable " + var->varName_ +
                               " with value of different type!");
      }
      generator.getBuilder().CreateStore(initializer, globalVar);
    }

    emitLocalStaticLazyInitEpilogue(generator, guard, contBlock);
  }

  if (!generator.addVariable(var->varName_, globalVar, varType)) {
    globalVar->eraseFromParent();
    if (generator.hasTypedefAliasInCurrentScope(var->varName_)) {
      throw std::logic_error("It is not allowed to use typedef name " +
                             var->varName_ +
                             " as a variable in the same scope!");
    }
    throw std::logic_error(
        "It is not allowed to redefine the same local variable " +
        var->varName_ + " in the same scope!");
  }
}

}  // namespace

namespace AST {

llvm::Value* InitElement::genCode(CodeGenerator& generator) {
  (void)generator;
  throw std::logic_error("InitElement is not an expression.");
}

llvm::Value* Program::genCode(CodeGenerator& generator) {
  for (Decl* decl : *decls_) {
    if (decl != nullptr) {
      decl->genCode(generator);
    }
  }
  return nullptr;
}

// Declarations

llvm::Value* FuncDecl::genCode(CodeGenerator& generator) {
  std::vector<llvm::Type*> paramTypes;
  bool hasVoidParamType = false;
  for (Param* param : *paramList_) {
    llvm::Type* type = param->varType_->getType(generator);
    if (type == nullptr) {
      throw std::logic_error("Define function " + funcName_ +
                             " with known type!");
    }

    if (type->isVoidTy()) {
      hasVoidParamType = true;
    }

    // When argument type is array type, only pointer is passed, size attribute
    // disappears.
    if (type->isArrayTy()) {
      type = llvm::PointerType::get(generator.getContext(), 0);
    }

    paramTypes.push_back(type);
  }

  // Only funcName(void) is allowed.
  if (paramTypes.size() >= 2 && hasVoidParamType) {
    throw std::logic_error("Function " + funcName_ +
                           " has invalid void param!");
  }

  // funcName(void) is funcName(), no parameter.
  if (paramTypes.size() == 1 && hasVoidParamType) {
    paramTypes.clear();
  }

  llvm::Type* retType = retType_->getType(generator);
  if (retType->isArrayTy()) {
    throw std::logic_error("Function " + funcName_ +
                           " should not return array type!");
  }

  llvm::FunctionType* funcType =
      llvm::FunctionType::get(retType, paramTypes, paramList_->isVariant_);
  llvm::GlobalValue::LinkageTypes linkage =
      isStatic_ ? llvm::GlobalValue::InternalLinkage
                : llvm::GlobalValue::ExternalLinkage;
  llvm::Function* func = llvm::Function::Create(funcType, linkage, funcName_,
                                                &generator.getModule());

  std::vector<VarType*> paramVarTypes;
  for (Param* param : *paramList_) {
    paramVarTypes.push_back(param->varType_);
  }
  generator.setFuncSignature(funcName_, retType_, paramVarTypes);
  generator.addFunction(funcName_, func);

  // LLVM merges symbols with the same name in one module. A prior declaration
  // and a later definition therefore share one llvm::Function; we detect that
  // here to implement C-style prototype + body linking.
  if (func->getName() != funcName_) {
    // Remove the function just made, use the existing function.
    func->eraseFromParent();
    func = generator.getModule().getFunction(funcName_);

    if (func->getFunctionType() != funcType) {
      throw std::logic_error("Redefine function " + funcName_ +
                             " with different params!");
    }

    if (func->getLinkage() != linkage) {
      throw std::logic_error("Function " + funcName_ +
                             " declarations conflict on static linkage!");
    }

    // Function declaration conflict.
    // Previous function declaration must be declaration without function body.
    // Current function declaration must be definition with function body.
    if (!func->empty() || funcBody_ == nullptr) {
      throw std::logic_error("Function " + funcName_ +
                             " declarations conflict!");
    }
  }

  // -g: attach a DWARF subprogram to definitions; line is the function name
  // token.
  llvm::DISubprogram* subprogram = nullptr;
  if (funcBody_ != nullptr && generator.isDebugInfoEnabled()) {
    unsigned line = loc().line > 0 ? loc().line : 1;
    subprogram = generator.debugInfo()->createFunction(
        func, funcName_, line, funcType, retType_, paramVarTypes);
  }

  if (funcBody_ != nullptr) {
    llvm::BasicBlock* funcBlock =
        llvm::BasicBlock::Create(generator.getContext(), "entry", func);
    generator.getBuilder().SetInsertPoint(funcBlock);
    // enterFunction before param debug info: setDebugLocation uses
    // getCurrentFunction().
    generator.enterFunction(func);

    if (subprogram != nullptr) {
      generator.setDebugLocation(loc());
    }

    // Allocate symbol table for function parameters.
    ScopedSymbolTable paramScope(generator);

    size_t index = 0;
    for (auto* paramIter = func->arg_begin(); paramIter < func->arg_end();
         ++paramIter, ++index) {
      // alloca on stack for parameter.
      llvm::AllocaInst* allocaInst = iridiom::createEntryBlockAlloca(
          func, paramList_->at(index)->varName_, paramTypes[index]);
      generator.getBuilder().CreateStore(paramIter, allocaInst);
      generator.addVariable(paramList_->at(index)->varName_, allocaInst,
                            paramList_->at(index)->varType_);
      if (subprogram != nullptr) {
        generator.declareDebugAlloca(
            allocaInst, paramList_->at(index)->varName_, paramTypes[index],
            paramList_->at(index)->varType_, loc(), index + 1);
      }
    }

    {
      ScopedSymbolTable bodyScope(generator);
      funcBody_->genCode(generator);
    }
    generator.leaveFunction();
  }

  return nullptr;
}

VarType* VarInit::buildVarType(VarType* baseType) const {
  return buildVarType(baseType, arrayBounds_);
}

// C declarator int a[8][5] yields bounds [8,5]; nest ArrayType inside-out
// (innermost bound first) so a[i] has type int[5] and a[i][j] is int.
VarType* VarInit::buildVarType(VarType* baseType,
                               const std::vector<size_t>& bounds) {
  VarType* type = baseType;
  for (auto it = bounds.rbegin(); it != bounds.rend(); ++it) {
    if (isInferredArrayBound(*it)) {
      throw std::logic_error("Unresolved inferred array bound.");
    }
    type = new ArrayType(type, *it);
  }
  return type;
}

// Per VarInit: resolve bounds → build nested ArrayType → alloca, block-static
// global, or file-scope global; then brace init, string literal, scalar expr.
llvm::Value* VarDecl::genCode(CodeGenerator& generator) {
  llvm::Type* baseLlvmType = varType_->getType(generator);
  if (baseLlvmType == nullptr) {
    throw std::logic_error("Define variable with unknown type!");
  }
  if (baseLlvmType->isVoidTy()) {
    throw std::logic_error("It is not allowed to define void variable!");
  }

  for (VarInit* var : *varList_) {
    std::vector<size_t> resolvedBounds = resolveArrayBounds(var, varType_);
    bool isArray = !resolvedBounds.empty();
    ConstStr* strInit = asConstStr(var->initialExpr_);

    if (var->hasBraceInit()) {
      if (!isArray) {
        throw std::logic_error(
            "Brace initialization is only supported for arrays.");
      }
    } else if (isArray && var->initialExpr_ != nullptr) {
      if (strInit == nullptr || !isCharElementType(varType_)) {
        throw std::logic_error(
            "Array variable " + var->varName_ +
            " cannot be initialized with a single expression; use brace "
            "initialization or a string literal for char arrays.");
      }
    }

    var->arrayVarType_ = var->buildVarType(varType_, resolvedBounds);
    VarType* varType = var->arrayVarType_;
    llvm::Type* llvmVarType = varType->getType(generator);
    if (llvmVarType == nullptr) {
      throw std::logic_error("Define variable with unknown type!");
    }

    if (generator.getCurrentFunction() != nullptr) {
      if (isStatic_) {
        defineBlockStaticVar(generator, var, varType, llvmVarType, varType_,
                             isArray, strInit);
        continue;
      }

      llvm::AllocaInst* allocaInst = iridiom::createEntryBlockAlloca(
          generator.getCurrentFunction(), var->varName_, llvmVarType);
      if (!generator.addVariable(var->varName_, allocaInst, varType)) {
        allocaInst->eraseFromParent();
        if (generator.hasTypedefAliasInCurrentScope(var->varName_)) {
          throw std::logic_error("It is not allowed to use typedef name " +
                                 var->varName_ +
                                 " as a variable in the same scope!");
        }
        throw std::logic_error(
            "It is not allowed to redefine the same local variable " +
            var->varName_ + " in the same scope!");
      }

      generator.declareDebugAlloca(allocaInst, var->varName_, llvmVarType,
                                   varType, loc());

      if (var->hasBraceInit()) {
        storeBraceArrayInitializer(generator, allocaInst, llvmVarType, varType,
                                   *var->initList_);
      } else if (strInit != nullptr && isArray) {
        Array1DInfo arrayInfo = get1DArrayInfo(varType);
        llvm::Type* elemLlvmType = arrayInfo.elemVarType->getType(generator);
        storeLocalStringArrayInitializer(generator, allocaInst, llvmVarType,
                                         elemLlvmType, arrayInfo.length,
                                         strInit->str_);
      } else if (var->initialExpr_ != nullptr) {
        llvm::Value* initializer = convert::typeCast(
            generator.getBuilder(), var->initialExpr_->genCode(generator),
            llvmVarType, var->initialExpr_->getExprTypeId(generator),
            vartype::resolvedVarTypeToTypeId(varType, generator));
        if (initializer == nullptr) {
          allocaInst->eraseFromParent();
          throw std::logic_error("It failed to init variable " + var->varName_ +
                                 " with value of different type!");
        }
        generator.getBuilder().CreateStore(initializer, allocaInst);
      }
    } else {
      llvm::Constant* initializer = nullptr;
      if (var->hasBraceInit()) {
        initializer = buildBraceArrayInitializer(generator, varType,
                                                 llvmVarType, *var->initList_);
      } else if (strInit != nullptr && isArray) {
        Array1DInfo arrayInfo = get1DArrayInfo(varType);
        llvm::Type* elemLlvmType = arrayInfo.elemVarType->getType(generator);
        if (elemLlvmType == nullptr) {
          throw std::logic_error("Define variable with unknown type!");
        }
        initializer = buildGlobalStringArrayInitializer(
            elemLlvmType, arrayInfo.length, strInit->str_);
      } else if (var->initialExpr_ != nullptr) {
        generator.switchInsertPointToGlobalBlock();
        llvm::Value* initialExpr = convert::typeCast(
            generator.getBuilder(), var->initialExpr_->genCode(generator),
            llvmVarType, var->initialExpr_->getExprTypeId(generator),
            vartype::resolvedVarTypeToTypeId(varType, generator));
        if (initialExpr == nullptr) {
          throw std::logic_error("It failed to init variable " + var->varName_ +
                                 " with value of different type!");
        }
        generator.switchInsertPointToCurrentBlock();
        initializer = asConstant(initialExpr, "Global variable initializer");
      } else {
        // C static-storage objects with no initializer are zero-initialized
        // (C11 6.7.9/10). lcc is single-TU, so a zeroinitializer strong
        // definition matches the final tentative definition; undef would let
        // the optimizer read garbage from untouched globals.
        initializer = llvm::Constant::getNullValue(llvmVarType);
      }

      llvm::GlobalValue::LinkageTypes linkage =
          isStatic_ ? llvm::GlobalValue::InternalLinkage
                    : llvm::GlobalValue::ExternalLinkage;
      auto* globalVar = new llvm::GlobalVariable(
          generator.getModule(), llvmVarType, varType_->isConst_, linkage,
          initializer, var->varName_);
      if (!generator.addVariable(var->varName_, globalVar, varType)) {
        if (generator.hasTypedefAliasInCurrentScope(var->varName_)) {
          throw std::logic_error("It is not allowed to use typedef name " +
                                 var->varName_ +
                                 " as a variable in the same scope!");
        }
        throw std::logic_error(
            "It is not allowed to redefine global variable " + var->varName_);
      }
    }
  }

  return nullptr;
}

llvm::Value* TypeDecl::genCode(CodeGenerator& generator) {
  llvm::Type* type;
  if (varType_->isStructType()) {
    type = ((StructType*)varType_)->genTypeHead(generator, varType_->typeName_);
  } else if (varType_->isUnionType()) {
    type = ((UnionType*)varType_)->genTypeHead(generator, varType_->typeName_);
  } else {
    type = varType_->getType(generator);
  }

  if (type == nullptr) {
    throw std::logic_error("Failed to define type " + varType_->typeName_);
  }

  if (!generator.addType(varType_->typeName_, type)) {
    throw std::logic_error("It is not allowed to redefine type " +
                           varType_->typeName_);
  }

  if (varType_->isStructType()) {
    ((StructType*)varType_)->genTypeBody(generator);
  } else if (varType_->isUnionType()) {
    ((UnionType*)varType_)->genTypeBody(generator);
  }

  return nullptr;
}

llvm::Value* TypedefDecl::genCode(CodeGenerator& generator) {
  llvm::Type* llvmType;
  if (underlyingType_->isStructType()) {
    llvmType = ((StructType*)underlyingType_)
                   ->genTypeHead(generator, underlyingType_->typeName_);
  } else if (underlyingType_->isUnionType()) {
    llvmType = ((UnionType*)underlyingType_)
                   ->genTypeHead(generator, underlyingType_->typeName_);
  } else {
    llvmType = underlyingType_->getType(generator);
  }

  if (llvmType == nullptr) {
    throw std::logic_error("Failed to define typedef " + aliasName_);
  }

  if (!generator.addTypedefAlias(aliasName_, underlyingType_)) {
    throw std::logic_error("It is not allowed to redefine typedef " +
                           aliasName_);
  }

  auto registerTypeName = [&](const std::string& typeName) {
    if (generator.findType(typeName) == nullptr) {
      if (!generator.addType(typeName, llvmType)) {
        throw std::logic_error("It is not allowed to redefine type " +
                               typeName);
      }
    }
  };

  registerTypeName(aliasName_);

  if (underlyingType_->isStructType() || underlyingType_->isUnionType()) {
    const std::string& tagName = underlyingType_->typeName_;
    if (tagName != aliasName_) {
      registerTypeName(tagName);
    }
  }

  if (underlyingType_->isStructType()) {
    ((StructType*)underlyingType_)->genTypeBody(generator);
  } else if (underlyingType_->isUnionType()) {
    ((UnionType*)underlyingType_)->genTypeBody(generator);
  }

  return nullptr;
}

}  // namespace AST
