#pragma once

#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>

#include <map>
#include <memory>
#include <string>
#include <vector>

#include "ast/BuiltinTypeId.hpp"

namespace AST {

class StructType;
class UnionType;
class VarType;

}  // namespace AST

class TypeEnv;

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

/// DWARF generation for -g, wrapping llvm::DIBuilder.
///
/// Unlike every other stage, this one is not a pass over the module. It runs
/// *interleaved* with the AST walk: CodeGenerator constructs it before
/// genCode(), each node that creates a function, scope, or local variable calls
/// in as it is lowered, and the accumulated metadata is only sealed at the end.
/// That is why debug info does not appear as a box in the stage diagram —
/// see docs/Architecture.md.
///
/// The required call order, and what goes wrong otherwise:
///
///   1. initialize(sourcePath)   creates the DWARF compile unit. Nothing else
///                               works before this; other calls no-op.
///   2. setTypeEnv(env)          struct/union DI reads AST field lists and
///                               materializes member types, which needs the
///                               type environment. Without it, aggregates
///                               degrade to opaque basic types rather than
///                               failing loudly.
///   3. createFunction / createLexicalBlock / setLocation / declareAlloca
///                               called during the walk, in source order.
///   4. finalize()               resolves temporary metadata nodes. Skipping it
///                               leaves the module failing the LLVM verifier;
///                               it must run after all IR is emitted and before
///                               the backend, which driver/Pipeline.cpp does.
///
/// Why lcc's DWARF is tied to -O0: the debug story here is dbg.declare on
/// entry-block allocas. Once mem2reg promotes those allocas to SSA registers
/// the declares are stale, and recovering locations then needs dbg.value
/// salvaging, which lcc does not implement. That is the whole reason -g blanks
/// -O.
///
/// llvmTypeCache_, structTypeCache_ and unionTypeCache_ are not just an
/// optimization. DWARF composite types must be emitted once and referenced
/// thereafter; building a second DIType for the same struct produces duplicate,
/// conflicting type entries in the .o.
///
/// Only getOrCreateDIType, getOrCreateStructDIType and getOrCreateUnionDIType
/// consult one. The basic-type helpers keep the getOrCreate prefix for symmetry
/// but build a fresh DIType every call, which is harmless: LLVM uniques basic
/// types, and it is the struct and union types that must not be duplicated.
class DebugInfoBuilder {
 public:
  explicit DebugInfoBuilder(llvm::Module& module);
  ~DebugInfoBuilder();

  /// Step 1: create the DWARF compile unit. sourcePath is the user's -i path,
  /// so that a debugger resolves the original .c file rather than anything lcc
  /// generated. Idempotent.
  void initialize(const std::string& sourcePath);

  /// Step 2: supply the type environment. Struct/union DI needs AST field lists
  /// and getType(); set this before the first declareAlloca.
  void setTypeEnv(TypeEnv* env);

  /// A DWARF subprogram: the debugger's notion of "a function". Returns the
  /// scope that this function's statements and locals attach to.
  llvm::DISubprogram* createFunction(
      llvm::Function* func, const std::string& name, unsigned line,
      llvm::FunctionType* funcType, AST::VarType* retVarType,
      const std::vector<AST::VarType*>& paramVarTypes);

  /// Stamp a source position on everything the builder emits next. This is what
  /// makes stepping work, so it is called per statement, not per function.
  void setLocation(llvm::IRBuilder<>& builder, unsigned line,
                   llvm::DIScope* scope, unsigned col = 1);

  /// A nested { } scope, so a shadowed name resolves to the right variable at
  /// each point in the function.
  llvm::DIScope* createLexicalBlock(llvm::DIScope* parent, unsigned line,
                                    unsigned col);

  /// Bind a local or parameter to its storage via dbg.declare. paramArgNo is
  /// 1-based for parameters and 0 for ordinary locals — DWARF needs the
  /// distinction to print a frame's arguments in declaration order.
  void declareAlloca(llvm::AllocaInst* alloca, llvm::DIScope* scope,
                     const std::string& name, llvm::Type* llvmType,
                     AST::VarType* varType, unsigned line, unsigned col,
                     unsigned paramArgNo = 0);

  /// Step 4: seal the metadata. Required; see the call-order note above.
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
  std::unique_ptr<llvm::DIBuilder> dib_;
  llvm::DICompileUnit* compileUnit_ = nullptr;
  llvm::DIFile* file_ = nullptr;
  bool initialized_ = false;
  TypeEnv* typeEnv_ = nullptr;
  std::map<llvm::Type*, llvm::DIType*> llvmTypeCache_;
  std::map<AST::StructType*, llvm::DIType*> structTypeCache_;
  std::map<AST::UnionType*, llvm::DIType*> unionTypeCache_;
};
