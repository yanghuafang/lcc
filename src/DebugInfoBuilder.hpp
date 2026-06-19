#pragma once

#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>

#include <string>
#include <vector>

namespace llvm {

class DIBuilder;
class DICompileUnit;
class DIFile;
class DISubprogram;
class DIType;
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

  llvm::DISubprogram* createFunction(llvm::Function* func,
                                     const std::string& name, unsigned line,
                                     llvm::FunctionType* funcType);

  void setLocation(llvm::IRBuilder<>& builder, unsigned line,
                   llvm::DISubprogram* subprogram, unsigned col = 1);

  void finalize();

 private:
  llvm::DIType* getOrCreateLlvmType(llvm::Type* type);
  llvm::DIType* getOrCreateVoidType();

  llvm::Module& module_;
  llvm::LLVMContext& context_;
  llvm::DIBuilder* dib_;
  llvm::DICompileUnit* compileUnit_;
  llvm::DIFile* file_;
  bool initialized_;
};
