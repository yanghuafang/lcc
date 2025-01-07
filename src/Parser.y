 /* Definition Section */

%{
#include "AbstractSyntaxTree.hpp"

#include <iostream>

#include <stdio.h>

void yyerror(const char* s) {
    printf("ERROR: %s\n", s);
}

int yylex(void);

AST::Program* g_root;
%}

%output "Parser.cpp"

%code requires {
    #include "AbstractSyntaxTree.hpp"
}

 /* Define union yylval */
 /* Types for terminal and non-terminal symbols */
%union {
    char charVal;
    unsigned char ucharVal;
    char shortVal;
    unsigned ushortVal;
    int intVal;
    unsigned int uintVal;
    long longVal;
    unsigned long ulongVal;
    float floatVal;
    double doubleVal;
    std::string* idVal; /* for identifier */
    std::string* strVal;

    AST::Program* program;

    AST::Decl* decl;
    AST::Decls* decls;

    AST::TypeDecl* typeDecl;
    AST::VarDecl* varDecl;
    AST::VarType* varType;

    AST::FuncDecl* funcDecl;
    AST::FuncBody* funcBody;
    AST::Block* block;

    AST::Param* param;
    AST::ParamList* paramList;

    AST::VarInit* varInit;
    AST::VarList* varList;

    AST::BuiltinType* builtinType;

    AST::FieldDecl* fieldDecl;
    AST::FieldDecls* fieldDecls;

    AST::MemberList* memberList;

    AST::Constant* constant;

    AST::Expr* expr;
    AST::ExprList* exprList;

    AST::Stmt* stmt;
    AST::Stmts* stmts;

    AST::IfStmt* ifStmt;

    AST::SwitchStmt* switchStmt;
    AST::CaseStmtList* caseStmtList;
    AST::CaseStmt* caseStmt;

    AST::ForStmt* forStmt;
    AST::DoStmt* doStmt;
    AST::WhileStmt* whileStmt;

    AST::ContinueStmt* continueStmt;
    AST::BreakStmt* breakStmt;
    AST::ReturnStmt* returnStmt;

    AST::Enum* enumeration;
    AST::EnumList* enumList;
}

 /* Define terminal symbols */
%token COMMA COLON SEMICOLON QUESTION ELLIPSES
       DOT ASTERISK AMPERSAND ARROW
       LPARENTHESES RPARENTHESES LBRACKET RBRACKET LBRACE RBRACE
       ASSIGN ADD SUB DIV MOD DADD DSUB ADDEQ SUBEQ MULEQ DIVEQ MODEQ
       BOR BXOR BNOT BANDEQ BOREQ BXOREQ
       SHL SHR SHLEQ SHREQ
       AND OR NOT
       EQ NEQ GT GE LT LE
       CHAR SHORT INT LONG
       UNSIGNED CONST VOID
       FLOAT DOUBLE
       BOOL TRUE FALSE
       IF ELSE
       SWITCH CASE DEFAULT
       FOR DO WHILE
       CONTINUE BREAK RETURN
       STRUCT UNION ENUM
       SIZEOF

%token<idVal>                   IDENTIFIER
%token<charVal>                 CHARACTER
%token<intVal>                  INTEGER
%token<uintVal>                 UINTEGER
%token<longVal>                 LONGVAL
%token<ulongVal>                ULONGVAL
%token<floatVal>                FLOATVAL
%token<doubleVal>               DOUBLEVAL
%token<strVal>                  STRING

 /* Define non-terminal symbols */

%type<program>                  Program

%type<decl>                     Decl
%type<decls>                    Decls

%type<typeDecl>                 TypeDecl
%type<varDecl>                  VarDecl
%type<varType>                  VarType _VarType

%type<funcDecl>                 FuncDecl
%type<funcBody>                 FuncBody
%type<block>                    Block

%type<param>                    Param 
%type<paramList>                ParamList

%type<varInit>                  VarInit
%type<varList>                  VarList

%type<builtinType>              BuiltinType

%type<fieldDecl>                FieldDecl
%type<fieldDecls>               FieldDecls

%type<memberList>               MemberList

%type<constant>                 Constant

%type<expr>                     Expr
%type<exprList>                 ExprList

%type<stmt>                     Stmt
%type<stmts>                    Stmts

%type<ifStmt>                   IfStmt

%type<switchStmt>               SwitchStmt
%type<caseStmtList>             CaseStmtList
%type<caseStmt>                 CaseStmt

%type<forStmt>                  ForStmt
%type<doStmt>                   DoStmt
%type<whileStmt>                WhileStmt

%type<continueStmt>             ContinueStmt
%type<breakStmt>                BreakStmt
%type<returnStmt>               ReturnStmt

%type<enumeration>              Enum
%type<enumList>                 EnumList

 /* Operator precedence from low to high */
 // https://en.cppreference.com/w/c/language/operator_precedence

%left COMMA //15
%right ASSIGN ADDEQ SUBEQ MULEQ DIVEQ MODEQ BANDEQ BOREQ BXOREQ SHLEQ SHREQ //14
%right QUESTION COLON //13
%left OR //12
%left AND //11
%left BOR //10
%left BXOR //9
%left AMPERSAND //8
%left EQ NEQ //7
%left LT LE GT GE //6
%left SHL SHR //5
%left ADD SUB //4
%left ASTERISK DIV MOD //3
%left DADD DSUB NOT BNOT SIZEOF //2
%left DOT ARROW //1

 /* Association */
 /* Use nonassoc to resolve else dangling ambiguity which arises when there are
   multiple nested IF statements, and it is unclear innermost or outermost unpaired IF
   an ELSE should associate with */
 /* ELSE will paired with nearest preceding(innermost) unpaired IF */
 /* Make ELSE nonassoc to make it intend to shift instead of reduce */
%nonassoc ELSE

 /* Start production of C grammar */
%start Program

%define parse.error verbose
%locations

%%

 /* Rules Section */
Program:    Decls               { $$ = new AST::Program($1); g_root = $$; }
            ;

Decls:      Decls Decl          { $$ = $1; $$->push_back($2); }
            |                   { $$ = new AST::Decls(); }
            ;

Decl:       FuncDecl            { $$ = $1; }
            | VarDecl           { $$ = $1; }
            | TypeDecl          { $$ = $1; }
            ;

FuncDecl:   VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES SEMICOLON
                                { $$ = new AST::FuncDecl($1, *$2, $4); }
            | VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES FuncBody
                                { $$ = new AST::FuncDecl($1, *$2, $4, $6); }
            ;

FuncBody:   LBRACE Stmts RBRACE { $$ = new AST::FuncBody($2); }
            ;

VarDecl:    VarType VarList SEMICOLON
                                { $$ = new AST::VarDecl($1, $2); }
            | VarType IDENTIFIER LBRACKET INTEGER RBRACKET SEMICOLON
                                { AST::ArrayType* arrayType = new AST::ArrayType($1, $4);
                                  AST::VarList* varList = new AST::VarList();
                                  AST::VarInit* varInit = new AST::VarInit(*$2);
                                  varList->push_back(varInit);
                                  $$ = new AST::VarDecl(arrayType, varList); }
            ;

TypeDecl:   _VarType SEMICOLON  { $$ = new AST::TypeDecl($1); }
            ;

 /* VarType */

VarType:    _VarType            { $$ = $1; }
            | CONST _VarType    { $$ = $2; $$->setConst(); }
            ;

_VarType:   BuiltinType         { $$ = $1; }
            | STRUCT IDENTIFIER LBRACE FieldDecls RBRACE
                                { $$ = new AST::StructType($4, *$2); }
            | UNION IDENTIFIER LBRACE FieldDecls RBRACE
                                { $$ = new AST::UnionType($4, *$2); }
            | ENUM IDENTIFIER LBRACE EnumList RBRACE
                                { $$ = new AST::EnumType($4, *$2); }
            | _VarType ASTERISK { $$ = new AST::PointerType($1); }
            | IDENTIFIER        { $$ = new AST::DefinedType(*$1); }
            ;

 /* VarList */

 /* e.g. a = 1, b = 2, c; */
VarList:    VarList COMMA VarInit
                                { $$ = $1; $$->push_back($3); }
            | VarInit           { $$ = new AST::VarList(); $$->push_back($1); }
            |                   { $$ = new AST::VarList(); }
            ;

 /* e.g. a; */
 /* e.g. b = 2; */
VarInit:    IDENTIFIER          { $$ = new AST::VarInit(*$1); }
            | IDENTIFIER ASSIGN Expr
                                { $$ = new AST::VarInit(*$1, $3); }
            ;

 /* ParamList */

ParamList:    ParamList COMMA Param
                                { $$ = $1; $$->push_back($3); }
            | ParamList COMMA ELLIPSES
                                { $$ = $1; $$->setVariant(); }
            | Param             { $$ = new AST::ParamList(); $$->push_back($1); }
            | ELLIPSES          { $$ = new AST::ParamList(); $$->setVariant(); }
            |                   { $$ = new AST::ParamList(); }
            ;

 /* A Param is a variable that is defined in a function's declaration or definition. */
 /* It acts as a placeholder for the value that will be passed to the function */
 /* when it is called. */
Param:      VarType IDENTIFIER  { $$ = new AST::Param($1, *$2); }
            | VarType           { $$ = new AST::Param($1); }
            ;

BuiltinType:    
            CHAR                { $$ = new AST::BuiltinType(AST::BuiltinType::TypeId::CHAR, "char"); }
            | SHORT             { $$ = new AST::BuiltinType(AST::BuiltinType::TypeId::SHORT, "short"); }
            | INT               { $$ = new AST::BuiltinType(AST::BuiltinType::TypeId::INT, "int"); }
            | LONG              { $$ = new AST::BuiltinType(AST::BuiltinType::TypeId::LONG, "long"); }
            | UNSIGNED          { $$ = new AST::BuiltinType(AST::BuiltinType::TypeId::UINT, "uint"); }
            | UNSIGNED CHAR     { $$ = new AST::BuiltinType(AST::BuiltinType::TypeId::UCHAR, "uchar"); }
            | UNSIGNED SHORT    { $$ = new AST::BuiltinType(AST::BuiltinType::TypeId::USHORT, "ushort"); }
            | UNSIGNED INT      { $$ = new AST::BuiltinType(AST::BuiltinType::TypeId::UINT, "uint"); }
            | UNSIGNED LONG     { $$ = new AST::BuiltinType(AST::BuiltinType::TypeId::ULONG, "ulong"); }
            | FLOAT             { $$ = new AST::BuiltinType(AST::BuiltinType::TypeId::FLOAT, "float"); }
            | DOUBLE            { $$ = new AST::BuiltinType(AST::BuiltinType::TypeId::DOUBLE, "double"); }
            | BOOL              { $$ = new AST::BuiltinType(AST::BuiltinType::TypeId::BOOL, "bool"); }
            | VOID              { $$ = new AST::BuiltinType(AST::BuiltinType::TypeId::VOID, "void"); }
            ;

 /* FieldDecls */

FieldDecls: FieldDecls FieldDecl 
                                { $$ = $1; if ($2 != NULL) $$->push_back($2); }
            |                   { $$ = new AST::FieldDecls(); }
            ;

FieldDecl:  VarType MemberList SEMICOLON
                                { $$ = new AST::FieldDecl($1, $2); }
            | SEMICOLON         { $$ = NULL; }
            ;

 /* MemberList */

MemberList: MemberList COMMA IDENTIFIER
                                { $$ = $1; $$->push_back(*$3); }
            | IDENTIFIER        { $$ = new AST::MemberList(); $$->push_back(*$1); }
            |                   { $$ = new AST::MemberList(); }
            ;

 /* EnumList */

EnumList:   EnumList COMMA Enum
                                { $$ = $1; $$->push_back($3); }
            | Enum              { $$ = new AST::EnumList(); $$->push_back($1); }
            |                   { $$ = new AST::EnumList(); }
            ;

Enum:       IDENTIFIER          { $$ = new AST::Enum(*$1); }
            | IDENTIFIER ASSIGN INTEGER
                                { $$ = new AST::Enum(*$1, true, $3); }
            ;

 /* Stmts */

Stmts:      Stmts Stmt          { $$ = $1; if ($2 != NULL) $$->push_back($2); }
            |                   { $$ = new AST::Stmts(); }
            ;

Stmt:       Expr SEMICOLON      { $$ = $1; }
            | IfStmt            { $$ = $1; }
            | SwitchStmt        { $$ = $1; }
            | ForStmt           { $$ = $1; }
            | DoStmt            { $$ = $1; }
            | WhileStmt         { $$ = $1; }
            | ContinueStmt      { $$ = $1; }
            | BreakStmt         { $$ = $1; }
            | ReturnStmt        { $$ = $1; }
            | Block             { $$ = $1; }
            | TypeDecl          { $$ = $1; }
            | VarDecl           { $$ = $1; }
            | SEMICOLON         { $$ = NULL; }
            ;

IfStmt:     IF LPARENTHESES Expr RPARENTHESES Stmt ELSE Stmt
                                { $$ = new AST::IfStmt($3, $5, $7); }
            | IF LPARENTHESES Expr RPARENTHESES Stmt
                                { $$ = new AST::IfStmt($3, $5); }
            ;

 /* SwitchStmt */

SwitchStmt: SWITCH LPARENTHESES Expr RPARENTHESES LBRACE CaseStmtList RBRACE
                                { $$ = new AST::SwitchStmt($3, $6); }
            ;

CaseStmtList:
            CaseStmtList CaseStmt
                                { $$ = $1; $$->push_back($2); }
            |                   { $$ = new AST::CaseStmtList(); }
            ;

CaseStmt:   CASE Expr COLON Stmts
                                { $$ = new AST::CaseStmt($2, $4); }
            | DEFAULT COLON Stmts
                                { $$ = new AST::CaseStmt(NULL, $3); }
            ;

ForStmt:    FOR LPARENTHESES Expr SEMICOLON Expr SEMICOLON Expr RPARENTHESES Stmt
                                { $$ = new AST::ForStmt($3, $5, $7, $9); }
            | FOR LPARENTHESES SEMICOLON Expr SEMICOLON Expr RPARENTHESES Stmt
                                { $$ = new AST::ForStmt(NULL, $4, $6, $8); }
            | FOR LPARENTHESES VarDecl Expr SEMICOLON Expr RPARENTHESES Stmt
                                { $$ = new AST::ForStmt($3, $4, $6, $8); }
            ;

DoStmt:     DO Stmt WHILE LPARENTHESES Expr RPARENTHESES SEMICOLON
                                { $$ = new AST::DoStmt($2, $5); }
            ;

WhileStmt:  WHILE LPARENTHESES Expr RPARENTHESES Stmt
                                { $$ = new AST::WhileStmt($3, $5); }
            ;

ContinueStmt:
            CONTINUE SEMICOLON  { $$ = new AST::ContinueStmt(); }
            ;

BreakStmt:  BREAK SEMICOLON     { $$ = new AST::BreakStmt(); }
            ;

ReturnStmt: RETURN SEMICOLON    { $$ = new AST::ReturnStmt(); }
            | RETURN Expr SEMICOLON
                                { $$ = new AST::ReturnStmt($2); }
            ;

Block:      LBRACE Stmts RBRACE { $$ = new AST::Block($2); }
            ;

 /* Expr */

 /* An argument is actual value or expression that is passed to the function */
 /* when it is invoked. */
Expr:       IDENTIFIER          { $$ = new AST::Variable(*$1); }
            | Constant          { $$ = $1; }
            | LPARENTHESES Expr RPARENTHESES
                                { $$ = $2; }
            | Expr COMMA Expr   { $$ = new AST::CommaExpr($1, $3); }
            | IDENTIFIER LPARENTHESES ExprList RPARENTHESES %prec ARROW
                                { $$ = new AST::FuncCall(*$1, $3); }
            | Expr DOT IDENTIFIER
                                { $$ = new AST::StructRef($1, *$3); }
            | Expr ARROW IDENTIFIER
                                { $$ = new AST::StructDeref($1, *$3); }
            | Expr LBRACKET Expr RBRACKET %prec ARROW
                                { $$ = new AST::Subscript($1, $3); }
            | LPARENTHESES VarType RPARENTHESES Expr %prec NOT
                                { $$ = new AST::TypeCast($2, $4); }
            | SIZEOF LPARENTHESES VarType RPARENTHESES
                                { $$ = new AST::SizeOf($3); }
            | SIZEOF LPARENTHESES Expr RPARENTHESES
                                { $$ = new AST::SizeOf($3); }
            | SIZEOF LPARENTHESES IDENTIFIER RPARENTHESES
                                { $$ = new AST::SizeOf(*$3); }
            | ADD Expr %prec NOT
                                { $$ = new AST::UnaryPlus($2); }
            | SUB Expr %prec NOT
                                { $$ = new AST::UnaryMinus($2); }
            | ASTERISK Expr %prec NOT
                                { $$ = new AST::PointerDeref($2); }
            | AMPERSAND Expr %prec NOT
                                { $$ = new AST::AddressOf($2); }
            | Expr ASSIGN Expr  { $$ = new AST::Assign($1, $3); }
            | Expr ADD Expr     { $$ = new AST::Add($1, $3); }
            | Expr SUB Expr     { $$ = new AST::Sub($1, $3); }
            | Expr ASTERISK Expr 
                                { $$ = new AST::Mul($1, $3); }
            | Expr DIV Expr     { $$ = new AST::Div($1, $3); }
            | Expr MOD Expr     { $$ = new AST::Mod($1, $3); }
            | Expr DADD %prec ARROW
                                { $$ = new AST::PostfixInc($1); }
            | Expr DSUB %prec ARROW
                                { $$ = new AST::PostfixDec($1); }
            | DADD Expr %prec NOT
                                { $$ = new AST::PrefixInc($2); }
            | DSUB Expr %prec NOT
                                { $$ = new AST::PrefixDec($2); }
            | Expr ADDEQ Expr   { $$ = new AST::AddAssign($1, $3); }
            | Expr SUBEQ Expr   { $$ = new AST::SubAssign($1, $3); }
            | Expr MULEQ Expr   { $$ = new AST::MulAssign($1, $3); }
            | Expr DIVEQ Expr   { $$ = new AST::DivAssign($1, $3); }
            | Expr MODEQ Expr   { $$ = new AST::ModAssign($1, $3); }
            | Expr AMPERSAND Expr
                                { $$ = new AST::BitwiseAnd($1, $3); }
            | Expr BOR Expr     { $$ = new AST::BitwiseOr($1, $3); }
            | Expr BXOR Expr    { $$ = new AST::BitwiseXor($1, $3); }
            | BNOT Expr         { $$ = new AST::BitwiseNot($2); }
            | Expr BANDEQ Expr  { $$ = new AST::BitwiseAndAssign($1, $3); }
            | Expr BOREQ Expr   { $$ = new AST::BitwiseOrAssign($1, $3); }
            | Expr BXOREQ Expr  { $$ = new AST::BitwiseXorAssign($1, $3); }
            | Expr SHL Expr     { $$ = new AST::LeftShift($1, $3); }
            | Expr SHR Expr     { $$ = new AST::RightShift($1, $3); }
            | Expr SHLEQ Expr   { $$ = new AST::LeftShiftAssign($1, $3); }
            | Expr SHREQ Expr   { $$ = new AST::RightShiftAssign($1, $3); }
            | Expr AND Expr     { $$ = new AST::LogicAnd($1, $3); }
            | Expr OR Expr      { $$ = new AST::LogicOr($1, $3); }
            | NOT Expr          { $$ = new AST::LogicNot($2); }
            | Expr EQ Expr      { $$ = new AST::LogicEq($1, $3); }
            | Expr NEQ Expr     { $$ = new AST::LogicNotEq($1, $3); }
            | Expr LT Expr      { $$ = new AST::LogicLessThan($1, $3); }
            | Expr LE Expr      { $$ = new AST::LogicLessEq($1, $3); }
            | Expr GT Expr      { $$ = new AST::LogicGreaterThan($1, $3); }
            | Expr GE Expr      { $$ = new AST::LogicGreaterEq($1, $3); }
            | Expr QUESTION Expr COLON Expr
                                { $$ = new AST::TernaryCondition($1, $3, $5); }
            ;

ExprList:   ExprList COMMA Expr
                                { $$ = $1; $$->push_back($3); }
            | Expr %prec COMMA  { $$ = new AST::ExprList(); $$->push_back($1); }
            |                   { $$ = new AST::ExprList(); }
            ;

Constant:   CHARACTER           { $$ = new AST::Constant($1); }
            | INTEGER           { $$ = new AST::Constant($1); }
            | UINTEGER          { $$ = new AST::Constant($1); }
            | LONGVAL           { $$ = new AST::Constant($1); }
            | ULONGVAL          { $$ = new AST::Constant($1); }
            | FLOATVAL          { $$ = new AST::Constant($1); }
            | DOUBLEVAL         { $$ = new AST::Constant($1); }
            | STRING            { $$ = new AST::ConstStr(*$1); }
            | TRUE              { $$ = new AST::Constant(true); }
            | FALSE             { $$ = new AST::Constant(false); }
            ;

%%

 /* Subroutines Section */