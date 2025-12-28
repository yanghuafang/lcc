#include "irgen/SymbolTable.hpp"

#include <cstddef>
#include <string>
#include <vector>

// See irgen/SymbolTable.hpp for the two-stack layout and why the aggregate
// registries sit outside it. Every find* below is the same innermost-outward
// walk; the comment on findType explains the iterator form they all share.

void SymbolTable::pushScope() {
  scopeStack_.emplace_back();
  typedefScopeStack_.emplace_back();
}

void SymbolTable::popScope() {
  if (scopeStack_.empty()) {
    return;
  }

  scopeStack_.pop_back();

  if (!typedefScopeStack_.empty()) {
    typedefScopeStack_.pop_back();
  }
}

// Innermost scope first. Reverse iterators rather than `end() - 1` walking down
// to `begin()`: that form has to step one past begin() to end the loop, and
// forming an iterator before the first element is undefined even when it is
// never dereferenced. rbegin()/rend() expresses the same walk with no
// out-of-range iterator in it, and needs no empty-stack guard either.
llvm::Type* SymbolTable::findType(const std::string& typeName) {
  for (auto iter = scopeStack_.rbegin(); iter != scopeStack_.rend(); ++iter) {
    auto pairIter = iter->find(typeName);
    if (pairIter != iter->end()) {
      return pairIter->second.getType();
    }
  }

  return nullptr;
}

bool SymbolTable::addType(const std::string& typeName, llvm::Type* type) {
  if (scopeStack_.empty()) {
    return false;
  }

  Scope& topScope = scopeStack_.back();
  if (topScope.find(typeName) != topScope.end()) {
    // Type already exists!
    return false;
  }

  topScope[typeName] = Symbol(type);
  return true;
}

AST::VarType* SymbolTable::findTypedefAlias(const std::string& aliasName) {
  for (auto iter = typedefScopeStack_.rbegin();
       iter != typedefScopeStack_.rend(); ++iter) {
    auto pairIter = iter->find(aliasName);
    if (pairIter != iter->end()) {
      return pairIter->second;
    }
  }

  return nullptr;
}

bool SymbolTable::addTypedefAlias(const std::string& aliasName,
                                  AST::VarType* varType) {
  if (typedefScopeStack_.empty()) {
    return false;
  }

  TypedefScope& topTable = typedefScopeStack_.back();
  if (topTable.find(aliasName) != topTable.end()) {
    return false;
  }

  topTable[aliasName] = varType;
  return true;
}

bool SymbolTable::hasTypedefAliasInCurrentScope(
    const std::string& aliasName) const {
  if (typedefScopeStack_.empty()) {
    return false;
  }

  const TypedefScope& topTable = typedefScopeStack_.back();
  return topTable.find(aliasName) != topTable.end();
}

llvm::Value* SymbolTable::findVariable(const std::string& varName) {
  for (auto iter = scopeStack_.rbegin(); iter != scopeStack_.rend(); ++iter) {
    auto pairIter = iter->find(varName);
    if (pairIter != iter->end()) {
      return pairIter->second.getVariable();
    }
  }

  return nullptr;
}

bool SymbolTable::addVariable(const std::string& varName, llvm::Value* var,
                              AST::VarType* varType) {
  if (scopeStack_.empty()) {
    return false;
  }

  Scope& topScope = scopeStack_.back();
  if (topScope.find(varName) != topScope.end()) {
    // Variable already exists!
    return false;
  }

  if (hasTypedefAliasInCurrentScope(varName)) {
    return false;
  }

  topScope[varName] = Symbol(var, false, varType);
  return true;
}

AST::VarType* SymbolTable::findVariableType(const std::string& varName) {
  for (auto iter = scopeStack_.rbegin(); iter != scopeStack_.rend(); ++iter) {
    auto pairIter = iter->find(varName);
    if (pairIter != iter->end()) {
      return pairIter->second.getVarType();
    }
  }

  return nullptr;
}

void SymbolTable::setFuncSignature(
    const std::string& funcName, AST::VarType* retType,
    const std::vector<AST::VarType*>& paramTypes) {
  funcRetTypes_[funcName] = retType;
  funcParamTypes_[funcName] = paramTypes;
}

AST::VarType* SymbolTable::findFuncRetType(const std::string& funcName) {
  auto iter = funcRetTypes_.find(funcName);
  if (iter != funcRetTypes_.end()) {
    return iter->second;
  }

  return nullptr;
}

AST::VarType* SymbolTable::findFuncParamType(const std::string& funcName,
                                             size_t index) {
  auto iter = funcParamTypes_.find(funcName);
  if (iter == funcParamTypes_.end() || index >= iter->second.size()) {
    return nullptr;
  }

  return iter->second[index];
}

llvm::Value* SymbolTable::findConstant(const std::string& varName) {
  for (auto iter = scopeStack_.rbegin(); iter != scopeStack_.rend(); ++iter) {
    auto pairIter = iter->find(varName);
    if (pairIter != iter->end()) {
      return pairIter->second.getConstant();
    }
  }

  return nullptr;
}

bool SymbolTable::addConstant(const std::string& varName, llvm::Value* var) {
  if (scopeStack_.empty()) {
    return false;
  }

  Scope& topScope = scopeStack_.back();
  if (topScope.find(varName) != topScope.end()) {
    // Variable already exists!
    return false;
  }

  topScope[varName] = Symbol(var, true);
  return true;
}

AST::StructType* SymbolTable::findStructType(llvm::StructType* type) {
  auto pairIter = structTypeTable_.find(type);
  if (pairIter != structTypeTable_.end()) {
    return pairIter->second;
  }

  return nullptr;
}

bool SymbolTable::addStructType(llvm::StructType* llvmType,
                                AST::StructType* astType) {
  // try_emplace leaves an existing entry alone and says so, which is exactly
  // the find-then-insert this used to spell out in two lookups.
  return structTypeTable_.try_emplace(llvmType, astType).second;
}

AST::UnionType* SymbolTable::findUnionType(llvm::StructType* type) {
  auto pairIter = unionTypeTable_.find(type);
  if (pairIter != unionTypeTable_.end()) {
    return pairIter->second;
  }

  return nullptr;
}

bool SymbolTable::addUnionType(llvm::StructType* llvmType,
                               AST::UnionType* astType) {
  return unionTypeTable_.try_emplace(llvmType, astType).second;
}

llvm::Function* SymbolTable::findFunction(const std::string& funcName) {
  for (auto iter = scopeStack_.rbegin(); iter != scopeStack_.rend(); ++iter) {
    auto pairIter = iter->find(funcName);
    if (pairIter != iter->end()) {
      return pairIter->second.getFunction();
    }
  }

  return nullptr;
}

bool SymbolTable::addFunction(const std::string& funcName,
                              llvm::Function* func) {
  if (scopeStack_.empty()) {
    return false;
  }

  Scope& topScope = scopeStack_.back();
  if (topScope.find(funcName) != topScope.end()) {
    // funcName already exists!
    return false;
  }

  topScope[funcName] = Symbol(func);
  return true;
}
