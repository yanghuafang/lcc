#pragma once

#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>

#include <map>
#include <string>
#include <vector>

namespace AST {

class Program;
class StructType;
class UnionType;

}  // namespace AST

namespace llvm {

class TypeSize;
class Type;
class Value;
class StructType;
class Function;
class BasicBlock;

class Module;
class DataLayout;

}  // namespace llvm

// llvm::LLVMContext serves as a container for core global data of LLVM's
// infrastructure.
// It manages essential LLVM data structures, including type unique and constant
// uniquing tables.
extern llvm::LLVMContext g_context;

// llvm::IRBuilder is a helper to generate LLVM IR code.
// It provides a high-level API for creating and inserting LLVM IR instructions.
//  - Insertion Point Tracking: It keeps track of the current insertion point
//  within a module, function or basic block.
//  - Instruction Creation: It offers methods to create various LLVM
//  instructions, such as arithmetic operations, control flow, memory
//  operations, and function calls.
//  - Type Management: It works with LLVM's type system, allowing easy creation
//  of typed instructions and constant.
extern llvm::IRBuilder<> g_builder;

class CodeGenerator {
 public:
  // llvm::Module serves as the top-level container for all LLVM IR objects.
  // A llvm::Module instance contains:
  //  - Global variables
  //  - Functions
  //  - Symbol table entries
  //  - Libraries or other modules it depends on
  //  - Target specific data
  // llvm::Module are associated with an llvm::LLVMContext, from which types and
  // constants are allocated.
  llvm::Module* module_;

  CodeGenerator();
  ~CodeGenerator();

  // Create and push an empty symbol table to stack.
  void pushSymbolTable();

  // Pop symbol table from stack.
  void popSymbolTable();

  llvm::TypeSize getTypeSize(llvm::Type* type);

  // Find type from stack of symbol tables
  llvm::Type* findType(const std::string& typeName);

  // Add type to the current symbol table.
  // Return false if the same type already exists in the current symbol table.
  bool addType(const std::string& typeName, llvm::Type* type);

  // Find variable from stack of symbol tables.
  llvm::Value* findVariable(const std::string& varName);

  // Add variable to the current symbol table.
  // Return false if the same variable already exists in the current symbol
  // table.
  bool addVariable(const std::string& varName, llvm::Value* var);

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

  // Get the destination block of the continue block on top of continue stack.
  llvm::BasicBlock* getContinueBlock();

  // Get the destination block of the break block on top of break stack.
  llvm::BasicBlock* getBreakBlock();

  // Switch insert point to global block for global variable declaration.
  void switchInsertPointToGlobalBlock();

  // Switch insert point back to current local block.
  void switchInsertPointToCurrentBlock();

  // Take AST as input to generate IR code.
  void genIrCode(AST::Program* root, const std::string& optimizationLevel = "");

  // Generate object code for target architecture.
  void genObjectCode(const std::string& fileName);

  // Dump LLVM IR to file.
  void dumpIrCode(const std::string& fileName);

 private:
  // Optimize by option -O0, -O1, -O2, -O3, -Os, -Oz
  void optimizeCode(const std::string& optimizationLevel);

  class Symbol {
   public:
    Symbol() : content_(NULL), type_(SymbolType::UNDEFINED) {}
    Symbol(llvm::Function* func)
        : content_(func), type_(SymbolType::FUNCTION) {}
    Symbol(llvm::Type* type) : content_(type), type_(SymbolType::TYPE) {}
    Symbol(llvm::Value* value, bool isConst)
        : content_(value),
          type_(isConst ? SymbolType::CONSTANT : SymbolType::VARIABLE) {}

    llvm::Function* getFunction() {
      return type_ == SymbolType::FUNCTION ? (llvm::Function*)content_ : NULL;
    }

    llvm::Type* getType() {
      return type_ == SymbolType::TYPE ? (llvm::Type*)content_ : NULL;
    }

    llvm::Value* getVariable() {
      return type_ == SymbolType::VARIABLE ? (llvm::Value*)content_ : NULL;
    }

    llvm::Value* getConstant() {
      return type_ == SymbolType::CONSTANT ? (llvm::Value*)content_ : NULL;
    }

   private:
    enum SymbolType { UNDEFINED = 0, FUNCTION, TYPE, VARIABLE, CONSTANT };

    SymbolType type_;
    void* content_;
  };

  using SymbolTable = std::map<std::string, Symbol>;

  using StructTypeTable = std::map<llvm::StructType*, AST::StructType*>;
  using UnionTypeTable = std::map<llvm::StructType*, AST::UnionType*>;

  // llvm::DataLayout manages how data is organized for a specific target
  // architecture. It's like a blueprint that describes how different types of
  // data should be arranged and sized in memory.
  llvm::DataLayout* dataLayout_;

  std::vector<SymbolTable*> symbolTableStack_;
  StructTypeTable* structTypeTable_;
  UnionTypeTable* unionTypeTable_;

  // To store target block for continue statement.
  std::vector<llvm::BasicBlock*> continueBlockStack_;
  // To store target block for break statement.
  std::vector<llvm::BasicBlock*> breakBlockStack_;

  // Be used to switch insert point to global block.
  llvm::BasicBlock* globalBlock_;
  llvm::Function* globalFunc_;
  // Be used to switch insert point back to local current block.
  llvm::BasicBlock* currentBlock_;
  llvm::Function* currentFunc_;
};