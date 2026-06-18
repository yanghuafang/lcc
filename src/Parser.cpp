/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 3 "Parser.y"

#include "AbstractSyntaxTree.hpp"

#include <iostream>

#include <stdio.h>

void yyerror(const char* s) {
    printf("ERROR: %s\n", s);
}

int yylex(void);

AST::Program* g_root;

#line 87 "Parser.cpp"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "Parser.hpp"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_COMMA = 3,                      /* COMMA  */
  YYSYMBOL_COLON = 4,                      /* COLON  */
  YYSYMBOL_SEMICOLON = 5,                  /* SEMICOLON  */
  YYSYMBOL_QUESTION = 6,                   /* QUESTION  */
  YYSYMBOL_ELLIPSES = 7,                   /* ELLIPSES  */
  YYSYMBOL_DOT = 8,                        /* DOT  */
  YYSYMBOL_ASTERISK = 9,                   /* ASTERISK  */
  YYSYMBOL_AMPERSAND = 10,                 /* AMPERSAND  */
  YYSYMBOL_ARROW = 11,                     /* ARROW  */
  YYSYMBOL_LPARENTHESES = 12,              /* LPARENTHESES  */
  YYSYMBOL_RPARENTHESES = 13,              /* RPARENTHESES  */
  YYSYMBOL_LBRACKET = 14,                  /* LBRACKET  */
  YYSYMBOL_RBRACKET = 15,                  /* RBRACKET  */
  YYSYMBOL_LBRACE = 16,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 17,                    /* RBRACE  */
  YYSYMBOL_ASSIGN = 18,                    /* ASSIGN  */
  YYSYMBOL_ADD = 19,                       /* ADD  */
  YYSYMBOL_SUB = 20,                       /* SUB  */
  YYSYMBOL_DIV = 21,                       /* DIV  */
  YYSYMBOL_MOD = 22,                       /* MOD  */
  YYSYMBOL_DADD = 23,                      /* DADD  */
  YYSYMBOL_DSUB = 24,                      /* DSUB  */
  YYSYMBOL_ADDEQ = 25,                     /* ADDEQ  */
  YYSYMBOL_SUBEQ = 26,                     /* SUBEQ  */
  YYSYMBOL_MULEQ = 27,                     /* MULEQ  */
  YYSYMBOL_DIVEQ = 28,                     /* DIVEQ  */
  YYSYMBOL_MODEQ = 29,                     /* MODEQ  */
  YYSYMBOL_BOR = 30,                       /* BOR  */
  YYSYMBOL_BXOR = 31,                      /* BXOR  */
  YYSYMBOL_BNOT = 32,                      /* BNOT  */
  YYSYMBOL_BANDEQ = 33,                    /* BANDEQ  */
  YYSYMBOL_BOREQ = 34,                     /* BOREQ  */
  YYSYMBOL_BXOREQ = 35,                    /* BXOREQ  */
  YYSYMBOL_SHL = 36,                       /* SHL  */
  YYSYMBOL_SHR = 37,                       /* SHR  */
  YYSYMBOL_SHLEQ = 38,                     /* SHLEQ  */
  YYSYMBOL_SHREQ = 39,                     /* SHREQ  */
  YYSYMBOL_AND = 40,                       /* AND  */
  YYSYMBOL_OR = 41,                        /* OR  */
  YYSYMBOL_NOT = 42,                       /* NOT  */
  YYSYMBOL_EQ = 43,                        /* EQ  */
  YYSYMBOL_NEQ = 44,                       /* NEQ  */
  YYSYMBOL_GT = 45,                        /* GT  */
  YYSYMBOL_GE = 46,                        /* GE  */
  YYSYMBOL_LT = 47,                        /* LT  */
  YYSYMBOL_LE = 48,                        /* LE  */
  YYSYMBOL_CHAR = 49,                      /* CHAR  */
  YYSYMBOL_SHORT = 50,                     /* SHORT  */
  YYSYMBOL_INT = 51,                       /* INT  */
  YYSYMBOL_LONG = 52,                      /* LONG  */
  YYSYMBOL_UNSIGNED = 53,                  /* UNSIGNED  */
  YYSYMBOL_CONST = 54,                     /* CONST  */
  YYSYMBOL_VOID = 55,                      /* VOID  */
  YYSYMBOL_FLOAT = 56,                     /* FLOAT  */
  YYSYMBOL_DOUBLE = 57,                    /* DOUBLE  */
  YYSYMBOL_BOOL = 58,                      /* BOOL  */
  YYSYMBOL_TRUE = 59,                      /* TRUE  */
  YYSYMBOL_FALSE = 60,                     /* FALSE  */
  YYSYMBOL_IF = 61,                        /* IF  */
  YYSYMBOL_ELSE = 62,                      /* ELSE  */
  YYSYMBOL_SWITCH = 63,                    /* SWITCH  */
  YYSYMBOL_CASE = 64,                      /* CASE  */
  YYSYMBOL_DEFAULT = 65,                   /* DEFAULT  */
  YYSYMBOL_FOR = 66,                       /* FOR  */
  YYSYMBOL_DO = 67,                        /* DO  */
  YYSYMBOL_WHILE = 68,                     /* WHILE  */
  YYSYMBOL_CONTINUE = 69,                  /* CONTINUE  */
  YYSYMBOL_BREAK = 70,                     /* BREAK  */
  YYSYMBOL_RETURN = 71,                    /* RETURN  */
  YYSYMBOL_STRUCT = 72,                    /* STRUCT  */
  YYSYMBOL_UNION = 73,                     /* UNION  */
  YYSYMBOL_ENUM = 74,                      /* ENUM  */
  YYSYMBOL_SIZEOF = 75,                    /* SIZEOF  */
  YYSYMBOL_IDENTIFIER = 76,                /* IDENTIFIER  */
  YYSYMBOL_CHARACTER = 77,                 /* CHARACTER  */
  YYSYMBOL_INTEGER = 78,                   /* INTEGER  */
  YYSYMBOL_UINTEGER = 79,                  /* UINTEGER  */
  YYSYMBOL_LONGVAL = 80,                   /* LONGVAL  */
  YYSYMBOL_ULONGVAL = 81,                  /* ULONGVAL  */
  YYSYMBOL_FLOATVAL = 82,                  /* FLOATVAL  */
  YYSYMBOL_DOUBLEVAL = 83,                 /* DOUBLEVAL  */
  YYSYMBOL_STRING = 84,                    /* STRING  */
  YYSYMBOL_YYACCEPT = 85,                  /* $accept  */
  YYSYMBOL_Program = 86,                   /* Program  */
  YYSYMBOL_Decls = 87,                     /* Decls  */
  YYSYMBOL_Decl = 88,                      /* Decl  */
  YYSYMBOL_FuncDecl = 89,                  /* FuncDecl  */
  YYSYMBOL_FuncBody = 90,                  /* FuncBody  */
  YYSYMBOL_VarDecl = 91,                   /* VarDecl  */
  YYSYMBOL_TypeDecl = 92,                  /* TypeDecl  */
  YYSYMBOL_VarType = 93,                   /* VarType  */
  YYSYMBOL__VarType = 94,                  /* _VarType  */
  YYSYMBOL_VarList = 95,                   /* VarList  */
  YYSYMBOL_VarInit = 96,                   /* VarInit  */
  YYSYMBOL_InitList = 97,                  /* InitList  */
  YYSYMBOL_ArrayBoundList = 98,            /* ArrayBoundList  */
  YYSYMBOL_ArrayBound = 99,                /* ArrayBound  */
  YYSYMBOL_ParamList = 100,                /* ParamList  */
  YYSYMBOL_Param = 101,                    /* Param  */
  YYSYMBOL_BuiltinType = 102,              /* BuiltinType  */
  YYSYMBOL_FieldDecls = 103,               /* FieldDecls  */
  YYSYMBOL_FieldDecl = 104,                /* FieldDecl  */
  YYSYMBOL_MemberList = 105,               /* MemberList  */
  YYSYMBOL_EnumList = 106,                 /* EnumList  */
  YYSYMBOL_Enum = 107,                     /* Enum  */
  YYSYMBOL_Stmts = 108,                    /* Stmts  */
  YYSYMBOL_Stmt = 109,                     /* Stmt  */
  YYSYMBOL_IfStmt = 110,                   /* IfStmt  */
  YYSYMBOL_SwitchStmt = 111,               /* SwitchStmt  */
  YYSYMBOL_CaseStmtList = 112,             /* CaseStmtList  */
  YYSYMBOL_CaseStmt = 113,                 /* CaseStmt  */
  YYSYMBOL_ForStmt = 114,                  /* ForStmt  */
  YYSYMBOL_DoStmt = 115,                   /* DoStmt  */
  YYSYMBOL_WhileStmt = 116,                /* WhileStmt  */
  YYSYMBOL_ContinueStmt = 117,             /* ContinueStmt  */
  YYSYMBOL_BreakStmt = 118,                /* BreakStmt  */
  YYSYMBOL_ReturnStmt = 119,               /* ReturnStmt  */
  YYSYMBOL_Block = 120,                    /* Block  */
  YYSYMBOL_Expr = 121,                     /* Expr  */
  YYSYMBOL_ExprList = 122,                 /* ExprList  */
  YYSYMBOL_Constant = 123                  /* Constant  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_int16 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if 1

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* 1 */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL \
             && defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
  YYLTYPE yyls_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE) \
             + YYSIZEOF (YYLTYPE)) \
      + 2 * YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   2153

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  85
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  39
/* YYNRULES -- Number of rules.  */
#define YYNRULES  162
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  300

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   339


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   219,   219,   222,   223,   226,   227,   228,   231,   233,
     237,   240,   244,   249,   250,   253,   254,   256,   258,   260,
     261,   267,   269,   270,   275,   277,   279,   282,   290,   292,
     300,   302,   304,   307,   313,   315,   317,   318,   319,   325,
     326,   330,   331,   332,   333,   334,   335,   336,   337,   338,
     339,   340,   341,   342,   347,   349,   352,   354,   359,   361,
     362,   367,   369,   370,   373,   374,   380,   381,   384,   385,
     386,   387,   388,   389,   390,   391,   392,   393,   394,   395,
     396,   399,   401,   407,   412,   414,   417,   419,   423,   425,
     427,   431,   435,   440,   443,   446,   447,   451,   458,   459,
     460,   462,   463,   465,   467,   469,   471,   473,   475,   477,
     479,   481,   483,   485,   487,   488,   490,   492,   494,   495,
     496,   498,   500,   502,   504,   505,   506,   507,   508,   509,
     511,   512,   513,   514,   515,   516,   517,   518,   519,   520,
     521,   522,   523,   524,   525,   526,   527,   528,   529,   530,
     534,   536,   537,   540,   541,   542,   543,   544,   545,   546,
     547,   548,   549
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if 1
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "COMMA", "COLON",
  "SEMICOLON", "QUESTION", "ELLIPSES", "DOT", "ASTERISK", "AMPERSAND",
  "ARROW", "LPARENTHESES", "RPARENTHESES", "LBRACKET", "RBRACKET",
  "LBRACE", "RBRACE", "ASSIGN", "ADD", "SUB", "DIV", "MOD", "DADD", "DSUB",
  "ADDEQ", "SUBEQ", "MULEQ", "DIVEQ", "MODEQ", "BOR", "BXOR", "BNOT",
  "BANDEQ", "BOREQ", "BXOREQ", "SHL", "SHR", "SHLEQ", "SHREQ", "AND", "OR",
  "NOT", "EQ", "NEQ", "GT", "GE", "LT", "LE", "CHAR", "SHORT", "INT",
  "LONG", "UNSIGNED", "CONST", "VOID", "FLOAT", "DOUBLE", "BOOL", "TRUE",
  "FALSE", "IF", "ELSE", "SWITCH", "CASE", "DEFAULT", "FOR", "DO", "WHILE",
  "CONTINUE", "BREAK", "RETURN", "STRUCT", "UNION", "ENUM", "SIZEOF",
  "IDENTIFIER", "CHARACTER", "INTEGER", "UINTEGER", "LONGVAL", "ULONGVAL",
  "FLOATVAL", "DOUBLEVAL", "STRING", "$accept", "Program", "Decls", "Decl",
  "FuncDecl", "FuncBody", "VarDecl", "TypeDecl", "VarType", "_VarType",
  "VarList", "VarInit", "InitList", "ArrayBoundList", "ArrayBound",
  "ParamList", "Param", "BuiltinType", "FieldDecls", "FieldDecl",
  "MemberList", "EnumList", "Enum", "Stmts", "Stmt", "IfStmt",
  "SwitchStmt", "CaseStmtList", "CaseStmt", "ForStmt", "DoStmt",
  "WhileStmt", "ContinueStmt", "BreakStmt", "ReturnStmt", "Block", "Expr",
  "ExprList", "Constant", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-174)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-21)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
    -174,     8,  2049,  -174,  -174,  -174,  -174,  -174,    97,  2077,
    -174,  -174,  -174,  -174,   -62,   -39,   -33,  -174,  -174,  -174,
    -174,  -174,   -25,     4,  -174,  -174,  -174,  -174,  -174,    50,
      48,    51,    57,    24,    43,  -174,  -174,  -174,  -174,  -174,
      31,   919,     6,    -7,  -174,    38,  -174,   103,   891,    91,
       0,  -174,  -174,    40,    50,     2,  -174,   109,   776,  -174,
     104,  -174,  -174,  -174,    52,  -174,  -174,    56,    31,  -174,
    -174,   929,    16,  -174,   878,   878,   624,   802,   878,   878,
     878,   878,   878,   878,  -174,  -174,   119,   121,  -174,  -174,
    -174,  -174,  -174,  -174,  -174,  -174,  1826,  -174,  -174,    55,
    -174,  -174,  -174,  -174,  -174,  -174,  -174,   157,   157,     7,
     117,  1001,  -174,     1,  1826,   157,   157,   157,   157,   157,
     157,   700,   878,   878,   878,    59,   878,   878,    62,   878,
     878,   878,   878,   878,   878,  -174,  -174,   878,   878,   878,
     878,   878,   878,   878,   878,   878,   878,   878,   878,   878,
     878,   878,   878,   878,   878,   878,   878,   878,   878,    67,
    -174,   228,   878,  -174,   878,  -174,    53,   138,  1047,  1826,
      32,  1826,  1093,  -174,   157,  2031,  -174,  1139,  1826,   118,
     118,   157,   157,  1826,  1826,  1826,  1826,  1826,  1949,  1990,
    1826,  1826,  1826,    33,    33,  1826,  1826,  1908,  1867,  2072,
    2072,   188,   188,   188,   188,  -174,  -174,  -174,  -174,   150,
     151,   154,   388,   155,   164,   165,   548,  -174,  -174,    38,
    -174,  -174,  -174,  -174,  -174,  -174,  -174,  -174,  -174,  -174,
    1185,   157,  1826,  -174,  -174,  -174,   878,  -174,   878,  -174,
     308,   878,   878,   468,   105,   878,  -174,  -174,  -174,  1231,
    -174,  1826,   555,  -174,  1277,  1323,   878,   878,  1369,   160,
    1415,  -174,   388,   158,  1461,  1507,   878,   878,   388,   116,
    -174,   878,   878,  1553,  1599,  -174,   388,   -15,  1645,  1691,
     878,   177,  -174,  -174,   878,   179,  -174,   388,   388,  1737,
    -174,  1783,  -174,  -174,  -174,   388,  -174,   388,  -174,   388
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       4,     0,     2,     1,    41,    42,    43,    44,    45,     0,
      53,    50,    51,    52,     0,     0,     0,    20,     3,     5,
       6,     7,    23,    13,    15,    46,    47,    48,    49,    14,
       0,     0,     0,    32,     0,    22,    12,    19,    55,    55,
      63,    38,     0,    24,    31,     0,    11,     0,     0,    64,
       0,    62,    37,    40,    13,     0,    36,     0,     0,    30,
      32,    21,    57,    16,    60,    54,    17,     0,     0,    18,
      39,     0,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   161,   162,     0,    98,   153,   154,
     155,   156,   157,   158,   159,   160,    25,    99,    59,     0,
      65,    61,    35,    34,     8,    67,     9,   112,   113,    98,
       0,     0,    27,     0,    29,   110,   111,   122,   123,   132,
     142,     0,   152,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   120,   121,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      56,     0,     0,   100,     0,    26,    98,     0,     0,   151,
       0,   101,     0,   103,   117,   129,   104,     0,   114,   115,
     116,   118,   119,   124,   125,   126,   127,   128,   130,   131,
     133,   134,   135,   136,   137,   138,   139,   140,   141,   143,
     144,   147,   148,   145,   146,    58,    80,    67,    10,     0,
       0,     0,     0,     0,     0,     0,     0,    79,    78,    23,
      66,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,   106,    28,   109,   107,   108,     0,   102,     0,   105,
       0,     0,     0,     0,     0,     0,    93,    94,    95,     0,
      68,   150,   149,    97,     0,     0,     0,     0,     0,     0,
       0,    96,     0,     0,     0,     0,     0,     0,     0,    82,
      85,     0,     0,     0,     0,    92,     0,     0,     0,     0,
       0,     0,    81,    83,     0,     0,    84,     0,     0,     0,
      91,     0,    67,    89,    90,     0,    67,    87,    88,    86
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -174,  -174,  -174,  -174,  -174,  -174,    -2,   183,    74,    -8,
    -174,   142,  -174,  -174,   145,  -174,   123,  -174,   153,  -174,
    -174,  -174,   130,  -173,  -151,  -174,  -174,  -174,  -174,  -174,
    -174,  -174,  -174,  -174,  -174,  -174,   -52,  -174,  -174
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
       0,     1,     2,    18,    19,   106,   217,   218,   219,    23,
      34,    35,   113,    43,    44,    55,    56,    24,    47,    65,
      99,    50,    51,   161,   220,   221,   222,   277,   286,   223,
     224,   225,   226,   227,   228,   229,   230,   170,    97
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      20,    29,   283,    68,   164,    71,    96,    42,     3,    36,
     -20,    58,   -20,    37,    30,    72,   -20,    69,   165,   122,
     -20,   104,   107,   108,   111,   114,   115,   116,   117,   118,
     119,   120,   105,    54,   240,   236,    41,    31,    42,    54,
      54,   125,   126,    32,   128,   237,    45,   129,    46,   284,
     285,    33,   131,   132,   133,   134,   135,   136,   159,    37,
     160,   244,   -20,    54,    38,   122,   233,    39,    54,   168,
     169,   171,   172,    40,   174,   175,    22,   177,   178,   179,
     180,   181,   182,   -20,    57,   183,   184,   185,   186,   187,
     188,   189,   190,   191,   192,   193,   194,   195,   196,   197,
     198,   199,   200,   201,   202,   203,   204,    49,    62,    67,
     231,   269,   232,    54,    60,    53,    70,   275,    42,   297,
      63,    64,    64,   299,    73,   282,   125,   126,    98,   128,
     162,   121,   129,   122,   100,   173,   293,   294,   176,   133,
     134,   135,   136,   205,   298,    53,    25,    26,    27,    28,
     110,   234,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,   241,   242,   249,   125,   243,   245,   128,   246,
     247,   129,   267,   259,   270,    14,    15,    16,   276,    17,
     135,   136,   290,   292,   251,    21,   252,    61,    59,   254,
     255,   258,    48,   260,   103,   167,   125,   126,   101,   128,
       0,     0,   129,     0,   264,   265,     0,   131,   132,   133,
     134,   135,   136,     0,   273,   274,     0,     0,     0,   278,
     279,     0,     0,     0,   147,   148,     0,     0,   289,     0,
       0,     0,   291,   206,     0,    54,     0,    74,    75,     0,
      76,   257,     0,     0,   207,   208,     0,    78,    79,     0,
       0,    80,    81,     0,     0,     0,     0,     0,     0,     0,
      82,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      83,     0,     0,     0,     0,     0,     0,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    84,    85,   209,
       0,   210,     0,     0,   211,   212,   213,   214,   215,   216,
      14,    15,    16,    86,   109,    88,    89,    90,    91,    92,
      93,    94,    95,   206,     0,     0,     0,    74,    75,     0,
      76,     0,     0,     0,   207,   253,     0,    78,    79,     0,
       0,    80,    81,     0,     0,     0,     0,     0,     0,     0,
      82,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      83,     0,     0,     0,     0,     0,     0,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    84,    85,   209,
       0,   210,     0,     0,   211,   212,   213,   214,   215,   216,
      14,    15,    16,    86,   109,    88,    89,    90,    91,    92,
      93,    94,    95,   206,     0,     0,     0,    74,    75,     0,
      76,     0,     0,     0,   207,     0,     0,    78,    79,     0,
       0,    80,    81,     0,     0,     0,     0,     0,     0,     0,
      82,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      83,     0,     0,     0,     0,     0,     0,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    84,    85,   209,
       0,   210,     0,     0,   211,   212,   213,   214,   215,   216,
      14,    15,    16,    86,   109,    88,    89,    90,    91,    92,
      93,    94,    95,   256,     0,     0,     0,    74,    75,     0,
      76,     0,     0,     0,     0,     0,     0,    78,    79,     0,
       0,    80,    81,     0,     0,     0,     0,     0,     0,     0,
      82,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      83,     0,     0,     0,     0,     0,     0,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    84,    85,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      14,    15,    16,    86,   109,    88,    89,    90,    91,    92,
      93,    94,    95,   248,     0,     0,     0,    74,    75,     0,
      76,   124,     0,   125,   126,   127,   128,    78,    79,   129,
       0,    80,    81,     0,   131,   132,   133,   134,   135,   136,
      82,     0,     0,     0,     0,   142,   143,     0,     0,     0,
      83,   147,   148,     0,     0,   151,   152,     0,   153,   154,
     155,   156,   157,   158,     0,     0,     0,    84,    85,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    74,    75,     0,    76,     0,     0,     0,
       0,     0,     0,    78,    79,     0,     0,    80,    81,     0,
       0,     0,     0,     0,     0,     0,    82,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    83,     0,     0,     0,
       0,     0,     0,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    84,    85,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    14,    15,    16,    86,
     109,    88,    89,    90,    91,    92,    93,    94,    95,    74,
      75,     0,    76,     0,     0,     0,     0,     0,     0,    78,
      79,     0,     0,    80,    81,     0,     0,     0,     0,     0,
       0,     0,    82,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    83,     0,     0,     0,     0,     0,     0,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    84,
      85,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    14,    15,    16,    86,   166,    88,    89,    90,
      91,    92,    93,    94,    95,    74,    75,     0,    76,     0,
       0,     0,    77,     0,     0,    78,    79,     0,     0,    80,
      81,     0,     0,     0,     0,     0,     0,     0,    82,     0,
       0,    74,    75,     0,    76,     0,     0,     0,    83,   112,
       0,    78,    79,     0,     0,    80,    81,     0,     0,     0,
       0,     0,     0,     0,    82,    84,    85,     0,     0,     0,
       0,     0,     0,     0,    83,     0,     0,     0,     0,     0,
       0,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    84,    85,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    74,    75,     0,
      76,     0,     0,     0,     0,     0,    62,    78,    79,     0,
       0,    80,    81,     0,     0,     0,     0,     0,    66,     0,
      82,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      83,     0,     0,     0,     0,     0,    52,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   102,    84,    85,     0,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
       0,     0,     0,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    14,    15,    16,     0,    17,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,     0,     0,
       0,    14,    15,    16,     0,    17,     0,     0,     0,     0,
       0,    14,    15,    16,   123,    17,     0,   124,     0,   125,
     126,   127,   128,     0,   163,   129,     0,     0,     0,   130,
     131,   132,   133,   134,   135,   136,   137,   138,   139,   140,
     141,   142,   143,     0,   144,   145,   146,   147,   148,   149,
     150,   151,   152,     0,   153,   154,   155,   156,   157,   158,
     123,     0,     0,   124,     0,   125,   126,   127,   128,     0,
     235,   129,     0,     0,     0,   130,   131,   132,   133,   134,
     135,   136,   137,   138,   139,   140,   141,   142,   143,     0,
     144,   145,   146,   147,   148,   149,   150,   151,   152,     0,
     153,   154,   155,   156,   157,   158,   123,   238,     0,   124,
       0,   125,   126,   127,   128,     0,     0,   129,     0,     0,
       0,   130,   131,   132,   133,   134,   135,   136,   137,   138,
     139,   140,   141,   142,   143,     0,   144,   145,   146,   147,
     148,   149,   150,   151,   152,     0,   153,   154,   155,   156,
     157,   158,   123,     0,     0,   124,     0,   125,   126,   127,
     128,     0,     0,   129,   239,     0,     0,   130,   131,   132,
     133,   134,   135,   136,   137,   138,   139,   140,   141,   142,
     143,     0,   144,   145,   146,   147,   148,   149,   150,   151,
     152,     0,   153,   154,   155,   156,   157,   158,   123,     0,
     250,   124,     0,   125,   126,   127,   128,     0,     0,   129,
       0,     0,     0,   130,   131,   132,   133,   134,   135,   136,
     137,   138,   139,   140,   141,   142,   143,     0,   144,   145,
     146,   147,   148,   149,   150,   151,   152,     0,   153,   154,
     155,   156,   157,   158,   123,     0,   261,   124,     0,   125,
     126,   127,   128,     0,     0,   129,     0,     0,     0,   130,
     131,   132,   133,   134,   135,   136,   137,   138,   139,   140,
     141,   142,   143,     0,   144,   145,   146,   147,   148,   149,
     150,   151,   152,     0,   153,   154,   155,   156,   157,   158,
     123,     0,     0,   124,     0,   125,   126,   127,   128,     0,
     262,   129,     0,     0,     0,   130,   131,   132,   133,   134,
     135,   136,   137,   138,   139,   140,   141,   142,   143,     0,
     144,   145,   146,   147,   148,   149,   150,   151,   152,     0,
     153,   154,   155,   156,   157,   158,   123,     0,     0,   124,
       0,   125,   126,   127,   128,     0,   263,   129,     0,     0,
       0,   130,   131,   132,   133,   134,   135,   136,   137,   138,
     139,   140,   141,   142,   143,     0,   144,   145,   146,   147,
     148,   149,   150,   151,   152,     0,   153,   154,   155,   156,
     157,   158,   123,     0,   266,   124,     0,   125,   126,   127,
     128,     0,     0,   129,     0,     0,     0,   130,   131,   132,
     133,   134,   135,   136,   137,   138,   139,   140,   141,   142,
     143,     0,   144,   145,   146,   147,   148,   149,   150,   151,
     152,     0,   153,   154,   155,   156,   157,   158,   123,     0,
       0,   124,     0,   125,   126,   127,   128,     0,   268,   129,
       0,     0,     0,   130,   131,   132,   133,   134,   135,   136,
     137,   138,   139,   140,   141,   142,   143,     0,   144,   145,
     146,   147,   148,   149,   150,   151,   152,     0,   153,   154,
     155,   156,   157,   158,   123,     0,   271,   124,     0,   125,
     126,   127,   128,     0,     0,   129,     0,     0,     0,   130,
     131,   132,   133,   134,   135,   136,   137,   138,   139,   140,
     141,   142,   143,     0,   144,   145,   146,   147,   148,   149,
     150,   151,   152,     0,   153,   154,   155,   156,   157,   158,
     123,     0,   272,   124,     0,   125,   126,   127,   128,     0,
       0,   129,     0,     0,     0,   130,   131,   132,   133,   134,
     135,   136,   137,   138,   139,   140,   141,   142,   143,     0,
     144,   145,   146,   147,   148,   149,   150,   151,   152,     0,
     153,   154,   155,   156,   157,   158,   123,     0,   280,   124,
       0,   125,   126,   127,   128,     0,     0,   129,     0,     0,
       0,   130,   131,   132,   133,   134,   135,   136,   137,   138,
     139,   140,   141,   142,   143,     0,   144,   145,   146,   147,
     148,   149,   150,   151,   152,     0,   153,   154,   155,   156,
     157,   158,   123,     0,     0,   124,     0,   125,   126,   127,
     128,     0,   281,   129,     0,     0,     0,   130,   131,   132,
     133,   134,   135,   136,   137,   138,   139,   140,   141,   142,
     143,     0,   144,   145,   146,   147,   148,   149,   150,   151,
     152,     0,   153,   154,   155,   156,   157,   158,   123,     0,
       0,   124,     0,   125,   126,   127,   128,     0,   287,   129,
       0,     0,     0,   130,   131,   132,   133,   134,   135,   136,
     137,   138,   139,   140,   141,   142,   143,     0,   144,   145,
     146,   147,   148,   149,   150,   151,   152,     0,   153,   154,
     155,   156,   157,   158,   123,     0,     0,   124,     0,   125,
     126,   127,   128,     0,   288,   129,     0,     0,     0,   130,
     131,   132,   133,   134,   135,   136,   137,   138,   139,   140,
     141,   142,   143,     0,   144,   145,   146,   147,   148,   149,
     150,   151,   152,     0,   153,   154,   155,   156,   157,   158,
     123,     0,     0,   124,     0,   125,   126,   127,   128,     0,
     295,   129,     0,     0,     0,   130,   131,   132,   133,   134,
     135,   136,   137,   138,   139,   140,   141,   142,   143,     0,
     144,   145,   146,   147,   148,   149,   150,   151,   152,     0,
     153,   154,   155,   156,   157,   158,   123,   296,     0,   124,
       0,   125,   126,   127,   128,     0,     0,   129,     0,     0,
       0,   130,   131,   132,   133,   134,   135,   136,   137,   138,
     139,   140,   141,   142,   143,     0,   144,   145,   146,   147,
     148,   149,   150,   151,   152,     0,   153,   154,   155,   156,
     157,   158,   124,     0,   125,   126,   127,   128,     0,     0,
     129,     0,     0,     0,   130,   131,   132,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,     0,   144,
     145,   146,   147,   148,   149,   150,   151,   152,     0,   153,
     154,   155,   156,   157,   158,   125,   126,   127,   128,     0,
       0,   129,     0,     0,     0,     0,   131,   132,   133,   134,
     135,   136,     0,     0,     0,     0,     0,   142,   143,     0,
       0,     0,     0,   147,   148,     0,     0,   151,     0,     0,
     153,   154,   155,   156,   157,   158,   125,   126,   127,   128,
       0,     0,   129,     0,     0,     0,     0,   131,   132,   133,
     134,   135,   136,     0,     0,     0,     0,     0,   142,   143,
       0,     0,     0,     0,   147,   148,     0,     0,     0,     0,
       0,   153,   154,   155,   156,   157,   158,   125,   126,   127,
     128,     0,     0,   129,     0,     0,     0,     0,   131,   132,
     133,   134,   135,   136,     0,     0,     0,     0,     0,     0,
     143,     0,     0,     0,     0,   147,   148,     0,     0,     0,
       0,     0,   153,   154,   155,   156,   157,   158,   125,   126,
     127,   128,     0,     0,   129,     0,     0,     0,     0,   131,
     132,   133,   134,   135,   136,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   147,   148,     0,     0,
       0,     0,     0,   153,   154,   155,   156,   157,   158,   125,
     126,     0,   128,     0,     0,   129,     0,     0,     0,     0,
     131,   132,   133,   134,   135,   136,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   147,   148,     0,
       0,     0,     0,     0,   153,   154,   155,   156,   157,   158,
     125,   126,     0,   128,     0,     0,   129,     0,     0,     0,
       0,   131,   132,   133,   134,   135,   136,     0,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,   147,   148,
       0,     0,     0,     0,     0,     0,     0,   155,   156,   157,
     158,    14,    15,    16,     0,    17,     4,     5,     6,     7,
       8,     0,    10,    11,    12,    13,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    14,
      15,    16,     0,    17
};

static const yytype_int16 yycheck[] =
{
       2,     9,    17,     3,     3,     3,    58,    14,     0,     5,
       3,    18,     5,     9,    76,    13,     9,    17,    17,    12,
      13,     5,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    16,    41,   207,     3,    12,    76,    14,    47,
      48,     8,     9,    76,    11,    13,     3,    14,     5,    64,
      65,    76,    19,    20,    21,    22,    23,    24,     3,     9,
       5,   212,     9,    71,    16,    12,    13,    16,    76,   121,
     122,   123,   124,    16,   126,   127,     2,   129,   130,   131,
     132,   133,   134,    76,    78,   137,   138,   139,   140,   141,
     142,   143,   144,   145,   146,   147,   148,   149,   150,   151,
     152,   153,   154,   155,   156,   157,   158,    76,     5,    18,
     162,   262,   164,   121,    76,    41,    76,   268,    14,   292,
      17,    47,    48,   296,    15,   276,     8,     9,    76,    11,
      13,    12,    14,    12,    78,    76,   287,   288,    76,    21,
      22,    23,    24,    76,   295,    71,    49,    50,    51,    52,
      76,    13,    49,    50,    51,    52,    53,    54,    55,    56,
      57,    58,    12,    12,   216,     8,    12,    12,    11,     5,
       5,    14,    12,    68,    16,    72,    73,    74,    62,    76,
      23,    24,     5,     4,   236,     2,   238,    45,    43,   241,
     242,   243,    39,   245,    71,   121,     8,     9,    68,    11,
      -1,    -1,    14,    -1,   256,   257,    -1,    19,    20,    21,
      22,    23,    24,    -1,   266,   267,    -1,    -1,    -1,   271,
     272,    -1,    -1,    -1,    36,    37,    -1,    -1,   280,    -1,
      -1,    -1,   284,     5,    -1,   243,    -1,     9,    10,    -1,
      12,   243,    -1,    -1,    16,    17,    -1,    19,    20,    -1,
      -1,    23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      32,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      42,    -1,    -1,    -1,    -1,    -1,    -1,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      -1,    63,    -1,    -1,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,     5,    -1,    -1,    -1,     9,    10,    -1,
      12,    -1,    -1,    -1,    16,    17,    -1,    19,    20,    -1,
      -1,    23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      32,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      42,    -1,    -1,    -1,    -1,    -1,    -1,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      -1,    63,    -1,    -1,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,     5,    -1,    -1,    -1,     9,    10,    -1,
      12,    -1,    -1,    -1,    16,    -1,    -1,    19,    20,    -1,
      -1,    23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      32,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      42,    -1,    -1,    -1,    -1,    -1,    -1,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      -1,    63,    -1,    -1,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,     5,    -1,    -1,    -1,     9,    10,    -1,
      12,    -1,    -1,    -1,    -1,    -1,    -1,    19,    20,    -1,
      -1,    23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      32,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      42,    -1,    -1,    -1,    -1,    -1,    -1,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,     5,    -1,    -1,    -1,     9,    10,    -1,
      12,     6,    -1,     8,     9,    10,    11,    19,    20,    14,
      -1,    23,    24,    -1,    19,    20,    21,    22,    23,    24,
      32,    -1,    -1,    -1,    -1,    30,    31,    -1,    -1,    -1,
      42,    36,    37,    -1,    -1,    40,    41,    -1,    43,    44,
      45,    46,    47,    48,    -1,    -1,    -1,    59,    60,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,     9,    10,    -1,    12,    -1,    -1,    -1,
      -1,    -1,    -1,    19,    20,    -1,    -1,    23,    24,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    32,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,
      -1,    -1,    -1,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,     9,
      10,    -1,    12,    -1,    -1,    -1,    -1,    -1,    -1,    19,
      20,    -1,    -1,    23,    24,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    32,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,    -1,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,    83,    84,     9,    10,    -1,    12,    -1,
      -1,    -1,    16,    -1,    -1,    19,    20,    -1,    -1,    23,
      24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    32,    -1,
      -1,     9,    10,    -1,    12,    -1,    -1,    -1,    42,    17,
      -1,    19,    20,    -1,    -1,    23,    24,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    32,    59,    60,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    59,    60,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,     9,    10,    -1,
      12,    -1,    -1,    -1,    -1,    -1,     5,    19,    20,    -1,
      -1,    23,    24,    -1,    -1,    -1,    -1,    -1,    17,    -1,
      32,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      42,    -1,    -1,    -1,    -1,    -1,     7,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     7,    59,    60,    -1,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      -1,    -1,    -1,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,    72,    73,    74,    -1,    76,    49,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    49,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    -1,    -1,
      -1,    72,    73,    74,    -1,    76,    -1,    -1,    -1,    -1,
      -1,    72,    73,    74,     3,    76,    -1,     6,    -1,     8,
       9,    10,    11,    -1,    13,    14,    -1,    -1,    -1,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    -1,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    -1,    43,    44,    45,    46,    47,    48,
       3,    -1,    -1,     6,    -1,     8,     9,    10,    11,    -1,
      13,    14,    -1,    -1,    -1,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    -1,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    -1,
      43,    44,    45,    46,    47,    48,     3,     4,    -1,     6,
      -1,     8,     9,    10,    11,    -1,    -1,    14,    -1,    -1,
      -1,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    -1,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    -1,    43,    44,    45,    46,
      47,    48,     3,    -1,    -1,     6,    -1,     8,     9,    10,
      11,    -1,    -1,    14,    15,    -1,    -1,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    -1,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    -1,    43,    44,    45,    46,    47,    48,     3,    -1,
       5,     6,    -1,     8,     9,    10,    11,    -1,    -1,    14,
      -1,    -1,    -1,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    -1,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    -1,    43,    44,
      45,    46,    47,    48,     3,    -1,     5,     6,    -1,     8,
       9,    10,    11,    -1,    -1,    14,    -1,    -1,    -1,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    -1,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    -1,    43,    44,    45,    46,    47,    48,
       3,    -1,    -1,     6,    -1,     8,     9,    10,    11,    -1,
      13,    14,    -1,    -1,    -1,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    -1,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    -1,
      43,    44,    45,    46,    47,    48,     3,    -1,    -1,     6,
      -1,     8,     9,    10,    11,    -1,    13,    14,    -1,    -1,
      -1,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    -1,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    -1,    43,    44,    45,    46,
      47,    48,     3,    -1,     5,     6,    -1,     8,     9,    10,
      11,    -1,    -1,    14,    -1,    -1,    -1,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    -1,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    -1,    43,    44,    45,    46,    47,    48,     3,    -1,
      -1,     6,    -1,     8,     9,    10,    11,    -1,    13,    14,
      -1,    -1,    -1,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    -1,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    -1,    43,    44,
      45,    46,    47,    48,     3,    -1,     5,     6,    -1,     8,
       9,    10,    11,    -1,    -1,    14,    -1,    -1,    -1,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    -1,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    -1,    43,    44,    45,    46,    47,    48,
       3,    -1,     5,     6,    -1,     8,     9,    10,    11,    -1,
      -1,    14,    -1,    -1,    -1,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    -1,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    -1,
      43,    44,    45,    46,    47,    48,     3,    -1,     5,     6,
      -1,     8,     9,    10,    11,    -1,    -1,    14,    -1,    -1,
      -1,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    -1,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    -1,    43,    44,    45,    46,
      47,    48,     3,    -1,    -1,     6,    -1,     8,     9,    10,
      11,    -1,    13,    14,    -1,    -1,    -1,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    -1,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    -1,    43,    44,    45,    46,    47,    48,     3,    -1,
      -1,     6,    -1,     8,     9,    10,    11,    -1,    13,    14,
      -1,    -1,    -1,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    -1,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    -1,    43,    44,
      45,    46,    47,    48,     3,    -1,    -1,     6,    -1,     8,
       9,    10,    11,    -1,    13,    14,    -1,    -1,    -1,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    -1,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    -1,    43,    44,    45,    46,    47,    48,
       3,    -1,    -1,     6,    -1,     8,     9,    10,    11,    -1,
      13,    14,    -1,    -1,    -1,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    -1,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    -1,
      43,    44,    45,    46,    47,    48,     3,     4,    -1,     6,
      -1,     8,     9,    10,    11,    -1,    -1,    14,    -1,    -1,
      -1,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    -1,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    -1,    43,    44,    45,    46,
      47,    48,     6,    -1,     8,     9,    10,    11,    -1,    -1,
      14,    -1,    -1,    -1,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    -1,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    -1,    43,
      44,    45,    46,    47,    48,     8,     9,    10,    11,    -1,
      -1,    14,    -1,    -1,    -1,    -1,    19,    20,    21,    22,
      23,    24,    -1,    -1,    -1,    -1,    -1,    30,    31,    -1,
      -1,    -1,    -1,    36,    37,    -1,    -1,    40,    -1,    -1,
      43,    44,    45,    46,    47,    48,     8,     9,    10,    11,
      -1,    -1,    14,    -1,    -1,    -1,    -1,    19,    20,    21,
      22,    23,    24,    -1,    -1,    -1,    -1,    -1,    30,    31,
      -1,    -1,    -1,    -1,    36,    37,    -1,    -1,    -1,    -1,
      -1,    43,    44,    45,    46,    47,    48,     8,     9,    10,
      11,    -1,    -1,    14,    -1,    -1,    -1,    -1,    19,    20,
      21,    22,    23,    24,    -1,    -1,    -1,    -1,    -1,    -1,
      31,    -1,    -1,    -1,    -1,    36,    37,    -1,    -1,    -1,
      -1,    -1,    43,    44,    45,    46,    47,    48,     8,     9,
      10,    11,    -1,    -1,    14,    -1,    -1,    -1,    -1,    19,
      20,    21,    22,    23,    24,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    36,    37,    -1,    -1,
      -1,    -1,    -1,    43,    44,    45,    46,    47,    48,     8,
       9,    -1,    11,    -1,    -1,    14,    -1,    -1,    -1,    -1,
      19,    20,    21,    22,    23,    24,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    36,    37,    -1,
      -1,    -1,    -1,    -1,    43,    44,    45,    46,    47,    48,
       8,     9,    -1,    11,    -1,    -1,    14,    -1,    -1,    -1,
      -1,    19,    20,    21,    22,    23,    24,    -1,    49,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    36,    37,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    45,    46,    47,
      48,    72,    73,    74,    -1,    76,    49,    50,    51,    52,
      53,    -1,    55,    56,    57,    58,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    72,
      73,    74,    -1,    76
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    86,    87,     0,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    72,    73,    74,    76,    88,    89,
      91,    92,    93,    94,   102,    49,    50,    51,    52,    94,
      76,    76,    76,    76,    95,    96,     5,     9,    16,    16,
      16,    12,    14,    98,    99,     3,     5,   103,   103,    76,
     106,   107,     7,    93,    94,   100,   101,    78,    18,    99,
      76,    96,     5,    17,    93,   104,    17,    18,     3,    17,
      76,     3,    13,    15,     9,    10,    12,    16,    19,    20,
      23,    24,    32,    42,    59,    60,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,   121,   123,    76,   105,
      78,   107,     7,   101,     5,    16,    90,   121,   121,    76,
      93,   121,    17,    97,   121,   121,   121,   121,   121,   121,
     121,    12,    12,     3,     6,     8,     9,    10,    11,    14,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    43,    44,    45,    46,    47,    48,     3,
       5,   108,    13,    13,     3,    17,    76,    93,   121,   121,
     122,   121,   121,    76,   121,   121,    76,   121,   121,   121,
     121,   121,   121,   121,   121,   121,   121,   121,   121,   121,
     121,   121,   121,   121,   121,   121,   121,   121,   121,   121,
     121,   121,   121,   121,   121,    76,     5,    16,    17,    61,
      63,    66,    67,    68,    69,    70,    71,    91,    92,    93,
     109,   110,   111,   114,   115,   116,   117,   118,   119,   120,
     121,   121,   121,    13,    13,    13,     3,    13,     4,    15,
     108,    12,    12,    12,   109,    12,     5,     5,     5,   121,
       5,   121,   121,    17,   121,   121,     5,    91,   121,    68,
     121,     5,    13,    13,   121,   121,     5,    12,    13,   109,
      16,     5,     5,   121,   121,   109,    62,   112,   121,   121,
       5,    13,   109,    17,    64,    65,   113,    13,    13,   121,
       5,   121,     4,   109,   109,    13,     4,   108,   109,   108
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    85,    86,    87,    87,    88,    88,    88,    89,    89,
      90,    91,    92,    93,    93,    94,    94,    94,    94,    94,
      94,    95,    95,    95,    96,    96,    96,    96,    97,    97,
      98,    98,    98,    99,   100,   100,   100,   100,   100,   101,
     101,   102,   102,   102,   102,   102,   102,   102,   102,   102,
     102,   102,   102,   102,   103,   103,   104,   104,   105,   105,
     105,   106,   106,   106,   107,   107,   108,   108,   109,   109,
     109,   109,   109,   109,   109,   109,   109,   109,   109,   109,
     109,   110,   110,   111,   112,   112,   113,   113,   114,   114,
     114,   115,   116,   117,   118,   119,   119,   120,   121,   121,
     121,   121,   121,   121,   121,   121,   121,   121,   121,   121,
     121,   121,   121,   121,   121,   121,   121,   121,   121,   121,
     121,   121,   121,   121,   121,   121,   121,   121,   121,   121,
     121,   121,   121,   121,   121,   121,   121,   121,   121,   121,
     121,   121,   121,   121,   121,   121,   121,   121,   121,   121,
     122,   122,   122,   123,   123,   123,   123,   123,   123,   123,
     123,   123,   123
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     0,     1,     1,     1,     6,     6,
       3,     3,     2,     1,     2,     1,     5,     5,     5,     2,
       1,     3,     1,     0,     2,     4,     6,     5,     3,     1,
       2,     1,     0,     3,     3,     3,     1,     1,     0,     2,
       1,     1,     1,     1,     1,     1,     2,     2,     2,     2,
       1,     1,     1,     1,     2,     0,     3,     1,     3,     1,
       0,     3,     1,     0,     1,     3,     2,     0,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     7,     5,     7,     2,     0,     4,     3,     9,     8,
       8,     7,     5,     2,     2,     2,     3,     3,     1,     1,
       3,     3,     4,     3,     3,     4,     4,     4,     4,     4,
       2,     2,     2,     2,     3,     3,     3,     3,     3,     3,
       2,     2,     2,     2,     3,     3,     3,     3,     3,     3,
       3,     3,     2,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     2,     3,     3,     3,     3,     3,     3,     5,
       3,     1,     0,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF

/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)                                \
    do                                                                  \
      if (N)                                                            \
        {                                                               \
          (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;        \
          (Current).first_column = YYRHSLOC (Rhs, 1).first_column;      \
          (Current).last_line    = YYRHSLOC (Rhs, N).last_line;         \
          (Current).last_column  = YYRHSLOC (Rhs, N).last_column;       \
        }                                                               \
      else                                                              \
        {                                                               \
          (Current).first_line   = (Current).last_line   =              \
            YYRHSLOC (Rhs, 0).last_line;                                \
          (Current).first_column = (Current).last_column =              \
            YYRHSLOC (Rhs, 0).last_column;                              \
        }                                                               \
    while (0)
#endif

#define YYRHSLOC(Rhs, K) ((Rhs)[K])


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)


/* YYLOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

# ifndef YYLOCATION_PRINT

#  if defined YY_LOCATION_PRINT

   /* Temporary convenience wrapper in case some people defined the
      undocumented and private YY_LOCATION_PRINT macros.  */
#   define YYLOCATION_PRINT(File, Loc)  YY_LOCATION_PRINT(File, *(Loc))

#  elif defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL

/* Print *YYLOCP on YYO.  Private, do not rely on its existence. */

YY_ATTRIBUTE_UNUSED
static int
yy_location_print_ (FILE *yyo, YYLTYPE const * const yylocp)
{
  int res = 0;
  int end_col = 0 != yylocp->last_column ? yylocp->last_column - 1 : 0;
  if (0 <= yylocp->first_line)
    {
      res += YYFPRINTF (yyo, "%d", yylocp->first_line);
      if (0 <= yylocp->first_column)
        res += YYFPRINTF (yyo, ".%d", yylocp->first_column);
    }
  if (0 <= yylocp->last_line)
    {
      if (yylocp->first_line < yylocp->last_line)
        {
          res += YYFPRINTF (yyo, "-%d", yylocp->last_line);
          if (0 <= end_col)
            res += YYFPRINTF (yyo, ".%d", end_col);
        }
      else if (0 <= end_col && yylocp->first_column < end_col)
        res += YYFPRINTF (yyo, "-%d", end_col);
    }
  return res;
}

#   define YYLOCATION_PRINT  yy_location_print_

    /* Temporary convenience wrapper in case some people defined the
       undocumented and private YY_LOCATION_PRINT macros.  */
#   define YY_LOCATION_PRINT(File, Loc)  YYLOCATION_PRINT(File, &(Loc))

#  else

#   define YYLOCATION_PRINT(File, Loc) ((void) 0)
    /* Temporary convenience wrapper in case some people defined the
       undocumented and private YY_LOCATION_PRINT macros.  */
#   define YY_LOCATION_PRINT  YYLOCATION_PRINT

#  endif
# endif /* !defined YYLOCATION_PRINT */


# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value, Location); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  YY_USE (yylocationp);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  YYLOCATION_PRINT (yyo, yylocationp);
  YYFPRINTF (yyo, ": ");
  yy_symbol_value_print (yyo, yykind, yyvaluep, yylocationp);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp, YYLTYPE *yylsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)],
                       &(yylsp[(yyi + 1) - (yynrhs)]));
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, yylsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


/* Context of a parse error.  */
typedef struct
{
  yy_state_t *yyssp;
  yysymbol_kind_t yytoken;
  YYLTYPE *yylloc;
} yypcontext_t;

/* Put in YYARG at most YYARGN of the expected tokens given the
   current YYCTX, and return the number of tokens stored in YYARG.  If
   YYARG is null, return the number of expected tokens (guaranteed to
   be less than YYNTOKENS).  Return YYENOMEM on memory exhaustion.
   Return 0 if there are more than YYARGN expected tokens, yet fill
   YYARG up to YYARGN. */
static int
yypcontext_expected_tokens (const yypcontext_t *yyctx,
                            yysymbol_kind_t yyarg[], int yyargn)
{
  /* Actual size of YYARG. */
  int yycount = 0;
  int yyn = yypact[+*yyctx->yyssp];
  if (!yypact_value_is_default (yyn))
    {
      /* Start YYX at -YYN if negative to avoid negative indexes in
         YYCHECK.  In other words, skip the first -YYN actions for
         this state because they are default actions.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;
      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yyx;
      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
        if (yycheck[yyx + yyn] == yyx && yyx != YYSYMBOL_YYerror
            && !yytable_value_is_error (yytable[yyx + yyn]))
          {
            if (!yyarg)
              ++yycount;
            else if (yycount == yyargn)
              return 0;
            else
              yyarg[yycount++] = YY_CAST (yysymbol_kind_t, yyx);
          }
    }
  if (yyarg && yycount == 0 && 0 < yyargn)
    yyarg[0] = YYSYMBOL_YYEMPTY;
  return yycount;
}




#ifndef yystrlen
# if defined __GLIBC__ && defined _STRING_H
#  define yystrlen(S) (YY_CAST (YYPTRDIFF_T, strlen (S)))
# else
/* Return the length of YYSTR.  */
static YYPTRDIFF_T
yystrlen (const char *yystr)
{
  YYPTRDIFF_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
# endif
#endif

#ifndef yystpcpy
# if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#  define yystpcpy stpcpy
# else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
# endif
#endif

#ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYPTRDIFF_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYPTRDIFF_T yyn = 0;
      char const *yyp = yystr;
      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            else
              goto append;

          append:
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (yyres)
    return yystpcpy (yyres, yystr) - yyres;
  else
    return yystrlen (yystr);
}
#endif


static int
yy_syntax_error_arguments (const yypcontext_t *yyctx,
                           yysymbol_kind_t yyarg[], int yyargn)
{
  /* Actual size of YYARG. */
  int yycount = 0;
  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yyctx->yytoken != YYSYMBOL_YYEMPTY)
    {
      int yyn;
      if (yyarg)
        yyarg[yycount] = yyctx->yytoken;
      ++yycount;
      yyn = yypcontext_expected_tokens (yyctx,
                                        yyarg ? yyarg + 1 : yyarg, yyargn - 1);
      if (yyn == YYENOMEM)
        return YYENOMEM;
      else
        yycount += yyn;
    }
  return yycount;
}

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return -1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return YYENOMEM if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYPTRDIFF_T *yymsg_alloc, char **yymsg,
                const yypcontext_t *yyctx)
{
  enum { YYARGS_MAX = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat: reported tokens (one for the "unexpected",
     one per "expected"). */
  yysymbol_kind_t yyarg[YYARGS_MAX];
  /* Cumulated lengths of YYARG.  */
  YYPTRDIFF_T yysize = 0;

  /* Actual size of YYARG. */
  int yycount = yy_syntax_error_arguments (yyctx, yyarg, YYARGS_MAX);
  if (yycount == YYENOMEM)
    return YYENOMEM;

  switch (yycount)
    {
#define YYCASE_(N, S)                       \
      case N:                               \
        yyformat = S;                       \
        break
    default: /* Avoid compiler warnings. */
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
#undef YYCASE_
    }

  /* Compute error message size.  Don't count the "%s"s, but reserve
     room for the terminator.  */
  yysize = yystrlen (yyformat) - 2 * yycount + 1;
  {
    int yyi;
    for (yyi = 0; yyi < yycount; ++yyi)
      {
        YYPTRDIFF_T yysize1
          = yysize + yytnamerr (YY_NULLPTR, yytname[yyarg[yyi]]);
        if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
          yysize = yysize1;
        else
          return YYENOMEM;
      }
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return -1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yytname[yyarg[yyi++]]);
          yyformat += 2;
        }
      else
        {
          ++yyp;
          ++yyformat;
        }
  }
  return 0;
}


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep, YYLTYPE *yylocationp)
{
  YY_USE (yyvaluep);
  YY_USE (yylocationp);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Location data for the lookahead symbol.  */
YYLTYPE yylloc
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
  = { 1, 1, 1, 1 }
# endif
;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

    /* The location stack: array, bottom, top.  */
    YYLTYPE yylsa[YYINITDEPTH];
    YYLTYPE *yyls = yylsa;
    YYLTYPE *yylsp = yyls;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

  /* The locations where the error started and ended.  */
  YYLTYPE yyerror_range[3];

  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYPTRDIFF_T yymsg_alloc = sizeof yymsgbuf;

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  yylsp[0] = yylloc;
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;
        YYLTYPE *yyls1 = yyls;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yyls1, yysize * YYSIZEOF (*yylsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
        yyls = yyls1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
        YYSTACK_RELOCATE (yyls_alloc, yyls);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
      yylsp = yyls + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      yyerror_range[1] = yylloc;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END
  *++yylsp = yylloc;

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

  /* Default location. */
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
  yyerror_range[1] = yyloc;
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* Program: Decls  */
#line 219 "Parser.y"
                                { (yyval.program) = new AST::Program((yyvsp[0].decls)); g_root = (yyval.program); }
#line 2166 "Parser.cpp"
    break;

  case 3: /* Decls: Decls Decl  */
#line 222 "Parser.y"
                                { (yyval.decls) = (yyvsp[-1].decls); (yyval.decls)->push_back((yyvsp[0].decl)); }
#line 2172 "Parser.cpp"
    break;

  case 4: /* Decls: %empty  */
#line 223 "Parser.y"
                                { (yyval.decls) = new AST::Decls(); }
#line 2178 "Parser.cpp"
    break;

  case 5: /* Decl: FuncDecl  */
#line 226 "Parser.y"
                                { (yyval.decl) = (yyvsp[0].funcDecl); }
#line 2184 "Parser.cpp"
    break;

  case 6: /* Decl: VarDecl  */
#line 227 "Parser.y"
                                { (yyval.decl) = (yyvsp[0].varDecl); }
#line 2190 "Parser.cpp"
    break;

  case 7: /* Decl: TypeDecl  */
#line 228 "Parser.y"
                                { (yyval.decl) = (yyvsp[0].typeDecl); }
#line 2196 "Parser.cpp"
    break;

  case 8: /* FuncDecl: VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES SEMICOLON  */
#line 232 "Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList)); }
#line 2202 "Parser.cpp"
    break;

  case 9: /* FuncDecl: VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES FuncBody  */
#line 234 "Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList), (yyvsp[0].funcBody)); }
#line 2208 "Parser.cpp"
    break;

  case 10: /* FuncBody: LBRACE Stmts RBRACE  */
#line 237 "Parser.y"
                                { (yyval.funcBody) = new AST::FuncBody((yyvsp[-1].stmts)); }
#line 2214 "Parser.cpp"
    break;

  case 11: /* VarDecl: VarType VarList SEMICOLON  */
#line 241 "Parser.y"
                                { (yyval.varDecl) = new AST::VarDecl((yyvsp[-2].varType), (yyvsp[-1].varList)); }
#line 2220 "Parser.cpp"
    break;

  case 12: /* TypeDecl: _VarType SEMICOLON  */
#line 244 "Parser.y"
                                { (yyval.typeDecl) = new AST::TypeDecl((yyvsp[-1].varType)); }
#line 2226 "Parser.cpp"
    break;

  case 13: /* VarType: _VarType  */
#line 249 "Parser.y"
                                { (yyval.varType) = (yyvsp[0].varType); }
#line 2232 "Parser.cpp"
    break;

  case 14: /* VarType: CONST _VarType  */
#line 250 "Parser.y"
                                { (yyval.varType) = (yyvsp[0].varType); (yyval.varType)->setConst(); }
#line 2238 "Parser.cpp"
    break;

  case 15: /* _VarType: BuiltinType  */
#line 253 "Parser.y"
                                { (yyval.varType) = (yyvsp[0].builtinType); }
#line 2244 "Parser.cpp"
    break;

  case 16: /* _VarType: STRUCT IDENTIFIER LBRACE FieldDecls RBRACE  */
#line 255 "Parser.y"
                                { (yyval.varType) = new AST::StructType((yyvsp[-1].fieldDecls), *(yyvsp[-3].idVal)); }
#line 2250 "Parser.cpp"
    break;

  case 17: /* _VarType: UNION IDENTIFIER LBRACE FieldDecls RBRACE  */
#line 257 "Parser.y"
                                { (yyval.varType) = new AST::UnionType((yyvsp[-1].fieldDecls), *(yyvsp[-3].idVal)); }
#line 2256 "Parser.cpp"
    break;

  case 18: /* _VarType: ENUM IDENTIFIER LBRACE EnumList RBRACE  */
#line 259 "Parser.y"
                                { (yyval.varType) = new AST::EnumType((yyvsp[-1].enumList), *(yyvsp[-3].idVal)); }
#line 2262 "Parser.cpp"
    break;

  case 19: /* _VarType: _VarType ASTERISK  */
#line 260 "Parser.y"
                                { (yyval.varType) = new AST::PointerType((yyvsp[-1].varType)); }
#line 2268 "Parser.cpp"
    break;

  case 20: /* _VarType: IDENTIFIER  */
#line 261 "Parser.y"
                                { (yyval.varType) = new AST::DefinedType(*(yyvsp[0].idVal)); }
#line 2274 "Parser.cpp"
    break;

  case 21: /* VarList: VarList COMMA VarInit  */
#line 268 "Parser.y"
                                { (yyval.varList) = (yyvsp[-2].varList); (yyval.varList)->push_back((yyvsp[0].varInit)); }
#line 2280 "Parser.cpp"
    break;

  case 22: /* VarList: VarInit  */
#line 269 "Parser.y"
                                { (yyval.varList) = new AST::VarList(); (yyval.varList)->push_back((yyvsp[0].varInit)); }
#line 2286 "Parser.cpp"
    break;

  case 23: /* VarList: %empty  */
#line 270 "Parser.y"
                                { (yyval.varList) = new AST::VarList(); }
#line 2292 "Parser.cpp"
    break;

  case 24: /* VarInit: IDENTIFIER ArrayBoundList  */
#line 276 "Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-1].idVal), *(yyvsp[0].arrayBoundList)); delete (yyvsp[0].arrayBoundList); }
#line 2298 "Parser.cpp"
    break;

  case 25: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN Expr  */
#line 278 "Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-3].idVal), *(yyvsp[-2].arrayBoundList), (yyvsp[0].expr)); delete (yyvsp[-2].arrayBoundList); }
#line 2304 "Parser.cpp"
    break;

  case 26: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN LBRACE InitList RBRACE  */
#line 280 "Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-5].idVal), *(yyvsp[-4].arrayBoundList), nullptr, (yyvsp[-1].exprList));
                                  delete (yyvsp[-4].arrayBoundList); }
#line 2311 "Parser.cpp"
    break;

  case 27: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN LBRACE RBRACE  */
#line 283 "Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-4].idVal), *(yyvsp[-3].arrayBoundList), nullptr,
                                                        new AST::InitList());
                                  delete (yyvsp[-3].arrayBoundList); }
#line 2319 "Parser.cpp"
    break;

  case 28: /* InitList: InitList COMMA Expr  */
#line 291 "Parser.y"
                                { (yyval.exprList) = (yyvsp[-2].exprList); (yyval.exprList)->push_back((yyvsp[0].expr)); }
#line 2325 "Parser.cpp"
    break;

  case 29: /* InitList: Expr  */
#line 293 "Parser.y"
                                { (yyval.exprList) = new AST::InitList(); (yyval.exprList)->push_back((yyvsp[0].expr)); }
#line 2331 "Parser.cpp"
    break;

  case 30: /* ArrayBoundList: ArrayBoundList ArrayBound  */
#line 301 "Parser.y"
                                { (yyval.arrayBoundList) = (yyvsp[-1].arrayBoundList); (yyval.arrayBoundList)->push_back((yyvsp[0].intVal)); }
#line 2337 "Parser.cpp"
    break;

  case 31: /* ArrayBoundList: ArrayBound  */
#line 303 "Parser.y"
                                { (yyval.arrayBoundList) = new std::vector<size_t>(); (yyval.arrayBoundList)->push_back((yyvsp[0].intVal)); }
#line 2343 "Parser.cpp"
    break;

  case 32: /* ArrayBoundList: %empty  */
#line 304 "Parser.y"
                                { (yyval.arrayBoundList) = new std::vector<size_t>(); }
#line 2349 "Parser.cpp"
    break;

  case 33: /* ArrayBound: LBRACKET INTEGER RBRACKET  */
#line 308 "Parser.y"
                                { (yyval.intVal) = (yyvsp[-1].intVal); }
#line 2355 "Parser.cpp"
    break;

  case 34: /* ParamList: ParamList COMMA Param  */
#line 314 "Parser.y"
                                { (yyval.paramList) = (yyvsp[-2].paramList); (yyval.paramList)->push_back((yyvsp[0].param)); }
#line 2361 "Parser.cpp"
    break;

  case 35: /* ParamList: ParamList COMMA ELLIPSES  */
#line 316 "Parser.y"
                                { (yyval.paramList) = (yyvsp[-2].paramList); (yyval.paramList)->setVariant(); }
#line 2367 "Parser.cpp"
    break;

  case 36: /* ParamList: Param  */
#line 317 "Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); (yyval.paramList)->push_back((yyvsp[0].param)); }
#line 2373 "Parser.cpp"
    break;

  case 37: /* ParamList: ELLIPSES  */
#line 318 "Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); (yyval.paramList)->setVariant(); }
#line 2379 "Parser.cpp"
    break;

  case 38: /* ParamList: %empty  */
#line 319 "Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); }
#line 2385 "Parser.cpp"
    break;

  case 39: /* Param: VarType IDENTIFIER  */
#line 325 "Parser.y"
                                { (yyval.param) = new AST::Param((yyvsp[-1].varType), *(yyvsp[0].idVal)); }
#line 2391 "Parser.cpp"
    break;

  case 40: /* Param: VarType  */
#line 326 "Parser.y"
                                { (yyval.param) = new AST::Param((yyvsp[0].varType)); }
#line 2397 "Parser.cpp"
    break;

  case 41: /* BuiltinType: CHAR  */
#line 330 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::CHAR, "char"); }
#line 2403 "Parser.cpp"
    break;

  case 42: /* BuiltinType: SHORT  */
#line 331 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::SHORT, "short"); }
#line 2409 "Parser.cpp"
    break;

  case 43: /* BuiltinType: INT  */
#line 332 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::INT, "int"); }
#line 2415 "Parser.cpp"
    break;

  case 44: /* BuiltinType: LONG  */
#line 333 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::LONG, "long"); }
#line 2421 "Parser.cpp"
    break;

  case 45: /* BuiltinType: UNSIGNED  */
#line 334 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::UINT, "uint"); }
#line 2427 "Parser.cpp"
    break;

  case 46: /* BuiltinType: UNSIGNED CHAR  */
#line 335 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::UCHAR, "uchar"); }
#line 2433 "Parser.cpp"
    break;

  case 47: /* BuiltinType: UNSIGNED SHORT  */
#line 336 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::USHORT, "ushort"); }
#line 2439 "Parser.cpp"
    break;

  case 48: /* BuiltinType: UNSIGNED INT  */
#line 337 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::UINT, "uint"); }
#line 2445 "Parser.cpp"
    break;

  case 49: /* BuiltinType: UNSIGNED LONG  */
#line 338 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::ULONG, "ulong"); }
#line 2451 "Parser.cpp"
    break;

  case 50: /* BuiltinType: FLOAT  */
#line 339 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::FLOAT, "float"); }
#line 2457 "Parser.cpp"
    break;

  case 51: /* BuiltinType: DOUBLE  */
#line 340 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::DOUBLE, "double"); }
#line 2463 "Parser.cpp"
    break;

  case 52: /* BuiltinType: BOOL  */
#line 341 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::BOOL, "bool"); }
#line 2469 "Parser.cpp"
    break;

  case 53: /* BuiltinType: VOID  */
#line 342 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::VOID, "void"); }
#line 2475 "Parser.cpp"
    break;

  case 54: /* FieldDecls: FieldDecls FieldDecl  */
#line 348 "Parser.y"
                                { (yyval.fieldDecls) = (yyvsp[-1].fieldDecls); if ((yyvsp[0].fieldDecl) != NULL) (yyval.fieldDecls)->push_back((yyvsp[0].fieldDecl)); }
#line 2481 "Parser.cpp"
    break;

  case 55: /* FieldDecls: %empty  */
#line 349 "Parser.y"
                                { (yyval.fieldDecls) = new AST::FieldDecls(); }
#line 2487 "Parser.cpp"
    break;

  case 56: /* FieldDecl: VarType MemberList SEMICOLON  */
#line 353 "Parser.y"
                                { (yyval.fieldDecl) = new AST::FieldDecl((yyvsp[-2].varType), (yyvsp[-1].memberList)); }
#line 2493 "Parser.cpp"
    break;

  case 57: /* FieldDecl: SEMICOLON  */
#line 354 "Parser.y"
                                { (yyval.fieldDecl) = NULL; }
#line 2499 "Parser.cpp"
    break;

  case 58: /* MemberList: MemberList COMMA IDENTIFIER  */
#line 360 "Parser.y"
                                { (yyval.memberList) = (yyvsp[-2].memberList); (yyval.memberList)->push_back(*(yyvsp[0].idVal)); }
#line 2505 "Parser.cpp"
    break;

  case 59: /* MemberList: IDENTIFIER  */
#line 361 "Parser.y"
                                { (yyval.memberList) = new AST::MemberList(); (yyval.memberList)->push_back(*(yyvsp[0].idVal)); }
#line 2511 "Parser.cpp"
    break;

  case 60: /* MemberList: %empty  */
#line 362 "Parser.y"
                                { (yyval.memberList) = new AST::MemberList(); }
#line 2517 "Parser.cpp"
    break;

  case 61: /* EnumList: EnumList COMMA Enum  */
#line 368 "Parser.y"
                                { (yyval.enumList) = (yyvsp[-2].enumList); (yyval.enumList)->push_back((yyvsp[0].enumeration)); }
#line 2523 "Parser.cpp"
    break;

  case 62: /* EnumList: Enum  */
#line 369 "Parser.y"
                                { (yyval.enumList) = new AST::EnumList(); (yyval.enumList)->push_back((yyvsp[0].enumeration)); }
#line 2529 "Parser.cpp"
    break;

  case 63: /* EnumList: %empty  */
#line 370 "Parser.y"
                                { (yyval.enumList) = new AST::EnumList(); }
#line 2535 "Parser.cpp"
    break;

  case 64: /* Enum: IDENTIFIER  */
#line 373 "Parser.y"
                                { (yyval.enumeration) = new AST::Enum(*(yyvsp[0].idVal)); }
#line 2541 "Parser.cpp"
    break;

  case 65: /* Enum: IDENTIFIER ASSIGN INTEGER  */
#line 375 "Parser.y"
                                { (yyval.enumeration) = new AST::Enum(*(yyvsp[-2].idVal), true, (yyvsp[0].intVal)); }
#line 2547 "Parser.cpp"
    break;

  case 66: /* Stmts: Stmts Stmt  */
#line 380 "Parser.y"
                                { (yyval.stmts) = (yyvsp[-1].stmts); if ((yyvsp[0].stmt) != NULL) (yyval.stmts)->push_back((yyvsp[0].stmt)); }
#line 2553 "Parser.cpp"
    break;

  case 67: /* Stmts: %empty  */
#line 381 "Parser.y"
                                { (yyval.stmts) = new AST::Stmts(); }
#line 2559 "Parser.cpp"
    break;

  case 68: /* Stmt: Expr SEMICOLON  */
#line 384 "Parser.y"
                                { (yyval.stmt) = (yyvsp[-1].expr); }
#line 2565 "Parser.cpp"
    break;

  case 69: /* Stmt: IfStmt  */
#line 385 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].ifStmt); }
#line 2571 "Parser.cpp"
    break;

  case 70: /* Stmt: SwitchStmt  */
#line 386 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].switchStmt); }
#line 2577 "Parser.cpp"
    break;

  case 71: /* Stmt: ForStmt  */
#line 387 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].forStmt); }
#line 2583 "Parser.cpp"
    break;

  case 72: /* Stmt: DoStmt  */
#line 388 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].doStmt); }
#line 2589 "Parser.cpp"
    break;

  case 73: /* Stmt: WhileStmt  */
#line 389 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].whileStmt); }
#line 2595 "Parser.cpp"
    break;

  case 74: /* Stmt: ContinueStmt  */
#line 390 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].continueStmt); }
#line 2601 "Parser.cpp"
    break;

  case 75: /* Stmt: BreakStmt  */
#line 391 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].breakStmt); }
#line 2607 "Parser.cpp"
    break;

  case 76: /* Stmt: ReturnStmt  */
#line 392 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].returnStmt); }
#line 2613 "Parser.cpp"
    break;

  case 77: /* Stmt: Block  */
#line 393 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].block); }
#line 2619 "Parser.cpp"
    break;

  case 78: /* Stmt: TypeDecl  */
#line 394 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].typeDecl); }
#line 2625 "Parser.cpp"
    break;

  case 79: /* Stmt: VarDecl  */
#line 395 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].varDecl); }
#line 2631 "Parser.cpp"
    break;

  case 80: /* Stmt: SEMICOLON  */
#line 396 "Parser.y"
                                { (yyval.stmt) = NULL; }
#line 2637 "Parser.cpp"
    break;

  case 81: /* IfStmt: IF LPARENTHESES Expr RPARENTHESES Stmt ELSE Stmt  */
#line 400 "Parser.y"
                                { (yyval.ifStmt) = new AST::IfStmt((yyvsp[-4].expr), (yyvsp[-2].stmt), (yyvsp[0].stmt)); }
#line 2643 "Parser.cpp"
    break;

  case 82: /* IfStmt: IF LPARENTHESES Expr RPARENTHESES Stmt  */
#line 402 "Parser.y"
                                { (yyval.ifStmt) = new AST::IfStmt((yyvsp[-2].expr), (yyvsp[0].stmt)); }
#line 2649 "Parser.cpp"
    break;

  case 83: /* SwitchStmt: SWITCH LPARENTHESES Expr RPARENTHESES LBRACE CaseStmtList RBRACE  */
#line 408 "Parser.y"
                                { (yyval.switchStmt) = new AST::SwitchStmt((yyvsp[-4].expr), (yyvsp[-1].caseStmtList)); }
#line 2655 "Parser.cpp"
    break;

  case 84: /* CaseStmtList: CaseStmtList CaseStmt  */
#line 413 "Parser.y"
                                { (yyval.caseStmtList) = (yyvsp[-1].caseStmtList); (yyval.caseStmtList)->push_back((yyvsp[0].caseStmt)); }
#line 2661 "Parser.cpp"
    break;

  case 85: /* CaseStmtList: %empty  */
#line 414 "Parser.y"
                                { (yyval.caseStmtList) = new AST::CaseStmtList(); }
#line 2667 "Parser.cpp"
    break;

  case 86: /* CaseStmt: CASE Expr COLON Stmts  */
#line 418 "Parser.y"
                                { (yyval.caseStmt) = new AST::CaseStmt((yyvsp[-2].expr), (yyvsp[0].stmts)); }
#line 2673 "Parser.cpp"
    break;

  case 87: /* CaseStmt: DEFAULT COLON Stmts  */
#line 420 "Parser.y"
                                { (yyval.caseStmt) = new AST::CaseStmt(NULL, (yyvsp[0].stmts)); }
#line 2679 "Parser.cpp"
    break;

  case 88: /* ForStmt: FOR LPARENTHESES Expr SEMICOLON Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 424 "Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt((yyvsp[-6].expr), (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt)); }
#line 2685 "Parser.cpp"
    break;

  case 89: /* ForStmt: FOR LPARENTHESES SEMICOLON Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 426 "Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt(NULL, (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt)); }
#line 2691 "Parser.cpp"
    break;

  case 90: /* ForStmt: FOR LPARENTHESES VarDecl Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 428 "Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt((yyvsp[-5].varDecl), (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt)); }
#line 2697 "Parser.cpp"
    break;

  case 91: /* DoStmt: DO Stmt WHILE LPARENTHESES Expr RPARENTHESES SEMICOLON  */
#line 432 "Parser.y"
                                { (yyval.doStmt) = new AST::DoStmt((yyvsp[-5].stmt), (yyvsp[-2].expr)); }
#line 2703 "Parser.cpp"
    break;

  case 92: /* WhileStmt: WHILE LPARENTHESES Expr RPARENTHESES Stmt  */
#line 436 "Parser.y"
                                { (yyval.whileStmt) = new AST::WhileStmt((yyvsp[-2].expr), (yyvsp[0].stmt)); }
#line 2709 "Parser.cpp"
    break;

  case 93: /* ContinueStmt: CONTINUE SEMICOLON  */
#line 440 "Parser.y"
                                { (yyval.continueStmt) = new AST::ContinueStmt(); }
#line 2715 "Parser.cpp"
    break;

  case 94: /* BreakStmt: BREAK SEMICOLON  */
#line 443 "Parser.y"
                                { (yyval.breakStmt) = new AST::BreakStmt(); }
#line 2721 "Parser.cpp"
    break;

  case 95: /* ReturnStmt: RETURN SEMICOLON  */
#line 446 "Parser.y"
                                { (yyval.returnStmt) = new AST::ReturnStmt(); }
#line 2727 "Parser.cpp"
    break;

  case 96: /* ReturnStmt: RETURN Expr SEMICOLON  */
#line 448 "Parser.y"
                                { (yyval.returnStmt) = new AST::ReturnStmt((yyvsp[-1].expr)); }
#line 2733 "Parser.cpp"
    break;

  case 97: /* Block: LBRACE Stmts RBRACE  */
#line 451 "Parser.y"
                                { (yyval.block) = new AST::Block((yyvsp[-1].stmts)); }
#line 2739 "Parser.cpp"
    break;

  case 98: /* Expr: IDENTIFIER  */
#line 458 "Parser.y"
                                { (yyval.expr) = new AST::Variable(*(yyvsp[0].idVal)); }
#line 2745 "Parser.cpp"
    break;

  case 99: /* Expr: Constant  */
#line 459 "Parser.y"
                                { (yyval.expr) = (yyvsp[0].constant); }
#line 2751 "Parser.cpp"
    break;

  case 100: /* Expr: LPARENTHESES Expr RPARENTHESES  */
#line 461 "Parser.y"
                                { (yyval.expr) = (yyvsp[-1].expr); }
#line 2757 "Parser.cpp"
    break;

  case 101: /* Expr: Expr COMMA Expr  */
#line 462 "Parser.y"
                                { (yyval.expr) = new AST::CommaExpr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2763 "Parser.cpp"
    break;

  case 102: /* Expr: IDENTIFIER LPARENTHESES ExprList RPARENTHESES  */
#line 464 "Parser.y"
                                { (yyval.expr) = new AST::FuncCall(*(yyvsp[-3].idVal), (yyvsp[-1].exprList)); }
#line 2769 "Parser.cpp"
    break;

  case 103: /* Expr: Expr DOT IDENTIFIER  */
#line 466 "Parser.y"
                                { (yyval.expr) = new AST::StructRef((yyvsp[-2].expr), *(yyvsp[0].idVal)); }
#line 2775 "Parser.cpp"
    break;

  case 104: /* Expr: Expr ARROW IDENTIFIER  */
#line 468 "Parser.y"
                                { (yyval.expr) = new AST::StructDeref((yyvsp[-2].expr), *(yyvsp[0].idVal)); }
#line 2781 "Parser.cpp"
    break;

  case 105: /* Expr: Expr LBRACKET Expr RBRACKET  */
#line 470 "Parser.y"
                                { (yyval.expr) = new AST::Subscript((yyvsp[-3].expr), (yyvsp[-1].expr)); }
#line 2787 "Parser.cpp"
    break;

  case 106: /* Expr: LPARENTHESES VarType RPARENTHESES Expr  */
#line 472 "Parser.y"
                                { (yyval.expr) = new AST::TypeCast((yyvsp[-2].varType), (yyvsp[0].expr)); }
#line 2793 "Parser.cpp"
    break;

  case 107: /* Expr: SIZEOF LPARENTHESES VarType RPARENTHESES  */
#line 474 "Parser.y"
                                { (yyval.expr) = new AST::SizeOf((yyvsp[-1].varType)); }
#line 2799 "Parser.cpp"
    break;

  case 108: /* Expr: SIZEOF LPARENTHESES Expr RPARENTHESES  */
#line 476 "Parser.y"
                                { (yyval.expr) = new AST::SizeOf((yyvsp[-1].expr)); }
#line 2805 "Parser.cpp"
    break;

  case 109: /* Expr: SIZEOF LPARENTHESES IDENTIFIER RPARENTHESES  */
#line 478 "Parser.y"
                                { (yyval.expr) = new AST::SizeOf(*(yyvsp[-1].idVal)); }
#line 2811 "Parser.cpp"
    break;

  case 110: /* Expr: ADD Expr  */
#line 480 "Parser.y"
                                { (yyval.expr) = new AST::UnaryPlus((yyvsp[0].expr)); }
#line 2817 "Parser.cpp"
    break;

  case 111: /* Expr: SUB Expr  */
#line 482 "Parser.y"
                                { (yyval.expr) = new AST::UnaryMinus((yyvsp[0].expr)); }
#line 2823 "Parser.cpp"
    break;

  case 112: /* Expr: ASTERISK Expr  */
#line 484 "Parser.y"
                                { (yyval.expr) = new AST::PointerDeref((yyvsp[0].expr)); }
#line 2829 "Parser.cpp"
    break;

  case 113: /* Expr: AMPERSAND Expr  */
#line 486 "Parser.y"
                                { (yyval.expr) = new AST::AddressOf((yyvsp[0].expr)); }
#line 2835 "Parser.cpp"
    break;

  case 114: /* Expr: Expr ASSIGN Expr  */
#line 487 "Parser.y"
                                { (yyval.expr) = new AST::Assign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2841 "Parser.cpp"
    break;

  case 115: /* Expr: Expr ADD Expr  */
#line 489 "Parser.y"
                                { (yyval.expr) = new AST::Add((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2847 "Parser.cpp"
    break;

  case 116: /* Expr: Expr SUB Expr  */
#line 491 "Parser.y"
                                { (yyval.expr) = new AST::Sub((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2853 "Parser.cpp"
    break;

  case 117: /* Expr: Expr ASTERISK Expr  */
#line 493 "Parser.y"
                                { (yyval.expr) = new AST::Mul((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2859 "Parser.cpp"
    break;

  case 118: /* Expr: Expr DIV Expr  */
#line 494 "Parser.y"
                                { (yyval.expr) = new AST::Div((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2865 "Parser.cpp"
    break;

  case 119: /* Expr: Expr MOD Expr  */
#line 495 "Parser.y"
                                { (yyval.expr) = new AST::Mod((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2871 "Parser.cpp"
    break;

  case 120: /* Expr: Expr DADD  */
#line 497 "Parser.y"
                                { (yyval.expr) = new AST::PostfixInc((yyvsp[-1].expr)); }
#line 2877 "Parser.cpp"
    break;

  case 121: /* Expr: Expr DSUB  */
#line 499 "Parser.y"
                                { (yyval.expr) = new AST::PostfixDec((yyvsp[-1].expr)); }
#line 2883 "Parser.cpp"
    break;

  case 122: /* Expr: DADD Expr  */
#line 501 "Parser.y"
                                { (yyval.expr) = new AST::PrefixInc((yyvsp[0].expr)); }
#line 2889 "Parser.cpp"
    break;

  case 123: /* Expr: DSUB Expr  */
#line 503 "Parser.y"
                                { (yyval.expr) = new AST::PrefixDec((yyvsp[0].expr)); }
#line 2895 "Parser.cpp"
    break;

  case 124: /* Expr: Expr ADDEQ Expr  */
#line 504 "Parser.y"
                                { (yyval.expr) = new AST::AddAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2901 "Parser.cpp"
    break;

  case 125: /* Expr: Expr SUBEQ Expr  */
#line 505 "Parser.y"
                                { (yyval.expr) = new AST::SubAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2907 "Parser.cpp"
    break;

  case 126: /* Expr: Expr MULEQ Expr  */
#line 506 "Parser.y"
                                { (yyval.expr) = new AST::MulAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2913 "Parser.cpp"
    break;

  case 127: /* Expr: Expr DIVEQ Expr  */
#line 507 "Parser.y"
                                { (yyval.expr) = new AST::DivAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2919 "Parser.cpp"
    break;

  case 128: /* Expr: Expr MODEQ Expr  */
#line 508 "Parser.y"
                                { (yyval.expr) = new AST::ModAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2925 "Parser.cpp"
    break;

  case 129: /* Expr: Expr AMPERSAND Expr  */
#line 510 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseAnd((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2931 "Parser.cpp"
    break;

  case 130: /* Expr: Expr BOR Expr  */
#line 511 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseOr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2937 "Parser.cpp"
    break;

  case 131: /* Expr: Expr BXOR Expr  */
#line 512 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseXor((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2943 "Parser.cpp"
    break;

  case 132: /* Expr: BNOT Expr  */
#line 513 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseNot((yyvsp[0].expr)); }
#line 2949 "Parser.cpp"
    break;

  case 133: /* Expr: Expr BANDEQ Expr  */
#line 514 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseAndAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2955 "Parser.cpp"
    break;

  case 134: /* Expr: Expr BOREQ Expr  */
#line 515 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseOrAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2961 "Parser.cpp"
    break;

  case 135: /* Expr: Expr BXOREQ Expr  */
#line 516 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseXorAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2967 "Parser.cpp"
    break;

  case 136: /* Expr: Expr SHL Expr  */
#line 517 "Parser.y"
                                { (yyval.expr) = new AST::LeftShift((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2973 "Parser.cpp"
    break;

  case 137: /* Expr: Expr SHR Expr  */
#line 518 "Parser.y"
                                { (yyval.expr) = new AST::RightShift((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2979 "Parser.cpp"
    break;

  case 138: /* Expr: Expr SHLEQ Expr  */
#line 519 "Parser.y"
                                { (yyval.expr) = new AST::LeftShiftAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2985 "Parser.cpp"
    break;

  case 139: /* Expr: Expr SHREQ Expr  */
#line 520 "Parser.y"
                                { (yyval.expr) = new AST::RightShiftAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2991 "Parser.cpp"
    break;

  case 140: /* Expr: Expr AND Expr  */
#line 521 "Parser.y"
                                { (yyval.expr) = new AST::LogicAnd((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2997 "Parser.cpp"
    break;

  case 141: /* Expr: Expr OR Expr  */
#line 522 "Parser.y"
                                { (yyval.expr) = new AST::LogicOr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3003 "Parser.cpp"
    break;

  case 142: /* Expr: NOT Expr  */
#line 523 "Parser.y"
                                { (yyval.expr) = new AST::LogicNot((yyvsp[0].expr)); }
#line 3009 "Parser.cpp"
    break;

  case 143: /* Expr: Expr EQ Expr  */
#line 524 "Parser.y"
                                { (yyval.expr) = new AST::LogicEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3015 "Parser.cpp"
    break;

  case 144: /* Expr: Expr NEQ Expr  */
#line 525 "Parser.y"
                                { (yyval.expr) = new AST::LogicNotEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3021 "Parser.cpp"
    break;

  case 145: /* Expr: Expr LT Expr  */
#line 526 "Parser.y"
                                { (yyval.expr) = new AST::LogicLessThan((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3027 "Parser.cpp"
    break;

  case 146: /* Expr: Expr LE Expr  */
#line 527 "Parser.y"
                                { (yyval.expr) = new AST::LogicLessEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3033 "Parser.cpp"
    break;

  case 147: /* Expr: Expr GT Expr  */
#line 528 "Parser.y"
                                { (yyval.expr) = new AST::LogicGreaterThan((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3039 "Parser.cpp"
    break;

  case 148: /* Expr: Expr GE Expr  */
#line 529 "Parser.y"
                                { (yyval.expr) = new AST::LogicGreaterEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3045 "Parser.cpp"
    break;

  case 149: /* Expr: Expr QUESTION Expr COLON Expr  */
#line 531 "Parser.y"
                                { (yyval.expr) = new AST::TernaryCondition((yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3051 "Parser.cpp"
    break;

  case 150: /* ExprList: ExprList COMMA Expr  */
#line 535 "Parser.y"
                                { (yyval.exprList) = (yyvsp[-2].exprList); (yyval.exprList)->push_back((yyvsp[0].expr)); }
#line 3057 "Parser.cpp"
    break;

  case 151: /* ExprList: Expr  */
#line 536 "Parser.y"
                                { (yyval.exprList) = new AST::ExprList(); (yyval.exprList)->push_back((yyvsp[0].expr)); }
#line 3063 "Parser.cpp"
    break;

  case 152: /* ExprList: %empty  */
#line 537 "Parser.y"
                                { (yyval.exprList) = new AST::ExprList(); }
#line 3069 "Parser.cpp"
    break;

  case 153: /* Constant: CHARACTER  */
#line 540 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].charVal)); }
#line 3075 "Parser.cpp"
    break;

  case 154: /* Constant: INTEGER  */
#line 541 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].intVal)); }
#line 3081 "Parser.cpp"
    break;

  case 155: /* Constant: UINTEGER  */
#line 542 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].uintVal)); }
#line 3087 "Parser.cpp"
    break;

  case 156: /* Constant: LONGVAL  */
#line 543 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].longVal)); }
#line 3093 "Parser.cpp"
    break;

  case 157: /* Constant: ULONGVAL  */
#line 544 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].ulongVal)); }
#line 3099 "Parser.cpp"
    break;

  case 158: /* Constant: FLOATVAL  */
#line 545 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].floatVal)); }
#line 3105 "Parser.cpp"
    break;

  case 159: /* Constant: DOUBLEVAL  */
#line 546 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].doubleVal)); }
#line 3111 "Parser.cpp"
    break;

  case 160: /* Constant: STRING  */
#line 547 "Parser.y"
                                { (yyval.constant) = new AST::ConstStr(*(yyvsp[0].strVal)); }
#line 3117 "Parser.cpp"
    break;

  case 161: /* Constant: TRUE  */
#line 548 "Parser.y"
                                { (yyval.constant) = new AST::Constant(true); }
#line 3123 "Parser.cpp"
    break;

  case 162: /* Constant: FALSE  */
#line 549 "Parser.y"
                                { (yyval.constant) = new AST::Constant(false); }
#line 3129 "Parser.cpp"
    break;


#line 3133 "Parser.cpp"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      {
        yypcontext_t yyctx
          = {yyssp, yytoken, &yylloc};
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = yysyntax_error (&yymsg_alloc, &yymsg, &yyctx);
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == -1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = YY_CAST (char *,
                             YYSTACK_ALLOC (YY_CAST (YYSIZE_T, yymsg_alloc)));
            if (yymsg)
              {
                yysyntax_error_status
                  = yysyntax_error (&yymsg_alloc, &yymsg, &yyctx);
                yymsgp = yymsg;
              }
            else
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = YYENOMEM;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == YYENOMEM)
          YYNOMEM;
      }
    }

  yyerror_range[1] = yylloc;
  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval, &yylloc);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;

      yyerror_range[1] = *yylsp;
      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp, yylsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  yyerror_range[2] = yylloc;
  ++yylsp;
  YYLLOC_DEFAULT (*yylsp, yyerror_range, 2);

  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval, &yylloc);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp, yylsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
  return yyresult;
}

#line 552 "Parser.y"


 /* Subroutines Section */
