#include "irgen/ArrayInitializer.hpp"

#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Value.h>

#include <cstddef>
#include <memory>
#include <stdexcept>
#include <string>
#include <vector>

#include "ast/Nodes.hpp"
#include "irgen/CodeGenerator.hpp"
#include "irgen/TypeConversion.hpp"
#include "types/VarTypeQuery.hpp"

// See irgen/ArrayInitializer.hpp for the four-shape table this file implements.
//
// Like the walkers it was split from, this sits at global scope rather than
// inside namespace AST: none of it is an AST member, so AST types are named
// explicitly throughout.
namespace arrayinit {

// Declared in the header because both the global initializer path here and
// VarDecl::genCode's scalar path have to prove a value is compile-time
// constant.
llvm::Constant* asConstant(llvm::Value* value, const std::string& context) {
  auto* constant = llvm::dyn_cast<llvm::Constant>(value);
  if (constant == nullptr) {
    throw std::logic_error(context + " requires a compile-time constant.");
  }
  return constant;
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

namespace {

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

// Owns the nesting buildArrayVarType builds, until the finished chain is handed
// back to the caller. AST::releaseArrayTypeChain stops at the first non-array
// node, so unwinding frees only the ArrayType prefix and leaves the base type
// VarDecl shares across its VarList intact.
struct ArrayTypeChainDeleter {
  void operator()(AST::VarType* chain) const noexcept {
    AST::releaseArrayTypeChain(chain);
  }
};

using OwnedArrayTypeChain =
    std::unique_ptr<AST::VarType, ArrayTypeChainDeleter>;

}  // namespace

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

// The nesting is owned while it is built, because the caller cannot clean up
// after a failure it never receives a pointer from: by the time a later bound
// rejects the declarator, the earlier ones have already allocated.
AST::VarType* buildArrayVarType(AST::VarType* baseType,
                                const std::vector<size_t>& bounds) {
  OwnedArrayTypeChain chain(baseType);
  for (auto it = bounds.rbegin(); it != bounds.rend(); ++it) {
    if (isInferredArrayBound(*it)) {
      throw std::logic_error("Unresolved inferred array bound.");
    }
    // Construct first: should the allocation throw, `chain` still owns the
    // prefix and unwinds it. On success `nested` owns that prefix instead, so
    // `chain` has to let go of it rather than reset over it.
    auto* nested = new AST::ArrayType(chain.get(), *it);
    chain.release();
    chain.reset(nested);
  }
  return chain.release();
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

}  // namespace arrayinit
