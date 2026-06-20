#pragma once

#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>

#include "Types.hpp"

#include <map>
#include <string>
#include <vector>

namespace AST {

class StructType;
class UnionType;
class VarType;

}  // namespace AST

class CodeGenerator;

namespace llvm {

class DIBuilder;
class DICompileUnit;
class DIFile;
class DISubprogram;
class DIScope;
class DIType;
class AllocaInst;
class Function;
class FunctionType;
class Type;

}  // namespace llvm

// LLVM DIBuilder wrapper for lcc -g. Embeds DWARF in the .o via module metadata;
// finalize() must run after IR emission and before genObjectCode().
class DebugInfoBuilder {
 public:
  explicit DebugInfoBuilder(llvm::Module& module);
  ~DebugInfoBuilder();

  void initialize(const std::string& sourcePath);
  // Struct/union DI needs AST field lists and getType(); set before declareAlloca.
  void setCodeGenerator(CodeGenerator* generator);

  llvm::DISubprogram* createFunction(llvm::Function* func,
                                     const std::string& name, unsigned line,
                                     llvm::FunctionType* funcType,
                                     AST::VarType* retVarType,
                                     const std::vector<AST::VarType*>& paramVarTypes);

  void setLocation(llvm::IRBuilder<>& builder, unsigned line, llvm::DIScope* scope,
                   unsigned col = 1);

  llvm::DIScope* createLexicalBlock(llvm::DIScope* parent, unsigned line,
                                     unsigned col);

  // dbg.declare on entry-block allocas so LLDB can show params/locals (-O0).
  void declareAlloca(llvm::AllocaInst* alloca, llvm::DIScope* scope,
                     const std::string& name, llvm::Type* llvmType,
                     AST::VarType* varType, unsigned line, unsigned col,
                     unsigned paramArgNo = 0);

  void finalize();

 private:
  llvm::DIType* getOrCreateDIType(llvm::Type* llvmType, AST::VarType* varType);
  llvm::DIType* getOrCreateLlvmType(llvm::Type* type);
  llvm::DIType* getOrCreateStructDIType(AST::StructType* structType);
  llvm::DIType* getOrCreateUnionDIType(AST::UnionType* unionType);
  llvm::DIType* getOrCreateBuiltinDIType(AST::BuiltinTypeId typeId);
  llvm::DIType* getOrCreateVoidType();
  void insertAllocaDeclare(llvm::AllocaInst* alloca,
                           llvm::DILocalVariable* variable, unsigned line,
                           unsigned col, llvm::DIScope* scope);

  llvm::Module& module_;
  llvm::LLVMContext& context_;
  llvm::DIBuilder* dib_;
  llvm::DICompileUnit* compileUnit_;
  llvm::DIFile* file_;
  bool initialized_;
  CodeGenerator* codeGenerator_;
  std::map<llvm::Type*, llvm::DIType*> llvmTypeCache_;
  std::map<AST::StructType*, llvm::DIType*> structTypeCache_;
  std::map<AST::UnionType*, llvm::DIType*> unionTypeCache_;
};
