#include "types/VarTypeQuery.hpp"

#include <llvm/IR/DerivedTypes.h>

#include <stdexcept>

#include "ast/Nodes.hpp"
#include "types/TypeEnv.hpp"

using AST::BuiltinTypeId;

namespace vartype {

BuiltinTypeId varTypeToTypeId(AST::VarType* varType) {
  if (varType == nullptr) {
    return BuiltinTypeId::UNKNOWN;
  }

  if (varType->isBuiltinType()) {
    return static_cast<AST::BuiltinType*>(varType)->typeId_;
  }
  if (varType->isEnumType()) {
    return BuiltinTypeId::INT;
  }
  if (varType->isArrayType()) {
    return varTypeToTypeId(static_cast<AST::ArrayType*>(varType)->baseType_);
  }

  return BuiltinTypeId::UNKNOWN;
}

// Follow typedef aliases on DefinedType nodes. Stop when unmapped or when the
// alias is the same node (e.g. "typedef struct Employee Employee") so getType()
// can resolve the struct tag instead of looping forever.
AST::VarType* resolveTypedefVarType(AST::VarType* varType, TypeEnv& env) {
  if (varType == nullptr) {
    return nullptr;
  }

  while (varType != nullptr && varType->isDefinedType()) {
    AST::VarType* alias = env.findTypedefAlias(varType->typeName_);
    if (alias == nullptr || alias == varType) {
      break;
    }
    varType = alias;
  }

  return varType;
}

AST::VarType* resolveAggregateVarType(AST::VarType* varType, TypeEnv& env) {
  varType = resolveTypedefVarType(varType, env);
  if (varType == nullptr) {
    return nullptr;
  }
  if (varType->isStructType() || varType->isUnionType()) {
    return varType;
  }
  if (varType->isDefinedType()) {
    llvm::Type* llvmTy = varType->getType(env);
    if (llvmTy != nullptr && llvmTy->isStructTy()) {
      auto* structTy = static_cast<llvm::StructType*>(llvmTy);
      if (AST::StructType* astStruct = env.findStructType(structTy)) {
        return astStruct;
      }
      if (AST::UnionType* astUnion = env.findUnionType(structTy)) {
        return astUnion;
      }
    }
  }
  return nullptr;
}

BuiltinTypeId resolvedVarTypeToTypeId(AST::VarType* varType, TypeEnv& env) {
  return varTypeToTypeId(resolveTypedefVarType(varType, env));
}

llvm::Type* pointerArithmeticElementType(AST::VarType* ptrExprVarType,
                                         TypeEnv& env) {
  AST::VarType* resolved = resolveTypedefVarType(ptrExprVarType, env);
  if (resolved == nullptr) {
    throw std::logic_error(
        "Pointer arithmetic requires a known expression type.");
  }

  if (resolved->isPointerType()) {
    return static_cast<AST::PointerType*>(resolved)->baseType_->getType(env);
  }
  if (resolved->isArrayType()) {
    return static_cast<AST::ArrayType*>(resolved)->baseType_->getType(env);
  }
  if (resolved->isStructType() || resolved->isUnionType()) {
    return resolved->getType(env);
  }

  throw std::logic_error("Pointer arithmetic requires pointer or array type.");
}

// Load/store element type from AST. Pointer lvalues use opaque ptr in IR;
// concrete struct/scalar types are returned for direct allocas and non-pointer
// locations.
llvm::Type* memoryAccessType(AST::VarType* lvalueVarType, TypeEnv& env) {
  AST::VarType* resolved = resolveTypedefVarType(lvalueVarType, env);
  if (resolved == nullptr) {
    throw std::logic_error("Load/store requires a known lvalue type.");
  }

  if (resolved->isArrayType()) {
    return resolved->getType(env);
  }
  // LLVM 20+: every pointer is the same opaque `ptr`, so storing through one
  // needs no pointee type here — the AST above is what remembers it.
  if (resolved->isPointerType()) {
    return llvm::PointerType::get(env.getContext(), 0);
  }

  return resolved->getType(env);
}

}  // namespace vartype
