/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_HPP_INCLUDED
# define YY_YY_PARSER_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 21 "Parser.y"

    #include "AbstractSyntaxTree.hpp"

#line 53 "Parser.hpp"

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    COMMA = 258,                   /* COMMA  */
    COLON = 259,                   /* COLON  */
    SEMICOLON = 260,               /* SEMICOLON  */
    QUESTION = 261,                /* QUESTION  */
    ELLIPSES = 262,                /* ELLIPSES  */
    DOT = 263,                     /* DOT  */
    ASTERISK = 264,                /* ASTERISK  */
    AMPERSAND = 265,               /* AMPERSAND  */
    ARROW = 266,                   /* ARROW  */
    LPARENTHESES = 267,            /* LPARENTHESES  */
    RPARENTHESES = 268,            /* RPARENTHESES  */
    LBRACKET = 269,                /* LBRACKET  */
    RBRACKET = 270,                /* RBRACKET  */
    LBRACE = 271,                  /* LBRACE  */
    RBRACE = 272,                  /* RBRACE  */
    ASSIGN = 273,                  /* ASSIGN  */
    ADD = 274,                     /* ADD  */
    SUB = 275,                     /* SUB  */
    DIV = 276,                     /* DIV  */
    MOD = 277,                     /* MOD  */
    DADD = 278,                    /* DADD  */
    DSUB = 279,                    /* DSUB  */
    ADDEQ = 280,                   /* ADDEQ  */
    SUBEQ = 281,                   /* SUBEQ  */
    MULEQ = 282,                   /* MULEQ  */
    DIVEQ = 283,                   /* DIVEQ  */
    MODEQ = 284,                   /* MODEQ  */
    BOR = 285,                     /* BOR  */
    BXOR = 286,                    /* BXOR  */
    BNOT = 287,                    /* BNOT  */
    BANDEQ = 288,                  /* BANDEQ  */
    BOREQ = 289,                   /* BOREQ  */
    BXOREQ = 290,                  /* BXOREQ  */
    SHL = 291,                     /* SHL  */
    SHR = 292,                     /* SHR  */
    SHLEQ = 293,                   /* SHLEQ  */
    SHREQ = 294,                   /* SHREQ  */
    AND = 295,                     /* AND  */
    OR = 296,                      /* OR  */
    NOT = 297,                     /* NOT  */
    EQ = 298,                      /* EQ  */
    NEQ = 299,                     /* NEQ  */
    GT = 300,                      /* GT  */
    GE = 301,                      /* GE  */
    LT = 302,                      /* LT  */
    LE = 303,                      /* LE  */
    CHAR = 304,                    /* CHAR  */
    SHORT = 305,                   /* SHORT  */
    INT = 306,                     /* INT  */
    LONG = 307,                    /* LONG  */
    UNSIGNED = 308,                /* UNSIGNED  */
    CONST = 309,                   /* CONST  */
    VOID = 310,                    /* VOID  */
    FLOAT = 311,                   /* FLOAT  */
    DOUBLE = 312,                  /* DOUBLE  */
    BOOL = 313,                    /* BOOL  */
    TRUE = 314,                    /* TRUE  */
    FALSE = 315,                   /* FALSE  */
    IF = 316,                      /* IF  */
    ELSE = 317,                    /* ELSE  */
    SWITCH = 318,                  /* SWITCH  */
    CASE = 319,                    /* CASE  */
    DEFAULT = 320,                 /* DEFAULT  */
    FOR = 321,                     /* FOR  */
    DO = 322,                      /* DO  */
    WHILE = 323,                   /* WHILE  */
    CONTINUE = 324,                /* CONTINUE  */
    BREAK = 325,                   /* BREAK  */
    RETURN = 326,                  /* RETURN  */
    STRUCT = 327,                  /* STRUCT  */
    UNION = 328,                   /* UNION  */
    ENUM = 329,                    /* ENUM  */
    SIZEOF = 330,                  /* SIZEOF  */
    IDENTIFIER = 331,              /* IDENTIFIER  */
    CHARACTER = 332,               /* CHARACTER  */
    INTEGER = 333,                 /* INTEGER  */
    UINTEGER = 334,                /* UINTEGER  */
    LONGVAL = 335,                 /* LONGVAL  */
    ULONGVAL = 336,                /* ULONGVAL  */
    FLOATVAL = 337,                /* FLOATVAL  */
    DOUBLEVAL = 338,               /* DOUBLEVAL  */
    STRING = 339                   /* STRING  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 27 "Parser.y"

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

#line 220 "Parser.hpp"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;

int yyparse (void);


#endif /* !YY_YY_PARSER_HPP_INCLUDED  */
