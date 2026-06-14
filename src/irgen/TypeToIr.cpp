#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>

#include <stdexcept>
#include <vector>

#include "ast/Nodes.hpp"
#include "types/BuiltinTypeMap.hpp"
#include "types/TypeEnv.hpp"

// AST types -> llvm::Type: getType() for each VarType node in ast/Nodes.hpp —
// builtin, pointer, array, struct, union, enum, and typedef alias.
//
// Materialization only; this file emits no instructions. The C type *rules*
// (promotion, usual arithmetic conversion) are types/TypeRules.hpp, and the
// queries asking what type a node denotes are types/VarTypeQuery.hpp.

namespace AST {

VarType* VarType::getMemberVarType(const std::string& memberName) const {
  (void)memberName;
  return nullptr;
}

VarType* StructType::getMemberVarType(const std::string& memberName) const {
  for (FieldDecl* decl : *structBody_) {
    for (const std::string& name : *decl->memberList_) {
      if (memberName == name) {
        return decl->varType_;
      }
    }
  }

  return nullptr;
}

VarType* UnionType::getMemberVarType(const std::string& memberName) const {
  for (FieldDecl* decl : *unionBody_) {
    for (const std::string& name : *decl->memberList_) {
      if (memberName == name) {
        return decl->varType_;
      }
    }
  }

  return nullptr;
}

llvm::Type* BuiltinType::getType(TypeEnv& env) {
  if (llvmType_ == nullptr) {
    llvmType_ = builtinmap::toLlvmType(typeId_, env.getContext());
  }

  return llvmType_;
}

llvm::Type* PointerType::getType(TypeEnv& env) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  // Materialize baseType_ for validation; LLVM pointer type is opaque (no
  // pointee in IR).
  baseType_->getType(env);
  llvmType_ = llvm::PointerType::get(env.getContext(), 0);
  return llvmType_;
}

llvm::Type* FuncPointerType::getType(TypeEnv& env) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  // Build the signature and throw it away. The variable holds an address, and
  // under opaque pointers that is the same `ptr` whatever it points at, so the
  // result is of no use here -- but building it is what makes an unknown
  // parameter or return type an error at the declaration instead of at the
  // first call through the pointer. The cast is because getFuncType is
  // [[nodiscard]] for its real callers, which do want what it returns.
  (void)getFuncType(env);
  llvmType_ = llvm::PointerType::get(env.getContext(), 0);
  return llvmType_;
}

llvm::FunctionType* FuncPointerType::getFuncType(TypeEnv& env) const {
  std::vector<llvm::Type*> paramTypes;
  bool hasVoidParamType = false;
  for (Param* param : *paramList_) {
    llvm::Type* type = param->varType_->getType(env);
    if (type == nullptr) {
      throw std::logic_error(
          "Function pointer has a parameter of unknown type!");
    }

    if (type->isVoidTy()) {
      hasVoidParamType = true;
    }

    // An array parameter decays to a pointer, exactly as in FuncDecl::genCode:
    // the two signatures have to agree or a call through the pointer would not
    // match the function it holds.
    if (type->isArrayTy()) {
      type = llvm::PointerType::get(env.getContext(), 0);
    }

    paramTypes.push_back(type);
  }

  // `(void)` spells an empty parameter list, and only on its own.
  if (paramTypes.size() >= 2 && hasVoidParamType) {
    throw std::logic_error("Function pointer has an invalid void parameter!");
  }
  if (paramTypes.size() == 1 && hasVoidParamType) {
    paramTypes.clear();
  }

  llvm::Type* retType = returnType_->getType(env);
  if (retType == nullptr) {
    throw std::logic_error("Function pointer has an unknown return type!");
  }
  if (retType->isArrayTy()) {
    throw std::logic_error("Function pointer should not return array type!");
  }

  return llvm::FunctionType::get(retType, paramTypes, paramList_->isVariant_);
}

llvm::Type* ArrayType::getType(TypeEnv& env) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  llvm::Type* baseType = baseType_->getType(env);
  if (baseType->isVoidTy()) {
    throw std::logic_error("Array of void is not allowed!");
  }
  llvmType_ = llvm::ArrayType::get(baseType, length_);
  return llvmType_;
}

llvm::Type* DefinedType::getType(TypeEnv& env) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  VarType* alias = env.findTypedefAlias(typeName_);
  // Self-referential typedef (alias == this): resolve via findType(tag), not
  // the alias chain.
  if (alias != nullptr && alias != this) {
    llvmType_ = alias->getType(env);
    if (llvmType_ == nullptr) {
      throw std::logic_error("Type " + typeName_ + " is undefined!");
    }
    return llvmType_;
  }

  llvmType_ = env.findType(typeName_);
  if (llvmType_ == nullptr) {
    throw std::logic_error("Type " + typeName_ + " is undefined!");
  }
  return llvmType_;
}

llvm::Type* StructType::getType(TypeEnv& env) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  genTypeHead(env);
  return genTypeBody(env);
}

llvm::Type* StructType::genTypeHead(TypeEnv& env, const std::string& typeName) {
  llvm::StructType* type =
      llvm::StructType::create(env.getContext(), "struct." + typeName);
  // Record the AST<->LLVM pairing: member access later needs field names and
  // offsets, which the llvm::StructType alone does not carry.
  env.addStructType(type, this);
  llvmType_ = type;
  return llvmType_;
}

llvm::Type* StructType::genTypeBody(TypeEnv& env) {
  std::vector<llvm::Type*> members;
  for (FieldDecl* field : *structBody_) {
    if (field->varType_->getType(env)->isVoidTy()) {
      throw std::logic_error("Struct member type cannot be void!");
    }
    members.insert(members.end(), field->memberList_->size(),
                   field->varType_->getType(env));
  }

  llvm::cast<llvm::StructType>(llvmType_)->setBody(members);
  return llvmType_;
}

size_t StructType::getMemberIndex(const std::string& memberName) const {
  size_t index = 0;
  for (FieldDecl* decl : *structBody_) {
    for (const std::string& name : *decl->memberList_) {
      if (memberName == name) {
        return index;
      }

      ++index;
    }
  }

  // Not found. size_t(-1) is the sentinel; genStructMemberPtr in
  // irgen/ExprToIr.cpp tests for it.
  return -1;
}

llvm::Type* UnionType::getType(TypeEnv& env) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  genTypeHead(env);
  return genTypeBody(env);
}

llvm::Type* UnionType::genTypeHead(TypeEnv& env, const std::string& typeName) {
  llvm::StructType* type =
      llvm::StructType::create(env.getContext(), "union." + typeName);
  env.addUnionType(type, this);
  llvmType_ = type;
  return llvmType_;
}

llvm::Type* UnionType::genTypeBody(TypeEnv& env) {
  if (unionBody_->empty()) {
    return llvmType_;
  }

  // LLVM has no union type; model a union as a one-field struct holding its
  // largest member. Members alias this shared storage and are reinterpreted at
  // each access (see genStructMemberPtr).
  size_t maxSize = 0;
  llvm::Type* maxSizeMemberType = nullptr;
  for (FieldDecl* member : *unionBody_) {
    if (member->varType_->getType(env)->isVoidTy()) {
      throw std::logic_error("Union member type cannot be void!");
    }
    if (env.getTypeSize(member->varType_->getType(env)) > maxSize) {
      maxSizeMemberType = member->varType_->getType(env);
      maxSize = env.getTypeSize(maxSizeMemberType);
    }
  }

  llvm::cast<llvm::StructType>(llvmType_)->setBody(
      std::vector<llvm::Type*>({maxSizeMemberType}));
  return llvmType_;
}

llvm::Type* UnionType::getMemberType(const std::string& memberName,
                                     TypeEnv& env) const {
  for (FieldDecl* member : *unionBody_) {
    for (const std::string& name : *member->memberList_) {
      if (name == memberName) {
        return member->varType_->getType(env);
      }
    }
  }

  return nullptr;
}

// The one getType() here that fills no llvmType_, so the guard below never
// fires and the body runs on every call. Nothing calls it twice today — a
// TypeDecl materializes its enum once — but a second call would re-add every
// member and throw on the redefinition.
llvm::Type* EnumType::getType(TypeEnv& env) {
  if (llvmType_ != nullptr) {
    return llvmType_;
  }

  // C11 6.7.2.2p3: a member with no `=` takes one more than the member
  // before it, whether that one was explicit or implied.
  int lastDefValue = -1;
  for (Enum* member : *enumList_) {
    if (member->hasValue_) {
      lastDefValue = member->value_;
    } else {
      member->value_ = ++lastDefValue;
    }
  }

  llvm::Type* int32Ty = llvm::Type::getInt32Ty(env.getContext());
  for (Enum* member : *enumList_) {
    if (!env.addConstant(member->name_,
                         llvm::ConstantInt::get(
                             int32Ty, static_cast<uint32_t>(member->value_)))) {
      throw std::logic_error("It is not allowed to redefine enum member " +
                             member->name_);
    }
  }

  return llvm::IntegerType::getInt32Ty(env.getContext());
}

}  // namespace AST
