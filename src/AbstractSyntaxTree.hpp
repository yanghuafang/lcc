#pragma once

#include <stddef.h>

#include <functional>
#include <string>
#include <vector>

class CodeGenerator;

namespace llvm {

class Value;
class Type;

}  // namespace llvm

// Abstract Syntax Tree for lcc (single-pass compilation):
//   Lexer.l / Parser.y  ->  AST nodes in namespace AST
//   node::genCode()     ->  LLVM IR via CodeGenerator and Utils
//   node::genGraph()    ->  Graphviz DOT fragments (assembled by Visualizer)
//
// There is no separate semantic-analysis pass. getExprTypeId() and
// getExprVarType() supply C type information while genCode() emits IR.

// Class declaration
namespace AST {

// Base class of AST nodes
class Node;

// Grammar Root
class Program;

// Declarations
class Decl;
using Decls = std::vector<Decl*>;

class FuncDecl;
class Param;
class ParamList;
class FuncBody;

class VarDecl;
class VarInit;
using VarList = std::vector<VarInit*>;

class TypeDecl;

// Variable Types
class VarType;
class BuiltinType;
class PointerType;
class ArrayType;
class DefinedType;

class StructType;
class UnionType;
class FieldDecl;
using FieldDecls = std::vector<FieldDecl*>;
using MemberList = std::vector<std::string>;

class EnumType;
class Enum;
using EnumList = std::vector<Enum*>;

// Statements
class Stmt;
using Stmts = std::vector<Stmt*>;

class IfStmt;

class SwitchStmt;
class CaseStmt;
using CaseStmtList = std::vector<CaseStmt*>;

class ForStmt;
class DoStmt;
class WhileStmt;

class ContinueStmt;
class BreakStmt;
class ReturnStmt;

class Block;

// Expressions
class Expr;

class Variable;

class Constant;
class ConstStr;

class CommaExpr;

class FuncCall;
using ExprList = std::vector<Expr*>;

class StructRef;
class StructDeref;

class Subscript;
class TypeCast;
class SizeOf;

class UnaryExpr;
class ThrowingUnaryExpr;
class UnaryPlus;
class UnaryMinus;
class PointerDeref;
class AddressOf;

class LhsRhsExpr;
class LhsRhsAssign;
class Assign;
class Add;
class Sub;
class Mul;
class Div;
class Mod;

class PostfixInc;
class PostfixDec;
class PrefixInc;
class PrefixDec;

class CompoundAssign;
class AddAssign;
class SubAssign;
class MulAssign;
class DivAssign;
class ModAssign;

class BitwiseAnd;
class BitwiseOr;
class BitwiseXor;
class BitwiseNot;

class BitwiseAndAssign;
class BitwiseOrAssign;
class BitwiseXorAssign;

class LeftShift;
class RightShift;

class LeftShiftAssign;
class RightShiftAssign;

class LogicAnd;
class LogicOr;
class LogicNot;

class LogicExpr;
class LogicEq;
class LogicNotEq;
class LogicLessThan;
class LogicLessEq;
class LogicGreaterThan;
class LogicGreaterEq;

class TernaryCondition;

}  // namespace AST

// Class definition
namespace AST {

// Base class of AST nodes
class Node {
 public:
  Node() {}
  ~Node() {}

  // Interface to generate IR code.
  virtual llvm::Value* genCode(CodeGenerator& generator) = 0;

  // Generate Graphviz DOT for this subtree (used by Visualizer only, not codegen).
  // Returns (rootNodeId, dotFragment).
  virtual std::pair<std::string, std::string> genGraph() = 0;
};

// Grammar Root
class Program : public Node {
 public:
  Decls* decls_;

  Program(Decls* decls) : decls_(decls) {}
  ~Program() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

// Stmt is the base of Decl, Block, and Expr so a Block can hold any of them.
// In C, a bare expression is a valid statement (expression statement), so Expr
// inherits Stmt even though expressions are also used inside larger expressions.
class Stmt : public Node {
 public:
  Stmt() {}
  ~Stmt() {}
};

// Declarations

class Decl : public Stmt {
 public:
  Decl() {}
  ~Decl() {}
};

class FuncDecl : public Decl {
 public:
  VarType* retType_;
  std::string funcName_;
  ParamList* paramList_;
  FuncBody* funcBody_;

  FuncDecl(VarType* retType, const std::string& funcName, ParamList* paramList,
           FuncBody* funcBody = nullptr)
      : retType_(retType),
        funcName_(funcName),
        paramList_(paramList),
        funcBody_(funcBody) {}
  ~FuncDecl() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

class Param : public Node {
 public:
  VarType* varType_;
  std::string varName_;

  Param(VarType* varType, const std::string& varName = "")
      : varType_(varType), varName_(varName) {}
  ~Param() {}

  // Code already generated in FuncDecl::genCode.
  llvm::Value* genCode(CodeGenerator& generator) override { return nullptr; }
  std::pair<std::string, std::string> genGraph() override;
};

class ParamList : public std::vector<Param*>, public Node {
 public:
  bool isVariant_;

  ParamList() : isVariant_(false) {}
  ~ParamList() {}

  // Code already generated in FuncDecl::genCode.
  llvm::Value* genCode(CodeGenerator& generator) override { return nullptr; }
  std::pair<std::string, std::string> genGraph() override;

  void setVariant() { isVariant_ = true; }
};

class FuncBody : public Node {
 public:
  Stmts* content_;

  FuncBody(Stmts* content) : content_(content) {}
  ~FuncBody() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

class VarDecl : public Decl {
 public:
  VarType* varType_;
  VarList* varList_;

  VarDecl(VarType* varType, VarList* varList)
      : varType_(varType), varList_(varList) {}
  ~VarDecl() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

class VarInit : public Node {
 public:
  std::string varName_;
  Expr* initialExpr_;

  VarInit(const std::string& varName, Expr* initialExpr = nullptr)
      : varName_(varName), initialExpr_(initialExpr) {}
  ~VarInit() {}

  llvm::Value* genCode(CodeGenerator& generator) override { return nullptr; }
  std::pair<std::string, std::string> genGraph() override;
};

class TypeDecl : public Decl {
 public:
  VarType* varType_;

  TypeDecl(VarType* varType) : varType_(varType) {}
  ~TypeDecl() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

// Variable Types

class VarType : public Node {
 public:
  bool isConst_;
  std::string typeName_;  // User defined type name.
  llvm::Type* llvmType_;

  VarType(const std::string& typeName)
      : isConst_(false), typeName_(typeName), llvmType_(nullptr) {}
  ~VarType() {}

  llvm::Value* genCode(CodeGenerator& generator) override { return nullptr; }

  virtual llvm::Type* getType(CodeGenerator& generator) = 0;

  virtual bool isBuiltinType() = 0;
  virtual bool isPointerType() = 0;
  virtual bool isArrayType() = 0;
  virtual bool isDefinedType() = 0;
  virtual bool isStructType() = 0;
  virtual bool isUnionType() = 0;
  virtual bool isEnumType() = 0;

  virtual VarType* getElementVarType() { return nullptr; }
  virtual VarType* getMemberVarType(const std::string& memberName);

  void setConst() { isConst_ = true; }
};

class BuiltinType : public VarType {
 public:
  enum TypeId {
    UNKNOWN = 0,
    CHAR,
    SHORT,
    INT,
    LONG,
    UCHAR,
    USHORT,
    UINT,
    ULONG,
    FLOAT,
    DOUBLE,
    BOOL,
    VOID
  };

  TypeId typeId_;

  BuiltinType(TypeId typeId, const std::string& typeName)
      : VarType(typeName), typeId_(typeId) {}
  ~BuiltinType() {}

  std::pair<std::string, std::string> genGraph() override;

  llvm::Type* getType(CodeGenerator& generator) override;

  bool isBuiltinType() override { return true; }
  bool isPointerType() override { return false; }
  bool isArrayType() override { return false; }
  bool isDefinedType() override { return false; }
  bool isStructType() override { return false; }
  bool isUnionType() override { return false; }
  bool isEnumType() override { return false; }
};

class PointerType : public VarType {
 public:
  VarType* baseType_;

  PointerType(VarType* baseType)
      : VarType(baseType->typeName_ + "*"), baseType_(baseType) {}
  ~PointerType() {}

  std::pair<std::string, std::string> genGraph() override;

  llvm::Type* getType(CodeGenerator& generator) override;

  bool isBuiltinType() override { return false; }
  bool isPointerType() override { return true; }
  bool isArrayType() override { return false; }
  bool isDefinedType() override { return false; }
  bool isStructType() override { return false; }
  bool isUnionType() override { return false; }
  bool isEnumType() override { return false; }

  VarType* getElementVarType() override { return baseType_; }
};

class ArrayType : public VarType {
 public:
  VarType* baseType_;
  size_t length_;

  ArrayType(VarType* baseType, size_t length)
      : VarType(baseType->typeName_ + "[" + std::to_string(length) + "]"),
        baseType_(baseType),
        length_(length) {}
  ~ArrayType() {}

  std::pair<std::string, std::string> genGraph() override;

  llvm::Type* getType(CodeGenerator& generator) override;

  bool isBuiltinType() override { return false; }
  bool isPointerType() override { return false; }
  bool isArrayType() override { return true; }
  bool isDefinedType() override { return false; }
  bool isStructType() override { return false; }
  bool isUnionType() override { return false; }
  bool isEnumType() override { return false; }

  VarType* getElementVarType() override { return baseType_; }
};

/* Identifier is name of user defined type */
class DefinedType : public VarType {
 public:
  DefinedType(const std::string& typeName) : VarType(typeName) {}
  ~DefinedType() {}

  std::pair<std::string, std::string> genGraph() override;

  llvm::Type* getType(CodeGenerator& generator) override;

  bool isBuiltinType() override { return false; }
  bool isPointerType() override { return false; }
  bool isArrayType() override { return false; }
  bool isDefinedType() override { return true; }
  bool isStructType() override { return false; }
  bool isUnionType() override { return false; }
  bool isEnumType() override { return false; }
};

class StructType : public VarType {
 public:
  FieldDecls* structBody_;

  StructType(FieldDecls* structBody, const std::string& structTypeName)
      : VarType(structTypeName), structBody_(structBody) {}
  ~StructType() {}

  std::pair<std::string, std::string> genGraph() override;

  llvm::Type* getType(CodeGenerator& generator) override;

  bool isBuiltinType() override { return false; }
  bool isPointerType() override { return false; }
  bool isArrayType() override { return false; }
  bool isDefinedType() override { return false; }
  bool isStructType() override { return true; }
  bool isUnionType() override { return false; }
  bool isEnumType() override { return false; }

  VarType* getMemberVarType(const std::string& memberName) override;

  llvm::Type* genTypeHead(CodeGenerator& generator,
                          const std::string& typeName = "anonymous");
  llvm::Type* genTypeBody(CodeGenerator& generator);
  size_t getMemberIndex(const std::string& memberName);
};

class UnionType : public VarType {
 public:
  FieldDecls* unionBody_;

  UnionType(FieldDecls* unionBody, const std::string& unionTypeName)
      : VarType(unionTypeName), unionBody_(unionBody) {}
  ~UnionType() {}

  std::pair<std::string, std::string> genGraph() override;

  llvm::Type* getType(CodeGenerator& generator) override;

  bool isBuiltinType() override { return false; }
  bool isPointerType() override { return false; }
  bool isArrayType() override { return false; }
  bool isDefinedType() override { return false; }
  bool isStructType() override { return false; }
  bool isUnionType() override { return true; }
  bool isEnumType() override { return false; }

  VarType* getMemberVarType(const std::string& memberName) override;

  llvm::Type* genTypeHead(CodeGenerator& generator,
                          const std::string& typeName = "unnamed");
  llvm::Type* genTypeBody(CodeGenerator& generator);
  llvm::Type* getMemberType(const std::string& memberName,
                            CodeGenerator& generator);
};

class FieldDecl : public Decl {
 public:
  VarType* varType_;
  MemberList* memberList_;

  FieldDecl(VarType* varType, MemberList* memberList)
      : varType_(varType), memberList_(memberList) {}
  ~FieldDecl() {}

  llvm::Value* genCode(CodeGenerator& generator) override { return nullptr; }
  std::pair<std::string, std::string> genGraph() override;
};

class EnumType : public VarType {
 public:
  EnumList* enumList_;

  EnumType(EnumList* enumList, const std::string& enumTypeName)
      : VarType(enumTypeName), enumList_(enumList) {}
  ~EnumType() {}

  std::pair<std::string, std::string> genGraph() override;

  llvm::Type* getType(CodeGenerator& generator) override;

  bool isBuiltinType() override { return false; }
  bool isPointerType() override { return false; }
  bool isArrayType() override { return false; }
  bool isDefinedType() override { return false; }
  bool isStructType() override { return false; }
  bool isUnionType() override { return false; }
  bool isEnumType() override { return true; }
};

class Enum : public Node {
 public:
  std::string name_;
  bool hasValue_;
  int value_;

  Enum(const std::string& name, bool hasValue = false, int value = 0)
      : name_(name), hasValue_(hasValue), value_(value) {}
  ~Enum() {}

  // Code already generated in EnumType::getType
  llvm::Value* genCode(CodeGenerator& generator) override { return nullptr; }
  std::pair<std::string, std::string> genGraph() override;
};

// Statements

class IfStmt : public Stmt {
 public:
  Expr* condition_;
  Stmt* thenStmt_;
  Stmt* elseStmt_;

  IfStmt(Expr* condition, Stmt* thenStmt, Stmt* elseStmt = nullptr)
      : condition_(condition), thenStmt_(thenStmt), elseStmt_(elseStmt) {}
  ~IfStmt() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

class SwitchStmt : public Stmt {
 public:
  Expr* matcher_;
  CaseStmtList* caseStmtList_;

  SwitchStmt(Expr* matcher, CaseStmtList* caseStmtList)
      : matcher_(matcher), caseStmtList_(caseStmtList) {}
  ~SwitchStmt() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

class CaseStmt : public Stmt {
 public:
  Expr* condition_;
  Stmts* content_;

  CaseStmt(Expr* condition, Stmts* content)
      : condition_(condition), content_(content) {}
  ~CaseStmt() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

class ForStmt : public Stmt {
 public:
  Stmt* initial_;
  Expr* condition_;
  Expr* update_;
  Stmt* loopBody_;

  ForStmt(Stmt* initial, Expr* condition, Expr* update, Stmt* loopBody)
      : initial_(initial),
        condition_(condition),
        update_(update),
        loopBody_(loopBody) {}
  ~ForStmt() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

class DoStmt : public Stmt {
 public:
  Stmt* loopBody_;
  Expr* condition_;

  DoStmt(Stmt* loopBody, Expr* condition)
      : loopBody_(loopBody), condition_(condition) {}
  ~DoStmt() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

class WhileStmt : public Stmt {
 public:
  Expr* condition_;
  Stmt* loopBody_;

  WhileStmt(Expr* condition, Stmt* loopBody)
      : condition_(condition), loopBody_(loopBody) {}
  ~WhileStmt() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

class ContinueStmt : public Stmt {
 public:
  ContinueStmt() {}
  ~ContinueStmt() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

class BreakStmt : public Stmt {
 public:
  BreakStmt() {}
  ~BreakStmt() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

class ReturnStmt : public Stmt {
 public:
  Expr* retVal_;

  ReturnStmt(Expr* retVal = nullptr) : retVal_(retVal) {}
  ~ReturnStmt() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

class Block : public Stmt {
 public:
  Stmts* content_;

  Block(Stmts* content) : content_(content) {};
  ~Block() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() override;
};

// Expressions

class Expr : public Stmt {
 public:
  Expr() {}
  ~Expr() {}

  // Rvalue vs lvalue codegen (central to understanding lcc):
  //   genCode()    -> the value at an expression (often load from an address)
  //   genCodePtr() -> address of a modifiable location (alloca, GEP, param slot)
  // Assignments take the lhs via genCodePtr(); most operators use genCode() on
  // children. Address-of (&) reads genCodePtr(); dereference (*) loads genCode().
  virtual llvm::Value* genCodePtr(CodeGenerator& generator) = 0;

  virtual VarType* getExprVarType(CodeGenerator& generator);
  virtual VarType* getLValueVarType(CodeGenerator& generator);
  virtual BuiltinType::TypeId getExprTypeId(CodeGenerator& generator);
  BuiltinType::TypeId getLValueTypeId(CodeGenerator& generator);

  static BuiltinType::TypeId binaryExprTypeId(Expr* lhs, Expr* rhs,
                                             CodeGenerator& generator);
  static bool binaryIsUnsigned(Expr* lhs, Expr* rhs,
                               CodeGenerator& generator);
};

// Shared expression bases (fields + non-trivial codegen helpers):
//   LhsRhsExpr        - lhs_/rhs_ layout for binary and assign-shaped nodes
//   BinaryExpr        - arithmetic/bitwise/shift via genBinaryCode()
//   LogicExpr         - comparisons and &&/|| via genEqualityCode() etc.
//   LhsRhsAssign      - plain and compound assignment helpers
//   CompoundAssign    - grammar grouping for +=, -=, ... (no extra behavior)
//   UnaryExpr         - operand_ and shared inc/dec IR (genIncDecCode)
//   ThrowingUnaryExpr - unary ops that are never lvalues (genCodePtr throws)

class LhsRhsExpr : public Expr {
 protected:
  Expr* lhs_;
  Expr* rhs_;

  LhsRhsExpr(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
};

class UnaryExpr : public Expr {
 protected:
  Expr* operand_;

  UnaryExpr(Expr* operand) : operand_(operand) {}

  llvm::Value* genIncDecCode(CodeGenerator& generator, bool increment,
                             bool returnOperandPtr,
                             const char* invalidTypeMessage);

 public:
  ~UnaryExpr() {}
};

// Unary operators that cannot appear as lvalues (!, ~, postfix ++/--, etc.).
// Prefix ++/-- use UnaryExpr directly because they return an lvalue pointer.
class ThrowingUnaryExpr : public UnaryExpr {
 protected:
  ThrowingUnaryExpr(Expr* operand) : UnaryExpr(operand) {}

  virtual const char* nonLValueErrorMessage() const = 0;

 public:
  ~ThrowingUnaryExpr() {}

  llvm::Value* genCodePtr(CodeGenerator& generator) override;
};

class BinaryExpr : public LhsRhsExpr {
 protected:
  BinaryExpr(Expr* lhs, Expr* rhs) : LhsRhsExpr(lhs, rhs) {}

  virtual const char* nonLValueErrorMessage() const = 0;

  llvm::Value* genBinaryCode(
      CodeGenerator& generator,
      const std::function<llvm::Value*(llvm::Value*, llvm::Value*)>& applyOp);

 public:
  ~BinaryExpr() {}

  BuiltinType::TypeId getExprTypeId(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;
};

class Variable : public Expr {
 public:
  std::string varName_;

  Variable(const std::string& varName) : varName_(varName) {}
  ~Variable() {}

  VarType* getExprVarType(CodeGenerator& generator) override;
  VarType* getLValueVarType(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class Constant : public Expr {
 public:
  BuiltinType::TypeId typeId_;
  char charValue_;
  int intValue_;
  unsigned int uintValue_;
  long longValue_;
  unsigned long ulongValue_;
  float floatValue_;
  double doubleValue_;
  bool boolValue_;

  Constant()
      : typeId_(BuiltinType::TypeId::UNKNOWN),
        charValue_('\0'),
        intValue_(0),
        uintValue_(0),
        longValue_(0),
        ulongValue_(0),
        floatValue_(0.0f),
        doubleValue_(0.0),
        boolValue_(false) {}
  Constant(char charValue) : Constant() {
    typeId_ = BuiltinType::TypeId::CHAR;
    charValue_ = charValue;
  }
  Constant(int intValue) : Constant() {
    typeId_ = BuiltinType::TypeId::INT;
    intValue_ = intValue;
  }
  Constant(unsigned int uintValue) : Constant() {
    typeId_ = BuiltinType::TypeId::UINT;
    uintValue_ = uintValue;
  }
  Constant(long longValue) : Constant() {
    typeId_ = BuiltinType::TypeId::LONG;
    longValue_ = longValue;
  }
  Constant(unsigned long ulongValue) : Constant() {
    typeId_ = BuiltinType::TypeId::ULONG;
    ulongValue_ = ulongValue;
  }
  Constant(float floatValue) : Constant() {
    typeId_ = BuiltinType::TypeId::FLOAT;
    floatValue_ = floatValue;
  }
  Constant(double doubleValue) : Constant() {
    typeId_ = BuiltinType::TypeId::DOUBLE;
    doubleValue_ = doubleValue;
  }
  Constant(bool boolValue) : Constant() {
    typeId_ = BuiltinType::TypeId::BOOL;
    boolValue_ = boolValue;
  }
  ~Constant() {}

  BuiltinType::TypeId getExprTypeId(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class ConstStr : public Constant {
 public:
  std::string str_;

  ConstStr(const std::string& str) : str_(str) {}
  ~ConstStr() {}

  BuiltinType::TypeId getExprTypeId(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class CommaExpr : public LhsRhsExpr {
 public:
  CommaExpr(Expr* lhs, Expr* rhs) : LhsRhsExpr(lhs, rhs) {}
  ~CommaExpr() {}

  VarType* getExprVarType(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class FuncCall : public Expr {
 public:
  std::string funcName_;
  ExprList* argList_;

  FuncCall(const std::string& funcName, ExprList* argList)
      : funcName_(funcName), argList_(argList) {}
  ~FuncCall() {}

  VarType* getExprVarType(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

// For structObj.member
class StructRef : public Expr {
 public:
  Expr* struct_;
  std::string memberName_;

  StructRef(Expr* structObj, const std::string& memberName)
      : struct_(structObj), memberName_(memberName) {}
  ~StructRef() {}

  VarType* getExprVarType(CodeGenerator& generator) override;
  VarType* getLValueVarType(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

// For structPtr->member
class StructDeref : public Expr {
 public:
  Expr* structPtr_;
  std::string memberName_;

  StructDeref(Expr* structPtr, const std::string& memberName)
      : structPtr_(structPtr), memberName_(memberName) {}
  ~StructDeref() {}

  VarType* getExprVarType(CodeGenerator& generator) override;
  VarType* getLValueVarType(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class Subscript : public Expr {
 public:
  Expr* array_;
  Expr* index_;

  Subscript(Expr* array, Expr* index) : array_(array), index_(index) {}
  ~Subscript() {}

  VarType* getExprVarType(CodeGenerator& generator) override;
  VarType* getLValueVarType(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class TypeCast : public Expr {
 public:
  VarType* varType_;
  Expr* operand_;

  TypeCast(VarType* varType, Expr* operand)
      : varType_(varType), operand_(operand) {}
  ~TypeCast() {}

  VarType* getExprVarType(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class SizeOf : public Expr {
 public:
  VarType* varType_;
  Expr* expr_;
  std::string identifier_;

  SizeOf(VarType* varType)
      : varType_(varType), expr_(nullptr), identifier_("") {}
  SizeOf(Expr* expr) : varType_(nullptr), expr_(expr), identifier_("") {}
  SizeOf(std::string& identifier)
      : varType_(nullptr), expr_(nullptr), identifier_(identifier) {}
  ~SizeOf() {}

  BuiltinType::TypeId getExprTypeId(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class UnaryPlus : public ThrowingUnaryExpr {
 public:
  UnaryPlus(Expr* operand) : ThrowingUnaryExpr(operand) {}
  ~UnaryPlus() {}

  VarType* getExprVarType(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class UnaryMinus : public ThrowingUnaryExpr {
 public:
  UnaryMinus(Expr* operand) : ThrowingUnaryExpr(operand) {}
  ~UnaryMinus() {}

  VarType* getExprVarType(CodeGenerator& generator) override;
  BuiltinType::TypeId getExprTypeId(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

/* for *pointer */
class PointerDeref : public UnaryExpr {
 public:
  PointerDeref(Expr* operand) : UnaryExpr(operand) {}
  ~PointerDeref() {}

  VarType* getExprVarType(CodeGenerator& generator) override;
  VarType* getLValueVarType(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

/* for &variable */
class AddressOf : public ThrowingUnaryExpr {
 public:
  AddressOf(Expr* operand) : ThrowingUnaryExpr(operand) {}
  ~AddressOf() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LhsRhsAssign : public LhsRhsExpr {
 protected:
  LhsRhsAssign(Expr* lhs, Expr* rhs) : LhsRhsExpr(lhs, rhs) {}

  llvm::Value* genSimpleAssignPtr(CodeGenerator& generator);

  llvm::Value* genCompoundAssignPtr(
      CodeGenerator& generator,
      const std::function<llvm::Value*(llvm::Value*, llvm::Value*)>& applyOp);

 public:
  llvm::Value* genCode(CodeGenerator& generator) override;
};

class Assign : public LhsRhsAssign {
 public:
  Assign(Expr* lhs, Expr* rhs) : LhsRhsAssign(lhs, rhs) {}
  ~Assign() {}

  VarType* getExprVarType(CodeGenerator& generator) override;

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class Add : public BinaryExpr {
 public:
  Add(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~Add() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class Sub : public BinaryExpr {
 public:
  Sub(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~Sub() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class Mul : public BinaryExpr {
 public:
  Mul(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~Mul() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class Div : public BinaryExpr {
 public:
  Div(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~Div() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class Mod : public BinaryExpr {
 public:
  Mod(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~Mod() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class PostfixInc : public ThrowingUnaryExpr {
 public:
  PostfixInc(Expr* operand) : ThrowingUnaryExpr(operand) {}
  ~PostfixInc() {}

  VarType* getExprVarType(CodeGenerator& generator) override;
  VarType* getLValueVarType(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class PostfixDec : public ThrowingUnaryExpr {
 public:
  PostfixDec(Expr* operand) : ThrowingUnaryExpr(operand) {}
  ~PostfixDec() {}

  VarType* getExprVarType(CodeGenerator& generator) override;
  VarType* getLValueVarType(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class PrefixInc : public UnaryExpr {
 public:
  PrefixInc(Expr* operand) : UnaryExpr(operand) {}
  ~PrefixInc() {}

  VarType* getExprVarType(CodeGenerator& generator) override;
  VarType* getLValueVarType(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class PrefixDec : public UnaryExpr {
 public:
  PrefixDec(Expr* operand) : UnaryExpr(operand) {}
  ~PrefixDec() {}

  VarType* getExprVarType(CodeGenerator& generator) override;
  VarType* getLValueVarType(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

// Groups compound assignment operators in the grammar; behavior lives in
// LhsRhsAssign::genCompoundAssignPtr and each subclass's genCodePtr.
class CompoundAssign : public LhsRhsAssign {
 protected:
  CompoundAssign(Expr* lhs, Expr* rhs) : LhsRhsAssign(lhs, rhs) {}

 public:
  ~CompoundAssign() {}
};

class AddAssign : public CompoundAssign {
 public:
  AddAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~AddAssign() {}

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class SubAssign : public CompoundAssign {
 public:
  SubAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~SubAssign() {}

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class MulAssign : public CompoundAssign {
 public:
  MulAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~MulAssign() {}

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class DivAssign : public CompoundAssign {
 public:
  DivAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~DivAssign() {}

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class ModAssign : public CompoundAssign {
 public:
  ModAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~ModAssign() {}

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class BitwiseAnd : public BinaryExpr {
 public:
  BitwiseAnd(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~BitwiseAnd() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class BitwiseOr : public BinaryExpr {
 public:
  BitwiseOr(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~BitwiseOr() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class BitwiseXor : public BinaryExpr {
 public:
  BitwiseXor(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~BitwiseXor() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class BitwiseNot : public ThrowingUnaryExpr {
 public:
  BitwiseNot(Expr* operand) : ThrowingUnaryExpr(operand) {}
  ~BitwiseNot() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class BitwiseAndAssign : public CompoundAssign {
 public:
  BitwiseAndAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~BitwiseAndAssign() {}

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class BitwiseOrAssign : public CompoundAssign {
 public:
  BitwiseOrAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~BitwiseOrAssign() {}

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class BitwiseXorAssign : public CompoundAssign {
 public:
  BitwiseXorAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~BitwiseXorAssign() {}

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class LeftShift : public BinaryExpr {
 public:
  LeftShift(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~LeftShift() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class RightShift : public BinaryExpr {
 public:
  RightShift(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~RightShift() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LeftShiftAssign : public CompoundAssign {
 public:
  LeftShiftAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~LeftShiftAssign() {}

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class RightShiftAssign : public CompoundAssign {
 public:
  RightShiftAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~RightShiftAssign() {}

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class LogicExpr : public LhsRhsExpr {
 protected:
  LogicExpr(Expr* lhs, Expr* rhs) : LhsRhsExpr(lhs, rhs) {}

  virtual const char* nonLValueErrorMessage() const = 0;

  llvm::Value* genBoolBinaryCode(
      CodeGenerator& generator,
      const std::function<llvm::Value*(llvm::Value*, llvm::Value*)>& combine);

  llvm::Value* genEqualityCode(CodeGenerator& generator);

  llvm::Value* genOrderedCompare(CodeGenerator& generator, int intCmpPred,
                                 int floatCmpPred, const char* unsupportedOp);

 public:
  llvm::Value* genCodePtr(CodeGenerator& generator) override;
};

class LogicAnd : public LogicExpr {
 public:
  LogicAnd(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicAnd() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicOr : public LogicExpr {
 public:
  LogicOr(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicOr() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicNot : public ThrowingUnaryExpr {
 public:
  LogicNot(Expr* operand) : ThrowingUnaryExpr(operand) {}
  ~LogicNot() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicEq : public LogicExpr {
 public:
  LogicEq(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicEq() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicNotEq : public LogicExpr {
 public:
  LogicNotEq(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicNotEq() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicLessThan : public LogicExpr {
 public:
  LogicLessThan(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicLessThan() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicLessEq : public LogicExpr {
 public:
  LogicLessEq(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicLessEq() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicGreaterThan : public LogicExpr {
 public:
  LogicGreaterThan(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicGreaterThan() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicGreaterEq : public LogicExpr {
 public:
  LogicGreaterEq(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicGreaterEq() {}

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class TernaryCondition : public Expr {
 public:
  Expr* condition_;
  Expr* trueExpr_;
  Expr* falseExpr_;

  TernaryCondition(Expr* condition, Expr* trueExpr, Expr* falseExpr)
      : condition_(condition), trueExpr_(trueExpr), falseExpr_(falseExpr) {}
  ~TernaryCondition() {}

  VarType* getExprVarType(CodeGenerator& generator) override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;

 protected:
  llvm::Value* genTernarySelect(
      CodeGenerator& generator,
      const std::function<llvm::Value*(Expr*)>& evalBranch,
      const char* typeMismatchMessage);
};

}  // namespace AST