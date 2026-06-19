#pragma once

#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>

#include <map>
#include <memory>
#include <string>
#include <vector>

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

class Module;
class DataLayout;

}  // namespace llvm

class DebugInfoBuilder;

// Owns one translation unit's LLVM state: Context, Module, IRBuilder, and
// symbol tables. AST nodes call back here for name lookup and for builder access.
class CodeGenerator {
 public:
  CodeGenerator();
  ~CodeGenerator();

  llvm::LLVMContext& getContext() { return context_; }
  llvm::IRBuilder<>& getBuilder() { return builder_; }
  llvm::Module& getModule() { return *module_; }

  // Push a scoped symbol table (block, function body, if-branch, loop body).
  // Lookup walks from innermost to outermost on the stack.
  void pushSymbolTable();

  // Pop symbol table from stack.
  void popSymbolTable();

  llvm::TypeSize getTypeSize(llvm::Type* type);

  // Find type from stack of symbol tables
  llvm::Type* findType(const std::string& typeName);

  // Add type to the current symbol table.
  // Return false if the same type already exists in the current symbol table.
  bool addType(const std::string& typeName, llvm::Type* type);

  // Resolve a typedef alias to its underlying AST VarType (innermost scope wins).
  AST::VarType* findTypedefAlias(const std::string& aliasName);

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
  bool addConstant(const std::string& varName, llvm::Value* var);

  // Map llvm::StructType* to AST::StructType* by using StructTypeTable.
  AST::StructType* findStructType(llvm::StructType* type);

  // Add pair <llvm::StructType*, AST::StructType*> to map StructTypeTable.
  bool addStructType(llvm::StructType* llvmType, AST::StructType* astType);

  // Map llvm::StructType* to AST::UnionType* by using UnionTypeTable.
  AST::UnionType* findUnionType(llvm::StructType* type);

  // Add pair <llvm::StructType*, AST::UnionType*> to map UnionTypeTable.
  bool addUnionType(llvm::StructType* llvmType, AST::UnionType* astType);

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

  // Take AST as input to generate IR code.
  void genIrCode(AST::Program* root, const std::string& optimizationLevel = "",
                 bool generateDebugInfo = false,
                 const std::string& sourcePath = "");

  bool isDebugInfoEnabled() const { return debugInfo_ != nullptr; }
  DebugInfoBuilder* debugInfo() { return debugInfo_.get(); }

  // Attach the node's source line to the next IR instructions (-g, inside a function).
  void setDebugLocation(const AST::SourceLoc& loc);

  void declareDebugAlloca(llvm::AllocaInst* alloca, const std::string& name,
                          llvm::Type* llvmType, AST::VarType* varType,
                          const AST::SourceLoc& loc,
                          unsigned paramArgNo = 0);  // 1-based for params; 0 = local

  // Generate object code for target architecture.
  void genObjectCode(const std::string& fileName);

  // Dump LLVM IR to file.
  void dumpIrCode(const std::string& fileName);

 private:
  // Optimize by option -O0, -O1, -O2, -O3, -Os, -Oz
  void optimizeCode(const std::string& optimizationLevel);

  // Must be declared before module_. C++ initializes members in declaration
  // order; llvm::Module and llvm::IRBuilder require a live LLVMContext.
  llvm::LLVMContext context_;
  llvm::IRBuilder<> builder_;
  // Top-level container for all LLVM IR in this compilation unit.
  llvm::Module* module_;

  // llvm::DataLayout manages how data is organized for a specific target
  // architecture. It's like a blueprint that describes how different types of
  // data should be arranged and sized in memory.
  llvm::DataLayout* dataLayout_;

  // One map stores functions, types, variables, and constants (see SymbolType).
  class Symbol {
   public:
    Symbol() : content_(nullptr), type_(SymbolType::UNDEFINED) {}
    Symbol(llvm::Function* func)
        : content_(func), type_(SymbolType::FUNCTION) {}
    Symbol(llvm::Type* type) : content_(type), type_(SymbolType::TYPE) {}
    Symbol(llvm::Value* value, bool isConst, AST::VarType* varType = nullptr)
        : content_(value),
          type_(isConst ? SymbolType::CONSTANT : SymbolType::VARIABLE),
          varType_(varType) {}

    llvm::Function* getFunction() {
      return type_ == SymbolType::FUNCTION ? (llvm::Function*)content_
                                           : nullptr;
    }

    llvm::Type* getType() {
      return type_ == SymbolType::TYPE ? (llvm::Type*)content_ : nullptr;
    }

    llvm::Value* getVariable() {
      return type_ == SymbolType::VARIABLE ? (llvm::Value*)content_ : nullptr;
    }

    llvm::Value* getConstant() {
      return type_ == SymbolType::CONSTANT ? (llvm::Value*)content_ : nullptr;
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
};