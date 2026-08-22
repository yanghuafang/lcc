#pragma once

#include <cstddef>
#include <functional>
#include <string>
#include <vector>

#include "ast/BuiltinTypeId.hpp"

class CodeGenerator;
class TypeEnv;

namespace llvm {

class Value;
class Type;

}  // namespace llvm

/// \file
/// Abstract Syntax Tree for lcc (single-pass compilation):
///   Lexer.l / Parser.y  ->  AST nodes in namespace AST
///   node::genCode()     ->  LLVM IR via CodeGenerator, convert, and ops
///   node::genGraph()    ->  Graphviz DOT fragments (written by DotFileWriter)
///
/// The nodes declared here are implemented across several files: the seven
/// walkers under irgen/, split by node category (genCode / genCodePtr, with the
/// type queries that feed them in irgen/ExprTypeQuery.cpp), dot/AstToDot.cpp
/// (genGraph), and ast/Ownership.cpp (destructors).
///
/// There is no separate semantic-analysis pass. getExprTypeId() and
/// getExprVarType() supply C type information while genCode() emits IR.
/// LLVM 20+ opaque pointers: load/store/GEP pointee types come from VarType
/// (see types/VarTypeQuery.hpp), not from llvm::Type* on pointer values.
///
/// Ownership: Parser allocates nodes with new; each parent owns its child
/// pointers and deletes them in ~Node overrides. delete Program (g_root)
/// tears down one translation unit.
///
/// This header is one file rather than four (Decls/Stmts/Exprs/Types, mirroring
/// the node categories) because the hierarchy will not separate: Expr derives
/// from Stmt, statements hold Expr*, expressions and declarations both hold
/// VarType*. Any split would need complete types across every boundary, and
/// every consumer includes all four anyway. The banners below serve that
/// navigation instead:
///
///   Core          Node, Program, Stmt base
///   Declarations  -> irgen/DeclToIr.cpp
///   Types         -> irgen/TypeToIr.cpp
///   Statements    -> irgen/StmtToIr.cpp
///   Expressions   -> irgen/ExprToIr.cpp       variables, literals, calls,
///                                             member access, subscript, cast,
///                                             sizeof, unary
///                    irgen/OperatorToIr.cpp   assign, arithmetic, inc/dec,
///                                             bitwise, shift
///                    irgen/LogicToIr.cpp      &&, ||, !, comparisons, ?:
///                    irgen/ExprTypeQuery.cpp  getExpr*/getLValue* for all
///                    three

// ===========================================================================
// Forward declarations and container aliases
//
// The definitions start at "Core" below; everything until then is names and
// std::vector aliases the grammar actions in frontend/Parser.y use.
// ===========================================================================

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
class TypedefDecl;

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
class InitElement;
using InitList = std::vector<InitElement*>;

// Sentinel bound from declarator `[]`; resolved from the initializer in
// codegen.
constexpr size_t kInferredArrayBound = static_cast<size_t>(-1);

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

struct SourceLoc {
  unsigned line = 0;
  unsigned col = 0;
};

// ===========================================================================
// Core — Node, Program, and the Stmt base
//
// Node declares the two virtuals every node implements: genCode() (LLVM IR,
// in the irgen/*ToIr.cpp walkers) and genGraph() (Graphviz DOT, in
// dot/AstToDot.cpp). Destructors are declared here and defined in
// ast/Ownership.cpp.
// ===========================================================================

/// Parser-filled source position for -g; flex fills yylloc, Parser.y copies
/// into setLoc().
class Node {
 public:
  Node() = default;
  /// Virtual so delete g_root (Program*) runs the concrete destructor chain.
  virtual ~Node();

  // Nodes own their children as raw pointers and delete them in
  // ast/Ownership.cpp, so a compiler-generated copy would be shallow: two
  // nodes pointing at one child, each deleting it. Copy assignment would leak
  // the children it overwrote on top of that. Neither is ever wanted -- the
  // grammar actions build the tree once and every walker visits it in place --
  // so both are deleted here at the root, which is what makes every node
  // class below non-copyable without repeating anything. Deleting the copy
  // operations suppresses the implicit move ones too, so a node cannot be
  // moved out of the tree either.
  Node(const Node&) = delete;
  Node& operator=(const Node&) = delete;

  void setLoc(unsigned line, unsigned col = 0) {
    loc_.line = line;
    loc_.col = col;
  }

  [[nodiscard]] const SourceLoc& loc() const noexcept { return loc_; }

  /// Interface to generate IR code.
  virtual llvm::Value* genCode(CodeGenerator& generator) = 0;

  /// Generate Graphviz DOT for this subtree (implemented in dot/AstToDot.cpp,
  /// not used by codegen). Returns (rootNodeId, dotFragment).
  [[nodiscard]] virtual std::pair<std::string, std::string> genGraph()
      const = 0;

 protected:
  SourceLoc loc_;
};

/// Grammar Root
class Program final : public Node {
 public:
  Decls* decls_;

  explicit Program(Decls* decls) : decls_(decls) {}
  ~Program() override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

/// Stmt is the base of Decl, Block, and Expr so a Block can hold any of them.
/// In C, a bare expression is a valid statement (expression statement), so Expr
/// inherits Stmt even though expressions are also used inside larger
/// expressions.
class Stmt : public Node {
 public:
  Stmt() = default;
  ~Stmt() override = default;
};

// ===========================================================================
// Declarations — Decl : Stmt        lowered in irgen/DeclToIr.cpp
//
// FuncDecl, VarDecl, TypeDecl, TypedefDecl, plus the pieces the grammar hangs
// off them: Param/ParamList, and VarInit/InitElement (one VarInit per name in
// a VarList, carrying that name's array bounds and initializer).
// ===========================================================================

class Decl : public Stmt {
 public:
  Decl() = default;
  ~Decl() override = default;
};

class FuncDecl final : public Decl {
 public:
  VarType* retType_;
  std::string funcName_;
  ParamList* paramList_;
  FuncBody* funcBody_;
  bool isStatic_ = false;

  explicit FuncDecl(VarType* retType, const std::string& funcName,
                    ParamList* paramList, FuncBody* funcBody = nullptr)
      : retType_(retType),
        funcName_(funcName),
        paramList_(paramList),
        funcBody_(funcBody) {}
  ~FuncDecl() override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

class Param final : public Node {
 public:
  VarType* varType_;
  std::string varName_;

  explicit Param(VarType* varType, const std::string& varName = "")
      : varType_(varType), varName_(varName) {}
  ~Param() override;

  /// Code already generated in FuncDecl::genCode.
  llvm::Value* genCode(CodeGenerator& generator) override {
    (void)generator;
    return nullptr;
  }
  std::pair<std::string, std::string> genGraph() const override;
};

class ParamList final : public std::vector<Param*>, public Node {
 public:
  bool isVariant_ = false;

  ParamList() = default;
  ~ParamList() override;

  /// Code already generated in FuncDecl::genCode.
  llvm::Value* genCode(CodeGenerator& generator) override {
    (void)generator;
    return nullptr;
  }
  std::pair<std::string, std::string> genGraph() const override;

  void setVariant() { isVariant_ = true; }
};

class FuncBody final : public Node {
 public:
  Stmts* content_;

  explicit FuncBody(Stmts* content) : content_(content) {}
  ~FuncBody() override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

class VarDecl final : public Decl {
 public:
  VarType* varType_;
  VarList* varList_;
  bool isStatic_ = false;

  explicit VarDecl(VarType* varType, VarList* varList)
      : varType_(varType), varList_(varList) {}
  ~VarDecl() override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

/// One element of a brace initializer: scalar expr or nested InitList (2D row).
class InitElement final : public Node {
 public:
  Expr* expr_;
  InitList* nested_;

  explicit InitElement(Expr* expr) : expr_(expr), nested_(nullptr) {}
  explicit InitElement(InitList* nested) : expr_(nullptr), nested_(nested) {}
  ~InitElement() override;

  [[nodiscard]] bool isNested() const noexcept { return nested_ != nullptr; }

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

/// One name in a declaration list (int a[4], b = 1). Holds declarator suffix
/// (arrayBounds_) and initializer separate from the shared VarType base type.
class VarInit final : public Node {
 public:
  std::string varName_;
  std::vector<size_t> arrayBounds_;
  Expr* initialExpr_;
  InitList* initList_;
  /// Per-name array type from arrays::buildVarType(); addVariable()
  /// keeps this pointer for the rest of codegen. Only the ArrayType wrappers
  /// are owned here—the leaf base type remains VarDecl::varType_.
  VarType* arrayVarType_ = nullptr;

  explicit VarInit(const std::string& varName,
                   const std::vector<size_t>& arrayBounds,
                   Expr* initialExpr = nullptr, InitList* initList = nullptr)
      : varName_(varName),
        arrayBounds_(arrayBounds),
        initialExpr_(initialExpr),
        initList_(initList) {}
  ~VarInit() override;

  llvm::Value* genCode(CodeGenerator& generator) override {
    (void)generator;
    return nullptr;
  }
  std::pair<std::string, std::string> genGraph() const override;

  [[nodiscard]] bool hasBraceInit() const { return initList_ != nullptr; }
};

/// Delete the ArrayType prefix arrays::buildVarType() nests around a
/// VarDecl's base type, unlinking as it goes so that shared tail survives.
/// Defined in ast/Ownership.cpp beside ~VarInit, which applies the rule to a
/// finished chain; irgen/Arrays.cpp applies it to a partly built one.
void releaseArrayTypeChain(VarType* built) noexcept;

class TypeDecl final : public Decl {
 public:
  VarType* varType_;

  explicit TypeDecl(VarType* varType) : varType_(varType) {}
  ~TypeDecl() override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

class TypedefDecl final : public Decl {
 public:
  VarType* underlyingType_;
  std::string aliasName_;

  explicit TypedefDecl(VarType* underlyingType, const std::string& aliasName)
      : underlyingType_(underlyingType), aliasName_(aliasName) {}
  ~TypedefDecl() override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

// ===========================================================================
// Types — VarType : Node            materialized in irgen/TypeToIr.cpp
//
// Builtin, pointer, array, struct, union, enum, and DefinedType (a typedef
// alias resolved through the symbol table). getType() turns one of these into
// an llvm::Type. Under LLVM 20+ opaque pointers these nodes are the only
// record of a pointee type, which is why load/store/GEP consult them via
// types/VarTypeQuery.hpp rather than reading it off the llvm::Value.
// ===========================================================================

/// Base of the type nodes: builtin, pointer, array, struct, union, enum, and
/// the DefinedType a typedef alias resolves through. getType() materializes one
/// into an llvm::Type against a TypeEnv.
///
/// Under LLVM 20 opaque pointers these nodes are the only record a pointee type
/// has, which is why load, store, and GEP recover their element types from here
/// rather than from the llvm::Value they operate on.
class VarType : public Node {
 public:
  bool isConst_ = false;
  std::string typeName_;  // User defined type name.

  explicit VarType(const std::string& typeName) : typeName_(typeName) {}
  ~VarType() override;

  llvm::Value* genCode(CodeGenerator& generator) override {
    (void)generator;
    return nullptr;
  }

  virtual llvm::Type* getType(TypeEnv& env) = 0;

  [[nodiscard]] virtual bool isBuiltinType() const noexcept = 0;
  [[nodiscard]] virtual bool isPointerType() const noexcept = 0;
  [[nodiscard]] virtual bool isArrayType() const noexcept = 0;
  [[nodiscard]] virtual bool isDefinedType() const noexcept = 0;
  [[nodiscard]] virtual bool isStructType() const noexcept = 0;
  [[nodiscard]] virtual bool isUnionType() const noexcept = 0;
  [[nodiscard]] virtual bool isEnumType() const noexcept = 0;

  [[nodiscard]] virtual VarType* getElementVarType() const noexcept {
    return nullptr;
  }
  [[nodiscard]] virtual VarType* getMemberVarType(
      const std::string& memberName) const;

  void setConst() { isConst_ = true; }

 protected:
  /// Memoized result of getType(), filled by the derived overrides in
  /// irgen/TypeToIr.cpp the first time a type is materialized — except
  /// EnumType::getType, which returns its i32 without ever filling this, so
  /// its own guard never fires. Unlike isConst_ and typeName_ above, this is
  /// not part of the tree the parser builds — it is a cache, and the reason
  /// getType() is the one query on a type node that cannot be const. Nothing
  /// outside the hierarchy reads it, so nothing outside can be tempted to
  /// trust it before it is filled.
  llvm::Type* llvmType_ = nullptr;
};

class BuiltinType final : public VarType {
 public:
  BuiltinTypeId typeId_;

  explicit BuiltinType(BuiltinTypeId typeId, const std::string& typeName)
      : VarType(typeName), typeId_(typeId) {}
  ~BuiltinType() override = default;

  std::pair<std::string, std::string> genGraph() const override;

  llvm::Type* getType(TypeEnv& env) override;

  bool isBuiltinType() const noexcept override { return true; }
  bool isPointerType() const noexcept override { return false; }
  bool isArrayType() const noexcept override { return false; }
  bool isDefinedType() const noexcept override { return false; }
  bool isStructType() const noexcept override { return false; }
  bool isUnionType() const noexcept override { return false; }
  bool isEnumType() const noexcept override { return false; }
};

class PointerType final : public VarType {
 public:
  VarType* baseType_;

  explicit PointerType(VarType* baseType)
      : VarType(baseType->typeName_ + "*"), baseType_(baseType) {}
  ~PointerType() override;

  std::pair<std::string, std::string> genGraph() const override;

  llvm::Type* getType(TypeEnv& env) override;

  bool isBuiltinType() const noexcept override { return false; }
  bool isPointerType() const noexcept override { return true; }
  bool isArrayType() const noexcept override { return false; }
  bool isDefinedType() const noexcept override { return false; }
  bool isStructType() const noexcept override { return false; }
  bool isUnionType() const noexcept override { return false; }
  bool isEnumType() const noexcept override { return false; }

  VarType* getElementVarType() const noexcept override { return baseType_; }
};

/// One array dimension; chained ArrayType nodes model multidim types.
/// getElementVarType() peels the outermost dimension (used by Subscript).
class ArrayType final : public VarType {
 public:
  VarType* baseType_;
  size_t length_;

  explicit ArrayType(VarType* baseType, size_t length)
      : VarType(baseType->typeName_ + "[" + std::to_string(length) + "]"),
        baseType_(baseType),
        length_(length) {}
  ~ArrayType() override;

  std::pair<std::string, std::string> genGraph() const override;

  llvm::Type* getType(TypeEnv& env) override;

  bool isBuiltinType() const noexcept override { return false; }
  bool isPointerType() const noexcept override { return false; }
  bool isArrayType() const noexcept override { return true; }
  bool isDefinedType() const noexcept override { return false; }
  bool isStructType() const noexcept override { return false; }
  bool isUnionType() const noexcept override { return false; }
  bool isEnumType() const noexcept override { return false; }

  VarType* getElementVarType() const noexcept override { return baseType_; }
};

/* Identifier is name of user defined type */
class DefinedType final : public VarType {
 public:
  explicit DefinedType(const std::string& typeName) : VarType(typeName) {}
  ~DefinedType() override = default;

  std::pair<std::string, std::string> genGraph() const override;

  llvm::Type* getType(TypeEnv& env) override;

  bool isBuiltinType() const noexcept override { return false; }
  bool isPointerType() const noexcept override { return false; }
  bool isArrayType() const noexcept override { return false; }
  bool isDefinedType() const noexcept override { return true; }
  bool isStructType() const noexcept override { return false; }
  bool isUnionType() const noexcept override { return false; }
  bool isEnumType() const noexcept override { return false; }
};

class StructType final : public VarType {
 public:
  FieldDecls* structBody_;

  explicit StructType(FieldDecls* structBody, const std::string& structTypeName)
      : VarType(structTypeName), structBody_(structBody) {}
  ~StructType() override;

  std::pair<std::string, std::string> genGraph() const override;

  llvm::Type* getType(TypeEnv& env) override;

  bool isBuiltinType() const noexcept override { return false; }
  bool isPointerType() const noexcept override { return false; }
  bool isArrayType() const noexcept override { return false; }
  bool isDefinedType() const noexcept override { return false; }
  bool isStructType() const noexcept override { return true; }
  bool isUnionType() const noexcept override { return false; }
  bool isEnumType() const noexcept override { return false; }

  VarType* getMemberVarType(const std::string& memberName) const override;

  llvm::Type* genTypeHead(TypeEnv& env,
                          const std::string& typeName = "anonymous");
  llvm::Type* genTypeBody(TypeEnv& env);
  [[nodiscard]] size_t getMemberIndex(const std::string& memberName) const;
};

class UnionType final : public VarType {
 public:
  FieldDecls* unionBody_;

  explicit UnionType(FieldDecls* unionBody, const std::string& unionTypeName)
      : VarType(unionTypeName), unionBody_(unionBody) {}
  ~UnionType() override;

  std::pair<std::string, std::string> genGraph() const override;

  llvm::Type* getType(TypeEnv& env) override;

  bool isBuiltinType() const noexcept override { return false; }
  bool isPointerType() const noexcept override { return false; }
  bool isArrayType() const noexcept override { return false; }
  bool isDefinedType() const noexcept override { return false; }
  bool isStructType() const noexcept override { return false; }
  bool isUnionType() const noexcept override { return true; }
  bool isEnumType() const noexcept override { return false; }

  VarType* getMemberVarType(const std::string& memberName) const override;

  llvm::Type* genTypeHead(TypeEnv& env,
                          const std::string& typeName = "unnamed");
  llvm::Type* genTypeBody(TypeEnv& env);
  llvm::Type* getMemberType(const std::string& memberName, TypeEnv& env) const;
};

class FieldDecl final : public Decl {
 public:
  VarType* varType_;
  MemberList* memberList_;

  explicit FieldDecl(VarType* varType, MemberList* memberList)
      : varType_(varType), memberList_(memberList) {}
  ~FieldDecl() override;

  llvm::Value* genCode(CodeGenerator& generator) override {
    (void)generator;
    return nullptr;
  }
  std::pair<std::string, std::string> genGraph() const override;
};

class EnumType final : public VarType {
 public:
  EnumList* enumList_;

  explicit EnumType(EnumList* enumList, const std::string& enumTypeName)
      : VarType(enumTypeName), enumList_(enumList) {}
  ~EnumType() override;

  std::pair<std::string, std::string> genGraph() const override;

  llvm::Type* getType(TypeEnv& env) override;

  bool isBuiltinType() const noexcept override { return false; }
  bool isPointerType() const noexcept override { return false; }
  bool isArrayType() const noexcept override { return false; }
  bool isDefinedType() const noexcept override { return false; }
  bool isStructType() const noexcept override { return false; }
  bool isUnionType() const noexcept override { return false; }
  bool isEnumType() const noexcept override { return true; }
};

class Enum final : public Node {
 public:
  std::string name_;
  bool hasValue_;
  int value_;

  explicit Enum(const std::string& name, bool hasValue = false, int value = 0)
      : name_(name), hasValue_(hasValue), value_(value) {}
  ~Enum() override = default;

  /// Code already generated in EnumType::getType
  llvm::Value* genCode(CodeGenerator& generator) override {
    (void)generator;
    return nullptr;
  }
  std::pair<std::string, std::string> genGraph() const override;
};

// ===========================================================================
// Statements — Stmt : Node          lowered in irgen/StmtToIr.cpp
//
// Control flow and Block. These are the nodes that create basic blocks:
// if/else joins, loop header/body/latch, and switch dispatch. BreakStmt and
// ContinueStmt carry no target of their own — they read the enclosing loop or
// switch off a stack on CodeGenerator.
// ===========================================================================

class IfStmt final : public Stmt {
 public:
  Expr* condition_;
  Stmt* thenStmt_;
  Stmt* elseStmt_;

  explicit IfStmt(Expr* condition, Stmt* thenStmt, Stmt* elseStmt = nullptr)
      : condition_(condition), thenStmt_(thenStmt), elseStmt_(elseStmt) {}
  ~IfStmt() override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

class SwitchStmt final : public Stmt {
 public:
  Expr* matcher_;
  CaseStmtList* caseStmtList_;

  explicit SwitchStmt(Expr* matcher, CaseStmtList* caseStmtList)
      : matcher_(matcher), caseStmtList_(caseStmtList) {}
  ~SwitchStmt() override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

class CaseStmt final : public Stmt {
 public:
  Expr* condition_;
  Stmts* content_;

  explicit CaseStmt(Expr* condition, Stmts* content)
      : condition_(condition), content_(content) {}
  ~CaseStmt() override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

class ForStmt final : public Stmt {
 public:
  Stmt* initial_;
  Expr* condition_;
  Expr* update_;
  Stmt* loopBody_;

  explicit ForStmt(Stmt* initial, Expr* condition, Expr* update, Stmt* loopBody)
      : initial_(initial),
        condition_(condition),
        update_(update),
        loopBody_(loopBody) {}
  ~ForStmt() override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

class DoStmt final : public Stmt {
 public:
  Stmt* loopBody_;
  Expr* condition_;

  explicit DoStmt(Stmt* loopBody, Expr* condition)
      : loopBody_(loopBody), condition_(condition) {}
  ~DoStmt() override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

class WhileStmt final : public Stmt {
 public:
  Expr* condition_;
  Stmt* loopBody_;

  explicit WhileStmt(Expr* condition, Stmt* loopBody)
      : condition_(condition), loopBody_(loopBody) {}
  ~WhileStmt() override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

class ContinueStmt final : public Stmt {
 public:
  ContinueStmt() = default;
  ~ContinueStmt() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

class BreakStmt final : public Stmt {
 public:
  BreakStmt() = default;
  ~BreakStmt() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

class ReturnStmt final : public Stmt {
 public:
  Expr* retVal_;

  explicit ReturnStmt(Expr* retVal = nullptr) : retVal_(retVal) {}
  ~ReturnStmt() override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

class Block final : public Stmt {
 public:
  Stmts* content_;

  explicit Block(Stmts* content) : content_(content) {};
  ~Block() override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  std::pair<std::string, std::string> genGraph() const override;
};

// ===========================================================================
// Expressions — Expr : Stmt         lowered in irgen/ExprToIr.cpp,
//                                   OperatorToIr.cpp, and LogicToIr.cpp
//
// The largest section: 58 classes, because C's expression grammar is the
// largest part of the language. Expr derives from Stmt because a bare
// expression is a valid C statement.
//
// Two things to know before reading it. First, genCode() vs genCodePtr() —
// rvalue vs lvalue, explained on Expr below. Second, most binary operators
// come in pairs (Add / AddAssign) whose lowering is stated once in
// irgen/Operators.hpp, which is why so many classes here are near-empty.
// ===========================================================================

/// Base of every C expression, and of the 58 classes below it. Derives from
/// Stmt because a bare expression is a valid C statement.
///
/// Every Expr answers two questions the lowering asks of it: what value it
/// produces, and what storage it designates. That is C's rvalue/lvalue
/// distinction made concrete, and picking the wrong one is the most common way
/// to break the expression walk -- see genCodePtr below.
class Expr : public Stmt {
 public:
  Expr() = default;
  ~Expr() override = default;

  /// Rvalue vs lvalue codegen (central to understanding lcc):
  ///   genCode()    -> the value at an expression (often load from an address)
  ///   genCodePtr() -> address of a modifiable location (alloca, GEP, param
  ///   slot)
  /// Assignments take the lhs via genCodePtr(); most operators use genCode() on
  /// children. Address-of (&) reads genCodePtr(); dereference (*) loads
  /// genCode().
  virtual llvm::Value* genCodePtr(CodeGenerator& generator) = 0;

  [[nodiscard]] virtual VarType* getExprVarType(CodeGenerator& generator) const;
  [[nodiscard]] virtual VarType* getLValueVarType(
      CodeGenerator& generator) const;
  [[nodiscard]] virtual BuiltinTypeId getExprTypeId(
      CodeGenerator& generator) const;
  [[nodiscard]] BuiltinTypeId getLValueTypeId(CodeGenerator& generator) const;

  /// Rvalue form of an lvalue expression: evaluate genCodePtr(), then load
  /// through it. This is the whole of genCode() for every node whose value is
  /// just "what is stored at my own address" — member access, subscript,
  /// dereference, assignment, prefix inc/dec — which is why it is a member here
  /// rather than a helper local to one lowering file.
  llvm::Value* loadFromLValuePtr(CodeGenerator& generator);

  static BuiltinTypeId binaryExprTypeId(Expr* lhs, Expr* rhs,
                                        CodeGenerator& generator);
  static bool binaryIsUnsigned(Expr* lhs, Expr* rhs, CodeGenerator& generator);
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

  explicit LhsRhsExpr(Expr* lhs, Expr* rhs) : lhs_(lhs), rhs_(rhs) {}

 public:
  ~LhsRhsExpr() override;
};

class UnaryExpr : public Expr {
 protected:
  Expr* operand_;

  explicit UnaryExpr(Expr* operand) : operand_(operand) {}

  llvm::Value* genIncDecCode(CodeGenerator& generator, bool increment,
                             bool returnOperandPtr,
                             const char* invalidTypeMessage);

 public:
  ~UnaryExpr() override;
};

/// Unary operators that cannot appear as lvalues (!, ~, postfix ++/--, etc.).
/// Prefix ++/-- use UnaryExpr directly because they return an lvalue pointer.
class ThrowingUnaryExpr : public UnaryExpr {
 protected:
  explicit ThrowingUnaryExpr(Expr* operand) : UnaryExpr(operand) {}

  [[nodiscard]] virtual const char* nonLValueErrorMessage() const = 0;

 public:
  ~ThrowingUnaryExpr() override = default;

  llvm::Value* genCodePtr(CodeGenerator& generator) override;
};

class BinaryExpr : public LhsRhsExpr {
 protected:
  explicit BinaryExpr(Expr* lhs, Expr* rhs) : LhsRhsExpr(lhs, rhs) {}

  [[nodiscard]] virtual const char* nonLValueErrorMessage() const = 0;

  llvm::Value* genBinaryCode(
      CodeGenerator& generator,
      const std::function<llvm::Value*(llvm::Value*, llvm::Value*)>& applyOp);

 public:
  ~BinaryExpr() override = default;

  BuiltinTypeId getExprTypeId(CodeGenerator& generator) const override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;
};

class Variable final : public Expr {
 public:
  std::string varName_;

  explicit Variable(const std::string& varName) : varName_(varName) {}
  ~Variable() override = default;

  VarType* getExprVarType(CodeGenerator& generator) const override;
  VarType* getLValueVarType(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class Constant : public Expr {
 public:
  BuiltinTypeId typeId_;
  char charValue_;
  int intValue_;
  unsigned int uintValue_;
  long longValue_;
  unsigned long ulongValue_;
  float floatValue_;
  double doubleValue_;
  bool boolValue_;

  Constant()
      : typeId_(BuiltinTypeId::UNKNOWN),
        charValue_('\0'),
        intValue_(0),
        uintValue_(0),
        longValue_(0),
        ulongValue_(0),
        floatValue_(0.0f),
        doubleValue_(0.0),
        boolValue_(false) {}
  explicit Constant(char charValue) : Constant() {
    typeId_ = BuiltinTypeId::CHAR;
    charValue_ = charValue;
  }
  explicit Constant(int intValue) : Constant() {
    typeId_ = BuiltinTypeId::INT;
    intValue_ = intValue;
  }
  explicit Constant(unsigned int uintValue) : Constant() {
    typeId_ = BuiltinTypeId::UINT;
    uintValue_ = uintValue;
  }
  explicit Constant(long longValue) : Constant() {
    typeId_ = BuiltinTypeId::LONG;
    longValue_ = longValue;
  }
  explicit Constant(unsigned long ulongValue) : Constant() {
    typeId_ = BuiltinTypeId::ULONG;
    ulongValue_ = ulongValue;
  }
  explicit Constant(float floatValue) : Constant() {
    typeId_ = BuiltinTypeId::FLOAT;
    floatValue_ = floatValue;
  }
  explicit Constant(double doubleValue) : Constant() {
    typeId_ = BuiltinTypeId::DOUBLE;
    doubleValue_ = doubleValue;
  }
  explicit Constant(bool boolValue) : Constant() {
    typeId_ = BuiltinTypeId::BOOL;
    boolValue_ = boolValue;
  }
  ~Constant() override = default;

  BuiltinTypeId getExprTypeId(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class ConstStr final : public Constant {
 public:
  std::string str_;

  explicit ConstStr(const std::string& str) : str_(str) {}
  ~ConstStr() override = default;

  BuiltinTypeId getExprTypeId(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class CommaExpr final : public LhsRhsExpr {
 public:
  explicit CommaExpr(Expr* lhs, Expr* rhs) : LhsRhsExpr(lhs, rhs) {}
  ~CommaExpr() override = default;

  VarType* getExprVarType(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class FuncCall final : public Expr {
 public:
  std::string funcName_;
  ExprList* argList_;

  explicit FuncCall(const std::string& funcName, ExprList* argList)
      : funcName_(funcName), argList_(argList) {}
  ~FuncCall() override;

  VarType* getExprVarType(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

/// For structObj.member
class StructRef final : public Expr {
 public:
  Expr* struct_;
  std::string memberName_;

  explicit StructRef(Expr* structObj, const std::string& memberName)
      : struct_(structObj), memberName_(memberName) {}
  ~StructRef() override;

  VarType* getExprVarType(CodeGenerator& generator) const override;
  VarType* getLValueVarType(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

/// For structPtr->member
class StructDeref final : public Expr {
 public:
  Expr* structPtr_;
  std::string memberName_;

  explicit StructDeref(Expr* structPtr, const std::string& memberName)
      : structPtr_(structPtr), memberName_(memberName) {}
  ~StructDeref() override;

  VarType* getExprVarType(CodeGenerator& generator) const override;
  VarType* getLValueVarType(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

/// Indexing: genCodePtr uses array_->genCode() (rvalue/decay) plus pointer
/// arithmetic; getLValueVarType peels one ArrayType so m[i][j] chains.
class Subscript final : public Expr {
 public:
  Expr* array_;
  Expr* index_;

  explicit Subscript(Expr* array, Expr* index) : array_(array), index_(index) {}
  ~Subscript() override;

  VarType* getExprVarType(CodeGenerator& generator) const override;
  VarType* getLValueVarType(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class TypeCast final : public Expr {
 public:
  VarType* varType_;
  Expr* operand_;

  explicit TypeCast(VarType* varType, Expr* operand)
      : varType_(varType), operand_(operand) {}
  ~TypeCast() override;

  VarType* getExprVarType(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class SizeOf final : public Expr {
 public:
  VarType* varType_;
  Expr* expr_;
  std::string identifier_;

  explicit SizeOf(VarType* varType)
      : varType_(varType), expr_(nullptr), identifier_("") {}
  explicit SizeOf(Expr* expr)
      : varType_(nullptr), expr_(expr), identifier_("") {}
  explicit SizeOf(const std::string& identifier)
      : varType_(nullptr), expr_(nullptr), identifier_(identifier) {}
  ~SizeOf() override;

  BuiltinTypeId getExprTypeId(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class UnaryPlus final : public ThrowingUnaryExpr {
 public:
  explicit UnaryPlus(Expr* operand) : ThrowingUnaryExpr(operand) {}
  ~UnaryPlus() override = default;

  VarType* getExprVarType(CodeGenerator& generator) const override;
  BuiltinTypeId getExprTypeId(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class UnaryMinus final : public ThrowingUnaryExpr {
 public:
  explicit UnaryMinus(Expr* operand) : ThrowingUnaryExpr(operand) {}
  ~UnaryMinus() override = default;

  VarType* getExprVarType(CodeGenerator& generator) const override;
  BuiltinTypeId getExprTypeId(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

/* for *pointer */
class PointerDeref final : public UnaryExpr {
 public:
  explicit PointerDeref(Expr* operand) : UnaryExpr(operand) {}
  ~PointerDeref() override = default;

  VarType* getExprVarType(CodeGenerator& generator) const override;
  VarType* getLValueVarType(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

/* for &variable */
class AddressOf final : public ThrowingUnaryExpr {
 public:
  explicit AddressOf(Expr* operand) : ThrowingUnaryExpr(operand) {}
  ~AddressOf() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LhsRhsAssign : public LhsRhsExpr {
 protected:
  explicit LhsRhsAssign(Expr* lhs, Expr* rhs) : LhsRhsExpr(lhs, rhs) {}

  llvm::Value* genSimpleAssignPtr(CodeGenerator& generator);

  llvm::Value* genCompoundAssignPtr(
      CodeGenerator& generator,
      const std::function<llvm::Value*(llvm::Value*, llvm::Value*)>& applyOp);

 public:
  llvm::Value* genCode(CodeGenerator& generator) override;
  VarType* getLValueVarType(CodeGenerator& generator) const override;
};

class Assign final : public LhsRhsAssign {
 public:
  explicit Assign(Expr* lhs, Expr* rhs) : LhsRhsAssign(lhs, rhs) {}
  ~Assign() override = default;

  VarType* getExprVarType(CodeGenerator& generator) const override;

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class Add final : public BinaryExpr {
 public:
  explicit Add(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~Add() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class Sub final : public BinaryExpr {
 public:
  explicit Sub(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~Sub() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class Mul final : public BinaryExpr {
 public:
  explicit Mul(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~Mul() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class Div final : public BinaryExpr {
 public:
  explicit Div(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~Div() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class Mod final : public BinaryExpr {
 public:
  explicit Mod(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~Mod() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class PostfixInc final : public ThrowingUnaryExpr {
 public:
  explicit PostfixInc(Expr* operand) : ThrowingUnaryExpr(operand) {}
  ~PostfixInc() override = default;

  VarType* getExprVarType(CodeGenerator& generator) const override;
  VarType* getLValueVarType(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class PostfixDec final : public ThrowingUnaryExpr {
 public:
  explicit PostfixDec(Expr* operand) : ThrowingUnaryExpr(operand) {}
  ~PostfixDec() override = default;

  VarType* getExprVarType(CodeGenerator& generator) const override;
  VarType* getLValueVarType(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class PrefixInc final : public UnaryExpr {
 public:
  explicit PrefixInc(Expr* operand) : UnaryExpr(operand) {}
  ~PrefixInc() override = default;

  VarType* getExprVarType(CodeGenerator& generator) const override;
  VarType* getLValueVarType(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class PrefixDec final : public UnaryExpr {
 public:
  explicit PrefixDec(Expr* operand) : UnaryExpr(operand) {}
  ~PrefixDec() override = default;

  VarType* getExprVarType(CodeGenerator& generator) const override;
  VarType* getLValueVarType(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

/// Groups compound assignment operators in the grammar; behavior lives in
/// LhsRhsAssign::genCompoundAssignPtr and each subclass's genCodePtr.
class CompoundAssign : public LhsRhsAssign {
 protected:
  explicit CompoundAssign(Expr* lhs, Expr* rhs) : LhsRhsAssign(lhs, rhs) {}

 public:
  ~CompoundAssign() override = default;
};

class AddAssign final : public CompoundAssign {
 public:
  explicit AddAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~AddAssign() override = default;

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class SubAssign final : public CompoundAssign {
 public:
  explicit SubAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~SubAssign() override = default;

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class MulAssign final : public CompoundAssign {
 public:
  explicit MulAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~MulAssign() override = default;

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class DivAssign final : public CompoundAssign {
 public:
  explicit DivAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~DivAssign() override = default;

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class ModAssign final : public CompoundAssign {
 public:
  explicit ModAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~ModAssign() override = default;

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class BitwiseAnd final : public BinaryExpr {
 public:
  explicit BitwiseAnd(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~BitwiseAnd() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class BitwiseOr final : public BinaryExpr {
 public:
  explicit BitwiseOr(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~BitwiseOr() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class BitwiseXor final : public BinaryExpr {
 public:
  explicit BitwiseXor(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~BitwiseXor() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class BitwiseNot final : public ThrowingUnaryExpr {
 public:
  explicit BitwiseNot(Expr* operand) : ThrowingUnaryExpr(operand) {}
  ~BitwiseNot() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class BitwiseAndAssign final : public CompoundAssign {
 public:
  explicit BitwiseAndAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~BitwiseAndAssign() override = default;

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class BitwiseOrAssign final : public CompoundAssign {
 public:
  explicit BitwiseOrAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~BitwiseOrAssign() override = default;

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class BitwiseXorAssign final : public CompoundAssign {
 public:
  explicit BitwiseXorAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~BitwiseXorAssign() override = default;

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class LeftShift final : public BinaryExpr {
 public:
  explicit LeftShift(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~LeftShift() override = default;

  BuiltinTypeId getExprTypeId(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class RightShift final : public BinaryExpr {
 public:
  explicit RightShift(Expr* lhs, Expr* rhs) : BinaryExpr(lhs, rhs) {}
  ~RightShift() override = default;

  BuiltinTypeId getExprTypeId(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LeftShiftAssign final : public CompoundAssign {
 public:
  explicit LeftShiftAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~LeftShiftAssign() override = default;

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class RightShiftAssign final : public CompoundAssign {
 public:
  explicit RightShiftAssign(Expr* lhs, Expr* rhs) : CompoundAssign(lhs, rhs) {}
  ~RightShiftAssign() override = default;

  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;
};

class LogicExpr : public LhsRhsExpr {
 protected:
  explicit LogicExpr(Expr* lhs, Expr* rhs) : LhsRhsExpr(lhs, rhs) {}

  [[nodiscard]] virtual const char* nonLValueErrorMessage() const = 0;

  llvm::Value* genShortCircuitCode(CodeGenerator& generator, bool isAnd);

  llvm::Value* genEqualityCode(CodeGenerator& generator);

  llvm::Value* genOrderedCompare(CodeGenerator& generator, int intCmpPred,
                                 int floatCmpPred, const char* unsupportedOp);

 public:
  BuiltinTypeId getExprTypeId(CodeGenerator& generator) const override;

  llvm::Value* genCodePtr(CodeGenerator& generator) override;
};

class LogicAnd final : public LogicExpr {
 public:
  explicit LogicAnd(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicAnd() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicOr final : public LogicExpr {
 public:
  explicit LogicOr(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicOr() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicNot final : public ThrowingUnaryExpr {
 public:
  explicit LogicNot(Expr* operand) : ThrowingUnaryExpr(operand) {}
  ~LogicNot() override = default;

  BuiltinTypeId getExprTypeId(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicEq final : public LogicExpr {
 public:
  explicit LogicEq(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicEq() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicNotEq final : public LogicExpr {
 public:
  explicit LogicNotEq(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicNotEq() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicLessThan final : public LogicExpr {
 public:
  explicit LogicLessThan(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicLessThan() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicLessEq final : public LogicExpr {
 public:
  explicit LogicLessEq(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicLessEq() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicGreaterThan final : public LogicExpr {
 public:
  explicit LogicGreaterThan(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicGreaterThan() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class LogicGreaterEq final : public LogicExpr {
 public:
  explicit LogicGreaterEq(Expr* lhs, Expr* rhs) : LogicExpr(lhs, rhs) {}
  ~LogicGreaterEq() override = default;

  llvm::Value* genCode(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  const char* nonLValueErrorMessage() const override;
};

class TernaryCondition final : public Expr {
 public:
  Expr* condition_;
  Expr* trueExpr_;
  Expr* falseExpr_;

  explicit TernaryCondition(Expr* condition, Expr* trueExpr, Expr* falseExpr)
      : condition_(condition), trueExpr_(trueExpr), falseExpr_(falseExpr) {}
  ~TernaryCondition() override;

  VarType* getExprVarType(CodeGenerator& generator) const override;

  llvm::Value* genCode(CodeGenerator& generator) override;
  llvm::Value* genCodePtr(CodeGenerator& generator) override;

  std::pair<std::string, std::string> genGraph() const override;

 protected:
  llvm::Value* genTernaryBranch(
      CodeGenerator& generator,
      const std::function<llvm::Value*(Expr*)>& evalBranch,
      const char* typeMismatchMessage) const;
};

}  // namespace AST