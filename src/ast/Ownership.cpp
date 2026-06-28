#include "ast/Nodes.hpp"

// Tree ownership. Each parent owns its child pointers and deletes them here, so
// "delete Program" (g_root) tears down one translation unit. Expression bases
// LhsRhsExpr and UnaryExpr own child Expr*; concrete operator nodes inherit
// that cleanup via empty ~Foo() overrides.
//
// VarInit is the one node whose cleanup is not purely structural: the array
// type chain it holds is synthesized during lowering and shares its tail with
// the VarDecl base type, so releasing it goes through releaseArrayTypeChain
// below rather than a plain delete.
//
// This file includes nothing outside ast/, which is the point: the tree knows
// how to destroy itself without help from the code that lowers it. What these
// nodes are lowered *to* lives elsewhere — irgen/ emits LLVM IR from genCode(),
// and dot/AstToDot.cpp emits Graphviz DOT from genGraph().

namespace AST {

// arrays::buildVarType() nests one ArrayType per declarator bound
// around the VarType that VarDecl owns and shares across every name in its
// VarList. Delete only the ArrayType prefix, unlinking as we go, so that shared
// tail is left for VarDecl to destroy exactly once.
//
// Declared in ast/Nodes.hpp rather than kept file-local to this one caller,
// because the same rule has to hold before the chain is finished: if a bound
// turns out to be unresolved partway through the build, the prefix so far is
// unwound with this, and the shared tail must survive that too.
void releaseArrayTypeChain(VarType* built) noexcept {
  while (built != nullptr && built->isArrayType()) {
    auto* arrayType = static_cast<ArrayType*>(built);
    built = arrayType->baseType_;
    arrayType->baseType_ = nullptr;
    delete arrayType;
  }
}

namespace {

void deleteStmts(Stmts* stmts) {
  if (stmts == nullptr) {
    return;
  }
  for (Stmt* stmt : *stmts) {
    delete stmt;
  }
  delete stmts;
}

void deleteInitList(InitList* initList) {
  if (initList == nullptr) {
    return;
  }
  for (InitElement* element : *initList) {
    delete element;
  }
  delete initList;
}

void deleteFieldDecls(FieldDecls* fieldDecls) {
  if (fieldDecls == nullptr) {
    return;
  }
  for (FieldDecl* fieldDecl : *fieldDecls) {
    delete fieldDecl;
  }
  delete fieldDecls;
}

void deleteEnumList(EnumList* enumList) {
  if (enumList == nullptr) {
    return;
  }
  for (Enum* enumeration : *enumList) {
    delete enumeration;
  }
  delete enumList;
}

void deleteExprList(ExprList* exprList) {
  if (exprList == nullptr) {
    return;
  }
  for (Expr* expr : *exprList) {
    delete expr;
  }
  delete exprList;
}

}  // namespace

Node::~Node() = default;

Program::~Program() {
  if (decls_ != nullptr) {
    for (Decl* decl : *decls_) {
      delete decl;
    }
    delete decls_;
    decls_ = nullptr;
  }
}

FuncDecl::~FuncDecl() {
  delete retType_;
  delete paramList_;
  delete funcBody_;
}

Param::~Param() { delete varType_; }

ParamList::~ParamList() {
  for (Param* param : *this) {
    delete param;
  }
}

FuncBody::~FuncBody() { deleteStmts(content_); }

// arrayVarType_ chains end at varType_; destroy VarInits before the shared
// base.
VarDecl::~VarDecl() {
  if (varList_ != nullptr) {
    for (VarInit* var : *varList_) {
      delete var;
    }
    delete varList_;
    varList_ = nullptr;
  }
  delete varType_;
}

InitElement::~InitElement() {
  delete expr_;
  deleteInitList(nested_);
}

VarInit::~VarInit() {
  delete initialExpr_;
  deleteInitList(initList_);
  releaseArrayTypeChain(arrayVarType_);
  arrayVarType_ = nullptr;
}

TypeDecl::~TypeDecl() { delete varType_; }

TypedefDecl::~TypedefDecl() { delete underlyingType_; }

VarType::~VarType() = default;

PointerType::~PointerType() { delete baseType_; }

ArrayType::~ArrayType() { delete baseType_; }

FuncPointerType::~FuncPointerType() {
  delete returnType_;
  delete paramList_;
}

StructType::~StructType() { deleteFieldDecls(structBody_); }

UnionType::~UnionType() { deleteFieldDecls(unionBody_); }

FieldDecl::~FieldDecl() {
  delete varType_;
  delete memberList_;
}

EnumType::~EnumType() { deleteEnumList(enumList_); }

IfStmt::~IfStmt() {
  delete condition_;
  delete thenStmt_;
  delete elseStmt_;
}

LabelStmt::~LabelStmt() { delete stmt_; }

SwitchStmt::~SwitchStmt() {
  delete matcher_;
  if (caseStmtList_ != nullptr) {
    for (CaseStmt* caseStmt : *caseStmtList_) {
      delete caseStmt;
    }
    delete caseStmtList_;
    caseStmtList_ = nullptr;
  }
}

CaseStmt::~CaseStmt() {
  delete condition_;
  deleteStmts(content_);
}

ForStmt::~ForStmt() {
  delete initial_;
  delete condition_;
  delete update_;
  delete loopBody_;
}

DoStmt::~DoStmt() {
  delete loopBody_;
  delete condition_;
}

WhileStmt::~WhileStmt() {
  delete condition_;
  delete loopBody_;
}

ReturnStmt::~ReturnStmt() { delete retVal_; }

Block::~Block() { deleteStmts(content_); }

LhsRhsExpr::~LhsRhsExpr() {
  delete lhs_;
  delete rhs_;
}

UnaryExpr::~UnaryExpr() { delete operand_; }

FuncCall::~FuncCall() { deleteExprList(argList_); }

StructRef::~StructRef() { delete struct_; }

StructDeref::~StructDeref() { delete structPtr_; }

Subscript::~Subscript() {
  delete array_;
  delete index_;
}

TypeCast::~TypeCast() {
  delete varType_;
  delete operand_;
}

SizeOf::~SizeOf() {
  delete varType_;
  delete expr_;
}

TernaryCondition::~TernaryCondition() {
  delete condition_;
  delete trueExpr_;
  delete falseExpr_;
}

}  // namespace AST
