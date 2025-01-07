#pragma once

#include <stddef.h>

#include <string>
#include <vector>

class CodeGenerator;

namespace llvm {

class Value;
class Type;

}  // namespace llvm

// Define types of nodes of the parsing tree(Abstract Syntax Tree with
// attributes and syntax actions);

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

class UnaryPlus;
class UnaryMinus;
class PointerDeref;
class AddressOf;

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

  // Generate GraphViz tree of current node for visualization.
  // Return pair: first is the root of the generated tree, second is the
  // generated tree.
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

// Define Stmt ahead of time as Stmt can be formed by Decl, Block and Expr, so
// make Stmt the base class of Decl, Block and Expr.
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
           FuncBody* funcBody = NULL)
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
  llvm::Value* genCode(CodeGenerator& generator) override { return NULL; }
  std::pair<std::string, std::string> genGraph() override;
};

class ParamList : public std::vector<Param*>, public Node {
 public:
  bool isVariant_;

  ParamList() : isVariant_(false) {}
  ~ParamList() {}

  // Code already generated in FuncDecl::genCode.
  llvm::Value* genCode(CodeGenerator& generator) override { return NULL; }
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

  VarInit(const std::string& varName, Expr* initialExpr = NULL)
      : varName_(varName), initialExpr_(initialExpr) {}
  ~VarInit() {}

  llvm::Value* genCode(CodeGenerator& generator) override { return NULL; }
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
      : isConst_(false), typeName_(typeName), llvmType_(NULL) {}
  ~VarType() {}

  llvm::Value* genCode(CodeGenerator& generator) override { return NULL; }

  virtual llvm::Type* getType(CodeGenerator& generator) = 0;

  virtual bool isBuiltinType() = 0;
  virtual bool isPointerType() = 0;
  virtual bool isArrayType() = 0;
  virtual bool isDefinedType() = 0;
  virtual bool isStructType() = 0;
  virtual bool isUnionType() = 0;
  virtual bool isEnumType() = 0;

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

  llvm::Value* genCode(CodeGenerator& generator) override { return NULL; }
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
  llvm::Value* genCode(CodeGenerator& generator) override { return NULL; }
  std::pair<std::string, std::string> genGraph() override;
};

// Statements

class IfStmt : public Stmt {
 public:
  Expr* condition_;
  Stmt* thenStmt_;
  Stmt* elseStmt_;

  IfStmt(Expr* condition, Stmt* thenStmt, Stmt* elseStmt = NULL)
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

  ReturnStmt(Expr* retVal = NULL) : retVal_(retVal) {}
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

  // Interface to generate IR code for left value expr.
  virtual llvm::Value* genCodePtr(CodeGenerator& generator) = 0;
};

class Variable : public Expr {
 public:
  std::string varName_;

  Variable(const std::string& varName) : varName_(varName) {}
  ~Variable() {}

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

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class ConstStr : public Constant {
 public:
  std::string str_;

  ConstStr(const std::string& str) : str_(str) {}
  ~ConstStr() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class CommaExpr : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  CommaExpr(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~CommaExpr() {}

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

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class SizeOf : public Expr {
 public:
  VarType* varType_;
  Expr* expr_;
  std::string identifier_;

  SizeOf(VarType* varType) : varType_(varType), expr_(NULL), identifier_("") {}
  SizeOf(Expr* expr) : varType_(NULL), expr_(expr), identifier_("") {}
  SizeOf(std::string& identifier)
      : varType_(NULL), expr_(NULL), identifier_(identifier) {}
  ~SizeOf() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class UnaryPlus : public Expr {
 public:
  Expr* operand_;

  UnaryPlus(Expr* operand) : operand_(operand) {}
  ~UnaryPlus() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class UnaryMinus : public Expr {
 public:
  Expr* operand_;

  UnaryMinus(Expr* operand) : operand_(operand) {}
  ~UnaryMinus() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

/* for *pointer */
class PointerDeref : public Expr {
 public:
  Expr* operand_;

  PointerDeref(Expr* operand) : operand_(operand) {}
  ~PointerDeref() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

/* for &variable */
class AddressOf : public Expr {
 public:
  Expr* operand_;

  AddressOf(Expr* operand) : operand_(operand) {}
  ~AddressOf() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class Assign : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  Assign(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~Assign() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class Add : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  Add(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~Add() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class Sub : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  Sub(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~Sub() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class Mul : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  Mul(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~Mul() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class Div : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  Div(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~Div() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class Mod : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  Mod(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~Mod() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class PostfixInc : public Expr {
 public:
  Expr* operand_;

  PostfixInc(Expr* operand) : operand_(operand) {}
  ~PostfixInc() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class PostfixDec : public Expr {
 public:
  Expr* operand_;

  PostfixDec(Expr* operand) : operand_(operand) {}
  ~PostfixDec() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class PrefixInc : public Expr {
 public:
  Expr* operand_;

  PrefixInc(Expr* operand) : operand_(operand) {}
  ~PrefixInc() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class PrefixDec : public Expr {
 public:
  Expr* operand_;

  PrefixDec(Expr* operand) : operand_(operand) {}
  ~PrefixDec() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class AddAssign : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  AddAssign(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~AddAssign() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class SubAssign : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  SubAssign(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~SubAssign() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class MulAssign : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  MulAssign(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~MulAssign() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class DivAssign : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  DivAssign(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~DivAssign() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class ModAssign : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  ModAssign(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~ModAssign() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class BitwiseAnd : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  BitwiseAnd(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~BitwiseAnd() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class BitwiseOr : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  BitwiseOr(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~BitwiseOr() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class BitwiseXor : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  BitwiseXor(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~BitwiseXor() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class BitwiseNot : public Expr {
 public:
  Expr* operand_;

  BitwiseNot(Expr* operand) : operand_(operand) {}
  ~BitwiseNot() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class BitwiseAndAssign : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  BitwiseAndAssign(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~BitwiseAndAssign() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class BitwiseOrAssign : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  BitwiseOrAssign(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~BitwiseOrAssign() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class BitwiseXorAssign : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  BitwiseXorAssign(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~BitwiseXorAssign() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class LeftShift : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  LeftShift(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~LeftShift() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class RightShift : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  RightShift(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~RightShift() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class LeftShiftAssign : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  LeftShiftAssign(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~LeftShiftAssign() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class RightShiftAssign : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  RightShiftAssign(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~RightShiftAssign() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class LogicAnd : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  LogicAnd(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~LogicAnd() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class LogicOr : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  LogicOr(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~LogicOr() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class LogicNot : public Expr {
 public:
  Expr* operand_;

  LogicNot(Expr* operand) : operand_(operand) {}
  ~LogicNot() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class LogicEq : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  LogicEq(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~LogicEq() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class LogicNotEq : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  LogicNotEq(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~LogicNotEq() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class LogicLessThan : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  LogicLessThan(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~LogicLessThan() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class LogicLessEq : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  LogicLessEq(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~LogicLessEq() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class LogicGreaterThan : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  LogicGreaterThan(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~LogicGreaterThan() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class LogicGreaterEq : public Expr {
 public:
  Expr* lhs_;
  Expr* rhs_;

  LogicGreaterEq(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}
  ~LogicGreaterEq() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

class TernaryCondition : public Expr {
 public:
  Expr* condition_;
  Expr* trueExpr_;
  Expr* falseExpr_;

  TernaryCondition(Expr* condition, Expr* trueExpr, Expr* falseExpr)
      : condition_(condition), trueExpr_(trueExpr), falseExpr_(falseExpr) {}
  ~TernaryCondition() {}

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() override;
};

}  // namespace AST