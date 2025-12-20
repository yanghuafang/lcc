#pragma once

#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>

#include <map>
#include <memory>
#include <string>
#include <vector>

#include "types/TypeEnv.hpp"

namespace AST {

class Program;
class StructType;
class UnionType;
class VarType;
struct SourceLoc;

}  // namespace AST

namespace llvm {

class TypeSize;
class Type;
class Value;
class StructType;
class Function;
class BasicBlock;
class AllocaInst;
class DIScope;

class Module;
class DataLayout;

}  // namespace llvm

class DebugInfoBuilder;

// Owns one translation unit's LLVM state: Context, Module, IRBuilder, and
// symbol tables. AST nodes call back here for name lookup and for builder
// access.
//
// This is the context an AST walk runs against, and nothing more. It does not
// know that a middle end or a target backend exist — the phase ordering lives
// in driver/Pipeline.hpp, which is what keeps irgen/ dependent on only ast/ and
// types/.
//
// Implements TypeEnv, the narrow slice of this interface that AST type
// nodes need to turn themselves into llvm::Type (see types/TypeEnv.hpp).
//
// The API below is large because a single-pass compiler has nowhere else to put
// this state, but it is only four ideas:
//
// 1. LLVM plumbing — getContext / getBuilder / getModule. The IRBuilder always
//    has an insert point, so "where does this instruction land" is a property
//    of the generator, not a parameter.
//
// 2. Scoped name lookup. Two stacks of maps, pushed on entering a scope and
//    popped on leaving; every find* walks innermost-outward, so an inner
//    declaration shadows an outer one:
//
//      symbolTableStack_   variables, functions, types, enum constants — all
//                          four in one map, discriminated by Symbol's tag. A
//                          name therefore collides across those four kinds,
//                          which real C would allow to coexist.
//      typedefTableStack_  typedef aliases, kept separate so a typedef name and
//                          a variable of the same name do not collide.
//
//    Use ScopedSymbolTable rather than pairing push/pop by hand; an exception
//    thrown mid-walk would otherwise leave the stack unbalanced.
//
//    The struct/union tables are *not* part of this and are not scoped: they
//    map llvm::StructType* back to the AST node, so member access can recover
//    field names and offsets that the LLVM type no longer carries.
//
// 3. Where we are in the function being emitted — enterFunction/leaveFunction,
//    enterLoop/leaveLoop, enterSwitch/leaveSwitch. Loop and switch push their
//    target blocks onto stacks, which is precisely what makes `break` and
//    `continue` work: those nodes carry no target of their own, they read the
//    innermost enclosing one off these stacks. Nesting a loop inside a switch
//    inside a loop therefore needs no special handling.
//
// 4. Debug info — thin forwarding to DebugInfoBuilder, no-ops without -g, so
//    the walkers never branch on whether debug info is enabled.
//
// One structural quirk worth knowing: global initializers need an insert point
// even though they belong to no function, so buildModule() creates a throwaway
// function and block for them and erases it afterwards. That is what
// switchInsertPointToGlobalBlock / ...ToCurrentBlock switch between.
class CodeGenerator : public TypeEnv {
 public:
  CodeGenerator();
  ~CodeGenerator() override;

  llvm::LLVMContext& getContext() override { return context_; }
  llvm::IRBuilder<>& getBuilder() { return builder_; }
  llvm::Module& getModule() { return *module_; }

  // Push a scoped symbol table (block, function body, if-branch, loop body).
  // Lookup walks from innermost to outermost on the stack.
  void pushSymbolTable();

  // Pop symbol table from stack.
  void popSymbolTable();

  llvm::TypeSize getTypeSize(llvm::Type* type) override;

  // Find type from stack of symbol tables
  llvm::Type* findType(const std::string& typeName) override;

  // Add type to the current symbol table.
  // Return false if the same type already exists in the current symbol table.
  bool addType(const std::string& typeName, llvm::Type* type);

  // Resolve a typedef alias to its underlying AST VarType (innermost scope
  // wins).
  AST::VarType* findTypedefAlias(const std::string& aliasName) override;

  // Register a typedef alias in the current scope.
  // Return false if the alias already exists in the current scope.
  bool addTypedefAlias(const std::string& aliasName, AST::VarType* varType);

  // True when aliasName is a typedef in the innermost scope only.
  bool hasTypedefAliasInCurrentScope(const std::string& aliasName);

  // Find variable from stack of symbol tables.
  llvm::Value* findVariable(const std::string& varName);

  // Add variable to the current symbol table.
  // Return false if the same variable already exists in the current symbol
  // table.
  bool addVariable(const std::string& varName, llvm::Value* var,
                   AST::VarType* varType = nullptr);

  // Find C type of a variable from stack of symbol tables.
  AST::VarType* findVariableType(const std::string& varName);

  // Record function parameter/return C types for call-site casts.
  void setFuncSignature(const std::string& funcName, AST::VarType* retType,
                        const std::vector<AST::VarType*>& paramTypes);

  AST::VarType* findFuncRetType(const std::string& funcName);

  AST::VarType* findFuncParamType(const std::string& funcName, size_t index);

  // Find constant from stack of symbol tables.
  llvm::Value* findConstant(const std::string& varName);

  // Add constant to the current symbol table.
  // Return false if the same constant already exists in the current symbol
  // table.
  bool addConstant(const std::string& varName, llvm::Value* var) override;

  // Map llvm::StructType* to AST::StructType* by using StructTypeTable.
  AST::StructType* findStructType(llvm::StructType* type) override;

  // Add pair <llvm::StructType*, AST::StructType*> to map StructTypeTable.
  bool addStructType(llvm::StructType* llvmType,
                     AST::StructType* astType) override;

  // Map llvm::StructType* to AST::UnionType* by using UnionTypeTable.
  AST::UnionType* findUnionType(llvm::StructType* type) override;

  // Add pair <llvm::StructType*, AST::UnionType*> to map UnionTypeTable.
  bool addUnionType(llvm::StructType* llvmType,
                    AST::UnionType* astType) override;

  // Find function from stack of symbol tables.
  llvm::Function* findFunction(const std::string& funcName);

  // Add function to current symbol table.
  // Return false if the same function already exists in the current symbol
  // table.
  bool addFunction(const std::string& funcName, llvm::Function* func);

  // Get current function while parsing.
  llvm::Function* getCurrentFunction();

  void enterFunction(llvm::Function* func);

  void leaveFunction();

  // Push continue and break basic blocks to according stacks.
  void enterLoop(llvm::BasicBlock* continueBlock, llvm::BasicBlock* breakBlock);

  // Pop continue and break basic blocks from according stacks.
  void leaveLoop();

  // Push break target for switch (fall-through uses setSwitchFallthroughBlock).
  void enterSwitch(llvm::BasicBlock* breakBlock);

  // Pop switch break target from break stack.
  void leaveSwitch();

  // Set the fall-through target while generating the current case body.
  void setSwitchFallthroughBlock(llvm::BasicBlock* fallthroughBlock);

  // Fall-through target for the case body currently being generated.
  llvm::BasicBlock* getSwitchFallthroughBlock();

  // Get the destination block of the continue block on top of continue stack.
  llvm::BasicBlock* getContinueBlock();

  // Get the destination block of the break block on top of break stack.
  llvm::BasicBlock* getBreakBlock();

  // Switch insert point to global block for global variable declaration.
  void switchInsertPointToGlobalBlock();

  // Switch insert point back to current local block.
  void switchInsertPointToCurrentBlock();

  // Walk the AST and emit it into the module. This is the whole of irgen's
  // contribution: what happens to the module afterwards (middle end, object /
  // assembly emission) is sequenced by driver/Pipeline.hpp.
  void buildModule(AST::Program* root, bool generateDebugInfo = false,
                   const std::string& sourcePath = "");

  bool isDebugInfoEnabled() const { return debugInfo_ != nullptr; }
  DebugInfoBuilder* debugInfo() { return debugInfo_.get(); }

  // Attach the node's source line to the next IR instructions (-g, inside a
  // function).
  void setDebugLocation(const AST::SourceLoc& loc);

  // Nested { } scopes for DWARF lexical blocks (used by Block::genCode).
  void pushDebugLexicalBlock(const AST::SourceLoc& loc);
  void popDebugLexicalBlock();
  llvm::DIScope* getCurrentDebugScope();

  void declareDebugAlloca(
      llvm::AllocaInst* alloca, const std::string& name, llvm::Type* llvmType,
      AST::VarType* varType, const AST::SourceLoc& loc,
      unsigned paramArgNo = 0);  // 1-based for params; 0 = local

 private:
  // order; llvm::Module and llvm::IRBuilder require a live LLVMContext.
  llvm::LLVMContext context_;
  llvm::IRBuilder<> builder_;
  // Top-level container for all LLVM IR in this compilation unit.
  llvm::Module* module_;

  // One map stores functions, types, variables, and constants (see SymbolType).
  class Symbol {
   public:
    // Member init lists follow declaration order (type_ before content_),
    // which is the order C++ actually runs them in regardless of what is
    // written here. Harmless while no initializer reads another member, but
    // -Wreorder-ctor flags it because that stops being true silently.
    Symbol() : type_(SymbolType::UNDEFINED), content_(nullptr) {}
    Symbol(llvm::Function* func)
        : type_(SymbolType::FUNCTION), content_(func) {}
    Symbol(llvm::Type* type) : type_(SymbolType::TYPE), content_(type) {}
    Symbol(llvm::Value* value, bool isConst, AST::VarType* varType = nullptr)
        : type_(isConst ? SymbolType::CONSTANT : SymbolType::VARIABLE),
          content_(value),
          varType_(varType) {}

    llvm::Function* getFunction() {
      return type_ == SymbolType::FUNCTION
                 ? static_cast<llvm::Function*>(content_)
                 : nullptr;
    }

    llvm::Type* getType() {
      return type_ == SymbolType::TYPE ? static_cast<llvm::Type*>(content_)
                                       : nullptr;
    }

    llvm::Value* getVariable() {
      return type_ == SymbolType::VARIABLE ? static_cast<llvm::Value*>(content_)
                                           : nullptr;
    }

    llvm::Value* getConstant() {
      return type_ == SymbolType::CONSTANT ? static_cast<llvm::Value*>(content_)
                                           : nullptr;
    }

    AST::VarType* getVarType() { return varType_; }

   private:
    enum SymbolType { UNDEFINED = 0, FUNCTION, TYPE, VARIABLE, CONSTANT };

    SymbolType type_;
    void* content_;
    AST::VarType* varType_ = nullptr;
  };

  using SymbolTable = std::map<std::string, Symbol>;
  using TypedefTable = std::map<std::string, AST::VarType*>;

  // Map LLVM struct types back to AST nodes for member lookup (. and ->).
  using StructTypeTable = std::map<llvm::StructType*, AST::StructType*>;
  using UnionTypeTable = std::map<llvm::StructType*, AST::UnionType*>;

  std::vector<SymbolTable*> symbolTableStack_;
  std::vector<TypedefTable*> typedefTableStack_;
  StructTypeTable* structTypeTable_;
  UnionTypeTable* unionTypeTable_;

  // To store target block for continue statement.
  std::vector<llvm::BasicBlock*> continueBlockStack_;
  // To store target block for break statement.
  std::vector<llvm::BasicBlock*> breakBlockStack_;

  // Fall-through target for the switch case currently being lowered.
  llvm::BasicBlock* switchFallthroughBlock_ = nullptr;

  // Be used to switch insert point to global block.
  llvm::BasicBlock* globalBlock_;
  llvm::Function* globalFunc_;
  // Be used to switch insert point back to local current block.
  llvm::BasicBlock* currentBlock_;
  llvm::Function* currentFunc_;

  std::map<std::string, AST::VarType*> funcRetTypes_;
  std::map<std::string, std::vector<AST::VarType*>> funcParamTypes_;

  std::unique_ptr<DebugInfoBuilder> debugInfo_;
  std::vector<llvm::DIScope*> debugScopeStack_;
};

// RAII guards for the two scope stacks above. They live here rather than at the
// call sites so that the push/pop pairing is visible next to the stacks it
// balances, and so an exception during codegen cannot leave a scope pushed.

class ScopedSymbolTable {
 public:
  explicit ScopedSymbolTable(CodeGenerator& generator) : generator_(generator) {
    generator_.pushSymbolTable();
  }
  ~ScopedSymbolTable() { generator_.popSymbolTable(); }

  ScopedSymbolTable(const ScopedSymbolTable&) = delete;
  ScopedSymbolTable& operator=(const ScopedSymbolTable&) = delete;

 private:
  CodeGenerator& generator_;
};

class ScopedDebugLexicalBlock {
 public:
  ScopedDebugLexicalBlock(CodeGenerator& generator, const AST::SourceLoc& loc)
      : generator_(generator) {
    generator_.pushDebugLexicalBlock(loc);
  }
  ~ScopedDebugLexicalBlock() { generator_.popDebugLexicalBlock(); }

  ScopedDebugLexicalBlock(const ScopedDebugLexicalBlock&) = delete;
  ScopedDebugLexicalBlock& operator=(const ScopedDebugLexicalBlock&) = delete;

 private:
  CodeGenerator& generator_;
};