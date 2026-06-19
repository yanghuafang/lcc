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
  YYSYMBOL_STATIC = 55,                    /* STATIC  */
  YYSYMBOL_VOID = 56,                      /* VOID  */
  YYSYMBOL_FLOAT = 57,                     /* FLOAT  */
  YYSYMBOL_DOUBLE = 58,                    /* DOUBLE  */
  YYSYMBOL_BOOL = 59,                      /* BOOL  */
  YYSYMBOL_TRUE = 60,                      /* TRUE  */
  YYSYMBOL_FALSE = 61,                     /* FALSE  */
  YYSYMBOL_IF = 62,                        /* IF  */
  YYSYMBOL_ELSE = 63,                      /* ELSE  */
  YYSYMBOL_SWITCH = 64,                    /* SWITCH  */
  YYSYMBOL_CASE = 65,                      /* CASE  */
  YYSYMBOL_DEFAULT = 66,                   /* DEFAULT  */
  YYSYMBOL_FOR = 67,                       /* FOR  */
  YYSYMBOL_DO = 68,                        /* DO  */
  YYSYMBOL_WHILE = 69,                     /* WHILE  */
  YYSYMBOL_CONTINUE = 70,                  /* CONTINUE  */
  YYSYMBOL_BREAK = 71,                     /* BREAK  */
  YYSYMBOL_RETURN = 72,                    /* RETURN  */
  YYSYMBOL_STRUCT = 73,                    /* STRUCT  */
  YYSYMBOL_UNION = 74,                     /* UNION  */
  YYSYMBOL_ENUM = 75,                      /* ENUM  */
  YYSYMBOL_TYPEDEF = 76,                   /* TYPEDEF  */
  YYSYMBOL_SIZEOF = 77,                    /* SIZEOF  */
  YYSYMBOL_IDENTIFIER = 78,                /* IDENTIFIER  */
  YYSYMBOL_CHARACTER = 79,                 /* CHARACTER  */
  YYSYMBOL_INTEGER = 80,                   /* INTEGER  */
  YYSYMBOL_UINTEGER = 81,                  /* UINTEGER  */
  YYSYMBOL_LONGVAL = 82,                   /* LONGVAL  */
  YYSYMBOL_ULONGVAL = 83,                  /* ULONGVAL  */
  YYSYMBOL_FLOATVAL = 84,                  /* FLOATVAL  */
  YYSYMBOL_DOUBLEVAL = 85,                 /* DOUBLEVAL  */
  YYSYMBOL_STRING = 86,                    /* STRING  */
  YYSYMBOL_YYACCEPT = 87,                  /* $accept  */
  YYSYMBOL_Program = 88,                   /* Program  */
  YYSYMBOL_Decls = 89,                     /* Decls  */
  YYSYMBOL_Decl = 90,                      /* Decl  */
  YYSYMBOL_TypedefDecl = 91,               /* TypedefDecl  */
  YYSYMBOL_FuncDecl = 92,                  /* FuncDecl  */
  YYSYMBOL_FuncBody = 93,                  /* FuncBody  */
  YYSYMBOL_VarDecl = 94,                   /* VarDecl  */
  YYSYMBOL_TypeDecl = 95,                  /* TypeDecl  */
  YYSYMBOL_VarType = 96,                   /* VarType  */
  YYSYMBOL__VarType = 97,                  /* _VarType  */
  YYSYMBOL_VarList = 98,                   /* VarList  */
  YYSYMBOL_VarInit = 99,                   /* VarInit  */
  YYSYMBOL_InitList = 100,                 /* InitList  */
  YYSYMBOL_InitItem = 101,                 /* InitItem  */
  YYSYMBOL_ArrayBoundList = 102,           /* ArrayBoundList  */
  YYSYMBOL_ArrayBound = 103,               /* ArrayBound  */
  YYSYMBOL_ParamList = 104,                /* ParamList  */
  YYSYMBOL_Param = 105,                    /* Param  */
  YYSYMBOL_BuiltinType = 106,              /* BuiltinType  */
  YYSYMBOL_FieldDecls = 107,               /* FieldDecls  */
  YYSYMBOL_FieldDecl = 108,                /* FieldDecl  */
  YYSYMBOL_MemberList = 109,               /* MemberList  */
  YYSYMBOL_EnumList = 110,                 /* EnumList  */
  YYSYMBOL_Enum = 111,                     /* Enum  */
  YYSYMBOL_Stmts = 112,                    /* Stmts  */
  YYSYMBOL_Stmt = 113,                     /* Stmt  */
  YYSYMBOL_IfStmt = 114,                   /* IfStmt  */
  YYSYMBOL_SwitchStmt = 115,               /* SwitchStmt  */
  YYSYMBOL_CaseStmtList = 116,             /* CaseStmtList  */
  YYSYMBOL_CaseStmt = 117,                 /* CaseStmt  */
  YYSYMBOL_ForStmt = 118,                  /* ForStmt  */
  YYSYMBOL_DoStmt = 119,                   /* DoStmt  */
  YYSYMBOL_WhileStmt = 120,                /* WhileStmt  */
  YYSYMBOL_ContinueStmt = 121,             /* ContinueStmt  */
  YYSYMBOL_BreakStmt = 122,                /* BreakStmt  */
  YYSYMBOL_ReturnStmt = 123,               /* ReturnStmt  */
  YYSYMBOL_Block = 124,                    /* Block  */
  YYSYMBOL_Expr = 125,                     /* Expr  */
  YYSYMBOL_ExprList = 126,                 /* ExprList  */
  YYSYMBOL_Constant = 127                  /* Constant  */
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
#define YYLAST   2297

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  87
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  41
/* YYNRULES -- Number of rules.  */
#define YYNRULES  175
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  336

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   341


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
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   230,   230,   233,   234,   237,   238,   239,   240,   245,
     247,   250,   255,   259,   263,   266,   271,   274,   277,   282,
     287,   288,   291,   292,   294,   295,   297,   298,   300,   301,
     302,   308,   310,   311,   316,   318,   320,   323,   331,   333,
     338,   340,   348,   350,   352,   355,   357,   363,   365,   367,
     368,   369,   375,   376,   380,   381,   382,   383,   384,   385,
     386,   387,   388,   389,   390,   391,   392,   397,   399,   402,
     404,   409,   411,   412,   417,   419,   420,   423,   424,   430,
     431,   434,   435,   436,   437,   438,   439,   440,   441,   442,
     443,   444,   445,   446,   449,   452,   459,   465,   467,   470,
     473,   478,   481,   484,   489,   494,   500,   504,   508,   510,
     515,   523,   524,   525,   527,   528,   530,   532,   534,   536,
     538,   540,   542,   544,   546,   548,   550,   552,   553,   555,
     557,   559,   560,   561,   563,   565,   567,   569,   570,   571,
     572,   573,   574,   576,   577,   578,   579,   580,   581,   582,
     583,   584,   585,   586,   587,   588,   589,   590,   591,   592,
     593,   594,   595,   599,   601,   602,   605,   606,   607,   608,
     609,   610,   611,   612,   613,   614
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
  "LONG", "UNSIGNED", "CONST", "STATIC", "VOID", "FLOAT", "DOUBLE", "BOOL",
  "TRUE", "FALSE", "IF", "ELSE", "SWITCH", "CASE", "DEFAULT", "FOR", "DO",
  "WHILE", "CONTINUE", "BREAK", "RETURN", "STRUCT", "UNION", "ENUM",
  "TYPEDEF", "SIZEOF", "IDENTIFIER", "CHARACTER", "INTEGER", "UINTEGER",
  "LONGVAL", "ULONGVAL", "FLOATVAL", "DOUBLEVAL", "STRING", "$accept",
  "Program", "Decls", "Decl", "TypedefDecl", "FuncDecl", "FuncBody",
  "VarDecl", "TypeDecl", "VarType", "_VarType", "VarList", "VarInit",
  "InitList", "InitItem", "ArrayBoundList", "ArrayBound", "ParamList",
  "Param", "BuiltinType", "FieldDecls", "FieldDecl", "MemberList",
  "EnumList", "Enum", "Stmts", "Stmt", "IfStmt", "SwitchStmt",
  "CaseStmtList", "CaseStmt", "ForStmt", "DoStmt", "WhileStmt",
  "ContinueStmt", "BreakStmt", "ReturnStmt", "Block", "Expr", "ExprList",
  "Constant", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-210)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-31)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
    -210,    19,   -41,  -210,  -210,  -210,  -210,  -210,    63,  2219,
    2178,  -210,  -210,  -210,  -210,   -39,   -31,   -30,  2208,  -210,
    -210,  -210,  -210,  -210,  -210,     9,   139,  -210,  -210,  -210,
    -210,  -210,    60,    53,    60,   133,   141,   151,    99,   105,
     110,   146,   169,  -210,  -210,  -210,   161,   177,  -210,  -210,
     117,   184,   185,   145,  1019,   -10,    49,  -210,   124,  -210,
    1019,  -210,   112,   965,   188,     3,  -210,  -210,  -210,  -210,
    -210,   132,    41,  -210,  -210,   196,   803,  -210,   200,  -210,
      58,  -210,  -210,   138,  -210,  -210,   137,   117,  -210,   978,
    1008,  -210,  1056,    44,  -210,   908,   908,   620,   776,   908,
     908,   908,   908,   908,   908,  -210,  -210,   208,   209,  -210,
    -210,  -210,  -210,  -210,  -210,  -210,  -210,  1954,  -210,    72,
    -210,   193,  -210,  -210,   147,   152,  -210,  -210,  -210,  -210,
    -210,    42,    42,    33,   211,  1129,   881,  -210,    38,  -210,
    1954,    42,    42,    42,    42,    42,    42,   698,   908,   908,
     908,   153,   908,   908,   154,   908,   908,   908,   908,   908,
     908,  -210,  -210,   908,   908,   908,   908,   908,   908,   908,
     908,   908,   908,   908,   908,   908,   908,   908,   908,   908,
     908,   908,   908,   908,   908,  -210,  -210,   158,  -210,   234,
     236,   296,   908,  -210,    40,   881,  -210,   123,   241,  1175,
    1954,   134,  1954,  1221,  -210,    42,  2202,  -210,  1267,  1954,
     170,   170,    42,    42,  1954,  1954,  1954,  1954,  1954,  2120,
    2161,  1954,  1954,  1954,   248,   248,  1954,  1954,  2079,  2038,
     229,   229,   119,   119,   119,   119,  -210,  -210,  -210,  -210,
    -210,  -210,  2178,   243,   246,   249,   460,   267,   255,   285,
     203,  -210,  -210,   124,  -210,  -210,  -210,  -210,  -210,  -210,
    -210,  -210,  -210,  -210,  1313,    42,  -210,  -210,  -210,  -210,
    -210,   908,  -210,   908,  -210,   378,   124,   908,   908,   542,
     222,   908,  -210,  -210,  -210,  1359,  -210,  1954,  1997,  -210,
    1405,  1451,   908,   908,  1497,   280,  1543,  -210,   460,   277,
    1589,  1635,   908,   908,   460,   231,  -210,   908,   908,  1681,
    1727,  -210,   460,   -14,  1773,  1819,   908,   290,  -210,  -210,
     908,   293,  -210,   460,   460,  1865,  -210,  1911,  -210,  -210,
    -210,   460,  -210,   460,  -210,   460
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       4,     0,     2,     1,    54,    55,    56,    57,    58,     0,
       0,    66,    63,    64,    65,     0,     0,     0,     0,    30,
       3,     8,     5,     6,     7,    33,    20,    22,    59,    60,
      61,    62,    21,    33,    20,    24,    26,    28,     0,     0,
       0,    44,     0,    32,    19,    29,    44,     0,    68,    68,
      76,    24,    26,     0,    51,     0,    34,    43,     0,    18,
      51,    17,     0,     0,    77,     0,    75,    68,    68,     9,
      50,    53,     0,    49,    46,     0,     0,    42,    44,    31,
       0,    70,    23,    73,    67,    25,     0,     0,    27,     0,
       0,    52,     0,     0,    45,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   174,   175,     0,   111,   166,
     167,   168,   169,   170,   171,   172,   173,    35,   112,     0,
      72,     0,    78,    74,    23,    25,    48,    47,    14,    80,
      15,   125,   126,   111,     0,     0,     0,    37,     0,    39,
      40,   123,   124,   135,   136,   145,   155,     0,   165,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   133,   134,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    12,    13,     0,    69,     0,
       0,     0,     0,   113,     0,     0,    36,   111,     0,     0,
     164,     0,   114,     0,   116,   130,   142,   117,     0,   127,
     128,   129,   131,   132,   137,   138,   139,   140,   141,   143,
     144,   146,   147,   148,   149,   150,   151,   152,   153,   154,
     156,   157,   160,   161,   158,   159,    71,    10,    11,    93,
      80,    16,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    92,    91,    33,    79,    82,    83,    84,    85,    86,
      87,    88,    89,    90,     0,   119,    41,    38,   122,   120,
     121,     0,   115,     0,   118,     0,    33,     0,     0,     0,
       0,     0,   106,   107,   108,     0,    81,   163,   162,   110,
       0,     0,     0,     0,     0,     0,     0,   109,     0,     0,
       0,     0,     0,     0,     0,    95,    98,     0,     0,     0,
       0,   105,     0,     0,     0,     0,     0,     0,    94,    96,
       0,     0,    97,     0,     0,     0,   104,     0,    80,   102,
     103,     0,    80,   100,   101,    99
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -210,  -210,  -210,  -210,  -210,  -210,   179,    -1,   297,    62,
      -2,   -29,   242,   167,   114,  -210,   251,   254,   219,  -210,
      -9,  -210,  -210,  -210,   230,  -209,  -178,  -210,  -210,  -210,
    -210,  -210,  -210,  -210,  -210,  -210,  -210,  -210,   -74,  -210,
    -210
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
       0,     1,     2,    20,    21,    22,   130,   251,   252,   253,
      34,    42,    43,   138,   139,    56,    57,    72,    73,    27,
      62,    84,   121,    65,    66,   191,   254,   255,   256,   313,
     322,   257,   258,   259,   260,   261,   262,   263,   264,   201,
     118
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      26,    23,   117,   319,    47,    74,    87,    32,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,     3,
      88,   131,   132,   135,   140,   141,   142,   143,   144,   145,
     146,   275,    15,    16,    17,    18,   -30,    19,   -30,    35,
      63,   195,   -30,   195,    92,   148,   -30,    36,    37,   128,
     151,   320,   321,   154,    93,   196,   155,   266,    89,    90,
     129,    92,   140,    55,    25,   161,   162,    76,   280,    45,
      75,   119,    33,   199,   200,   202,   203,   185,   205,   206,
      40,   208,   209,   210,   211,   212,   213,    41,   129,   214,
     215,   216,   217,   218,   219,   220,   221,   222,   223,   224,
     225,   226,   227,   228,   229,   230,   231,   232,   233,   234,
     235,   -30,    28,    29,    30,    31,    71,    81,   265,   333,
     305,   140,    71,   335,    83,    83,   311,   151,   152,    82,
     154,    46,   -30,   155,   318,   148,   268,   271,   157,   158,
     159,   160,   161,   162,    44,   329,   330,   272,    45,    48,
      69,    83,    83,   334,    71,   173,   174,    49,    54,   134,
      55,     4,     5,     6,     7,     8,     9,    50,    11,    12,
      13,    14,    58,    60,    59,    55,   285,    51,   151,   152,
      58,   154,    61,    52,   155,    15,    16,    17,    53,    26,
      19,   159,   160,   161,   162,    64,   187,   287,   188,   288,
      67,    68,    78,   290,   291,   294,    86,   296,   284,   198,
      91,    94,    95,    96,    55,    97,   120,   122,   300,   301,
     147,   148,    99,   100,   192,   189,   101,   102,   309,   310,
     190,   204,   207,   314,   315,   103,   236,   151,   152,   237,
     154,   238,   325,   155,    26,   104,   327,    47,   157,   158,
     159,   160,   161,   162,   269,   277,   151,   152,   278,   154,
     282,   279,   155,   105,   106,   173,   174,   157,   158,   159,
     160,   161,   162,    26,   181,   182,   183,   184,   293,   281,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     283,   295,   303,   306,   312,   326,    26,   328,   186,    24,
      79,   239,    26,   194,   276,    95,    96,    77,    97,   267,
      26,   127,   240,   241,    80,    99,   100,   123,     0,   101,
     102,    26,    26,     0,     0,     0,     0,     0,   103,    26,
       0,    26,     0,    26,     0,     0,     0,     0,   104,     0,
       0,     0,     0,     0,     0,     4,     5,     6,     7,     8,
       9,   242,    11,    12,    13,    14,   105,   106,   243,     0,
     244,     0,     0,   245,   246,   247,   248,   249,   250,    15,
      16,    17,     0,   107,   133,   109,   110,   111,   112,   113,
     114,   115,   116,   239,     0,     0,     0,    95,    96,     0,
      97,     0,     0,     0,   240,   289,     0,    99,   100,     0,
       0,   101,   102,     0,     0,     0,     0,     0,     0,     0,
     103,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     104,     0,     0,     0,     0,     0,     0,     4,     5,     6,
       7,     8,     9,   242,    11,    12,    13,    14,   105,   106,
     243,     0,   244,     0,     0,   245,   246,   247,   248,   249,
     250,    15,    16,    17,     0,   107,   133,   109,   110,   111,
     112,   113,   114,   115,   116,   239,     0,     0,     0,    95,
      96,     0,    97,     0,     0,     0,   240,     0,     0,    99,
     100,     0,     0,   101,   102,     0,     0,     0,     0,     0,
       0,     0,   103,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   104,     0,     0,     0,     0,     0,     0,     4,
       5,     6,     7,     8,     9,   242,    11,    12,    13,    14,
     105,   106,   243,     0,   244,     0,     0,   245,   246,   247,
     248,   249,   250,    15,    16,    17,     0,   107,   133,   109,
     110,   111,   112,   113,   114,   115,   116,   292,     0,     0,
       0,    95,    96,     0,    97,     0,     0,     0,     0,     0,
       0,    99,   100,     0,     0,   101,   102,     0,     0,     0,
       0,     0,     0,     0,   103,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   104,     0,     0,     0,     0,     0,
       0,     4,     5,     6,     7,     8,     9,   242,    11,    12,
      13,    14,   105,   106,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    15,    16,    17,     0,   107,
     133,   109,   110,   111,   112,   113,   114,   115,   116,    95,
      96,     0,    97,     0,     0,     0,     0,     0,     0,    99,
     100,     0,     0,   101,   102,     0,     0,     0,     0,     0,
       0,     0,   103,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   104,     0,     0,     0,     0,     0,     0,     4,
       5,     6,     7,     8,     9,     0,    11,    12,    13,    14,
     105,   106,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    15,    16,    17,     0,   107,   133,   109,
     110,   111,   112,   113,   114,   115,   116,    95,    96,     0,
      97,     0,     0,     0,     0,     0,     0,    99,   100,     0,
       0,   101,   102,     0,     0,     0,     0,     0,     0,     0,
     103,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     104,     0,     0,     0,     0,     0,     0,     4,     5,     6,
       7,     8,     9,     0,    11,    12,    13,    14,   105,   106,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    15,    16,    17,     0,   107,   197,   109,   110,   111,
     112,   113,   114,   115,   116,    95,    96,     0,    97,     0,
       0,     0,   136,   137,     0,    99,   100,     0,     0,   101,
     102,     0,     0,     0,     0,     0,     0,     0,   103,     0,
       0,     0,    95,    96,     0,    97,     0,     0,   104,    98,
       0,     0,    99,   100,     0,     0,   101,   102,     0,     0,
       0,     0,     0,     0,     0,   103,   105,   106,     0,     0,
       0,     0,     0,     0,     0,   104,     0,     0,     0,     0,
       0,     0,     0,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   105,   106,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
      95,    96,     0,    97,     0,     0,     0,   136,     0,     0,
      99,   100,     0,     0,   101,   102,     0,     0,     0,     0,
       0,     0,     0,   103,     0,     0,     0,    95,    96,     0,
      97,     0,     0,   104,     0,     0,     0,    99,   100,     0,
       0,   101,   102,     0,     0,     0,     0,     0,     0,     0,
     103,   105,   106,     0,     0,     0,     0,     0,     0,     0,
     104,     0,     0,     0,     0,     0,     0,     0,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   105,   106,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    85,    81,     0,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   124,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     4,     5,     6,     7,     8,     9,
       0,    11,    12,    13,    14,   125,    70,     4,     5,     6,
       7,     8,     9,     0,    11,    12,    13,    14,    15,    16,
      17,     0,     0,    19,     0,     0,     0,     0,     0,     0,
       0,    15,    16,    17,     0,     0,    19,     4,     5,     6,
       7,     8,     9,   126,    11,    12,    13,    14,     4,     5,
       6,     7,     8,     9,     0,    11,    12,    13,    14,     0,
       0,    15,    16,    17,     0,     0,    19,     0,     0,     0,
       0,     0,    15,    16,    17,     0,     0,    19,     0,     0,
       0,     0,     0,     0,     0,     4,     5,     6,     7,     8,
       9,     0,    11,    12,    13,    14,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    15,
      16,    17,   149,     0,    19,   150,     0,   151,   152,   153,
     154,     0,   193,   155,     0,     0,     0,   156,   157,   158,
     159,   160,   161,   162,   163,   164,   165,   166,   167,   168,
     169,     0,   170,   171,   172,   173,   174,   175,   176,   177,
     178,     0,   179,   180,   181,   182,   183,   184,   149,     0,
       0,   150,     0,   151,   152,   153,   154,     0,   270,   155,
       0,     0,     0,   156,   157,   158,   159,   160,   161,   162,
     163,   164,   165,   166,   167,   168,   169,     0,   170,   171,
     172,   173,   174,   175,   176,   177,   178,     0,   179,   180,
     181,   182,   183,   184,   149,   273,     0,   150,     0,   151,
     152,   153,   154,     0,     0,   155,     0,     0,     0,   156,
     157,   158,   159,   160,   161,   162,   163,   164,   165,   166,
     167,   168,   169,     0,   170,   171,   172,   173,   174,   175,
     176,   177,   178,     0,   179,   180,   181,   182,   183,   184,
     149,     0,     0,   150,     0,   151,   152,   153,   154,     0,
       0,   155,   274,     0,     0,   156,   157,   158,   159,   160,
     161,   162,   163,   164,   165,   166,   167,   168,   169,     0,
     170,   171,   172,   173,   174,   175,   176,   177,   178,     0,
     179,   180,   181,   182,   183,   184,   149,     0,   286,   150,
       0,   151,   152,   153,   154,     0,     0,   155,     0,     0,
       0,   156,   157,   158,   159,   160,   161,   162,   163,   164,
     165,   166,   167,   168,   169,     0,   170,   171,   172,   173,
     174,   175,   176,   177,   178,     0,   179,   180,   181,   182,
     183,   184,   149,     0,   297,   150,     0,   151,   152,   153,
     154,     0,     0,   155,     0,     0,     0,   156,   157,   158,
     159,   160,   161,   162,   163,   164,   165,   166,   167,   168,
     169,     0,   170,   171,   172,   173,   174,   175,   176,   177,
     178,     0,   179,   180,   181,   182,   183,   184,   149,     0,
       0,   150,     0,   151,   152,   153,   154,     0,   298,   155,
       0,     0,     0,   156,   157,   158,   159,   160,   161,   162,
     163,   164,   165,   166,   167,   168,   169,     0,   170,   171,
     172,   173,   174,   175,   176,   177,   178,     0,   179,   180,
     181,   182,   183,   184,   149,     0,     0,   150,     0,   151,
     152,   153,   154,     0,   299,   155,     0,     0,     0,   156,
     157,   158,   159,   160,   161,   162,   163,   164,   165,   166,
     167,   168,   169,     0,   170,   171,   172,   173,   174,   175,
     176,   177,   178,     0,   179,   180,   181,   182,   183,   184,
     149,     0,   302,   150,     0,   151,   152,   153,   154,     0,
       0,   155,     0,     0,     0,   156,   157,   158,   159,   160,
     161,   162,   163,   164,   165,   166,   167,   168,   169,     0,
     170,   171,   172,   173,   174,   175,   176,   177,   178,     0,
     179,   180,   181,   182,   183,   184,   149,     0,     0,   150,
       0,   151,   152,   153,   154,     0,   304,   155,     0,     0,
       0,   156,   157,   158,   159,   160,   161,   162,   163,   164,
     165,   166,   167,   168,   169,     0,   170,   171,   172,   173,
     174,   175,   176,   177,   178,     0,   179,   180,   181,   182,
     183,   184,   149,     0,   307,   150,     0,   151,   152,   153,
     154,     0,     0,   155,     0,     0,     0,   156,   157,   158,
     159,   160,   161,   162,   163,   164,   165,   166,   167,   168,
     169,     0,   170,   171,   172,   173,   174,   175,   176,   177,
     178,     0,   179,   180,   181,   182,   183,   184,   149,     0,
     308,   150,     0,   151,   152,   153,   154,     0,     0,   155,
       0,     0,     0,   156,   157,   158,   159,   160,   161,   162,
     163,   164,   165,   166,   167,   168,   169,     0,   170,   171,
     172,   173,   174,   175,   176,   177,   178,     0,   179,   180,
     181,   182,   183,   184,   149,     0,   316,   150,     0,   151,
     152,   153,   154,     0,     0,   155,     0,     0,     0,   156,
     157,   158,   159,   160,   161,   162,   163,   164,   165,   166,
     167,   168,   169,     0,   170,   171,   172,   173,   174,   175,
     176,   177,   178,     0,   179,   180,   181,   182,   183,   184,
     149,     0,     0,   150,     0,   151,   152,   153,   154,     0,
     317,   155,     0,     0,     0,   156,   157,   158,   159,   160,
     161,   162,   163,   164,   165,   166,   167,   168,   169,     0,
     170,   171,   172,   173,   174,   175,   176,   177,   178,     0,
     179,   180,   181,   182,   183,   184,   149,     0,     0,   150,
       0,   151,   152,   153,   154,     0,   323,   155,     0,     0,
       0,   156,   157,   158,   159,   160,   161,   162,   163,   164,
     165,   166,   167,   168,   169,     0,   170,   171,   172,   173,
     174,   175,   176,   177,   178,     0,   179,   180,   181,   182,
     183,   184,   149,     0,     0,   150,     0,   151,   152,   153,
     154,     0,   324,   155,     0,     0,     0,   156,   157,   158,
     159,   160,   161,   162,   163,   164,   165,   166,   167,   168,
     169,     0,   170,   171,   172,   173,   174,   175,   176,   177,
     178,     0,   179,   180,   181,   182,   183,   184,   149,     0,
       0,   150,     0,   151,   152,   153,   154,     0,   331,   155,
       0,     0,     0,   156,   157,   158,   159,   160,   161,   162,
     163,   164,   165,   166,   167,   168,   169,     0,   170,   171,
     172,   173,   174,   175,   176,   177,   178,     0,   179,   180,
     181,   182,   183,   184,   149,   332,     0,   150,     0,   151,
     152,   153,   154,     0,     0,   155,     0,     0,     0,   156,
     157,   158,   159,   160,   161,   162,   163,   164,   165,   166,
     167,   168,   169,     0,   170,   171,   172,   173,   174,   175,
     176,   177,   178,     0,   179,   180,   181,   182,   183,   184,
     150,     0,   151,   152,   153,   154,     0,     0,   155,     0,
       0,     0,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,     0,   170,   171,   172,
     173,   174,   175,   176,   177,   178,     0,   179,   180,   181,
     182,   183,   184,   150,     0,   151,   152,   153,   154,     0,
       0,   155,     0,     0,     0,     0,   157,   158,   159,   160,
     161,   162,     0,     0,     0,     0,     0,   168,   169,     0,
       0,     0,     0,   173,   174,     0,     0,   177,   178,     0,
     179,   180,   181,   182,   183,   184,   151,   152,   153,   154,
       0,     0,   155,     0,     0,     0,     0,   157,   158,   159,
     160,   161,   162,     0,     0,     0,     0,     0,   168,   169,
       0,     0,     0,     0,   173,   174,     0,     0,   177,     0,
       0,   179,   180,   181,   182,   183,   184,   151,   152,   153,
     154,     0,     0,   155,     0,     0,     0,     0,   157,   158,
     159,   160,   161,   162,     0,     0,     0,     0,     0,   168,
     169,     0,     0,     0,     0,   173,   174,     0,     0,     0,
       0,     0,   179,   180,   181,   182,   183,   184,   151,   152,
     153,   154,     0,     0,   155,     0,     0,     0,     0,   157,
     158,   159,   160,   161,   162,     0,     0,     0,     0,     0,
       0,   169,     0,     0,     0,     0,   173,   174,     0,     0,
       0,     0,     0,   179,   180,   181,   182,   183,   184,   151,
     152,   153,   154,     0,     0,   155,     0,     0,     0,     0,
     157,   158,   159,   160,   161,   162,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   173,   174,     0,
       0,     0,     0,     0,   179,   180,   181,   182,   183,   184,
     151,   152,     0,   154,     0,     0,   155,     0,     0,     0,
       0,   157,   158,   159,   160,   161,   162,     4,     5,     6,
       7,     8,     9,     0,    11,    12,    13,    14,   173,   174,
       0,     0,     0,     0,     0,   179,   180,   181,   182,   183,
     184,    15,    16,    17,     0,     0,    19,     4,     5,     6,
       7,     8,     9,     0,    11,    12,    13,    14,     4,     5,
       6,     7,     8,     0,     0,    11,    12,    13,    14,     0,
       0,    38,    39,    17,     0,     0,    19,     0,     0,     0,
       0,     0,    15,    16,    17,     0,     0,    19
};

static const yytype_int16 yycheck[] =
{
       2,     2,    76,    17,    33,    15,     3,     9,    49,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    59,     0,
      17,    95,    96,    97,    98,    99,   100,   101,   102,   103,
     104,   240,    73,    74,    75,    76,     3,    78,     5,    78,
      49,     3,     9,     3,     3,    12,    13,    78,    78,     5,
       8,    65,    66,    11,    13,    17,    14,    17,    67,    68,
      16,     3,   136,    14,     2,    23,    24,    18,   246,     9,
      80,    13,    10,   147,   148,   149,   150,     5,   152,   153,
      18,   155,   156,   157,   158,   159,   160,    78,    16,   163,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,   178,   179,   180,   181,   182,   183,
     184,    78,    49,    50,    51,    52,    54,     5,   192,   328,
     298,   195,    60,   332,    62,    63,   304,     8,     9,    17,
      11,    78,     9,    14,   312,    12,    13,     3,    19,    20,
      21,    22,    23,    24,     5,   323,   324,    13,     9,    16,
       5,    89,    90,   331,    92,    36,    37,    16,    12,    97,
      14,    49,    50,    51,    52,    53,    54,    16,    56,    57,
      58,    59,     3,    12,     5,    14,   250,    78,     8,     9,
       3,    11,     5,    78,    14,    73,    74,    75,    78,   191,
      78,    21,    22,    23,    24,    78,     3,   271,     5,   273,
      16,    16,    78,   277,   278,   279,    18,   281,     5,   147,
      78,    15,     9,    10,    14,    12,    78,    80,   292,   293,
      12,    12,    19,    20,    13,    78,    23,    24,   302,   303,
      78,    78,    78,   307,   308,    32,    78,     8,     9,     5,
      11,     5,   316,    14,   246,    42,   320,   276,    19,    20,
      21,    22,    23,    24,    13,    12,     8,     9,    12,    11,
       5,    12,    14,    60,    61,    36,    37,    19,    20,    21,
      22,    23,    24,   275,    45,    46,    47,    48,   279,    12,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
       5,    69,    12,    16,    63,     5,   298,     4,   119,     2,
      58,     5,   304,   136,   242,     9,    10,    56,    12,   195,
     312,    92,    16,    17,    60,    19,    20,    87,    -1,    23,
      24,   323,   324,    -1,    -1,    -1,    -1,    -1,    32,   331,
      -1,   333,    -1,   335,    -1,    -1,    -1,    -1,    42,    -1,
      -1,    -1,    -1,    -1,    -1,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      64,    -1,    -1,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    -1,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,     5,    -1,    -1,    -1,     9,    10,    -1,
      12,    -1,    -1,    -1,    16,    17,    -1,    19,    20,    -1,
      -1,    23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      32,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      42,    -1,    -1,    -1,    -1,    -1,    -1,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    64,    -1,    -1,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    -1,    77,    78,    79,    80,    81,
      82,    83,    84,    85,    86,     5,    -1,    -1,    -1,     9,
      10,    -1,    12,    -1,    -1,    -1,    16,    -1,    -1,    19,
      20,    -1,    -1,    23,    24,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    32,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,    -1,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    64,    -1,    -1,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    -1,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,     5,    -1,    -1,
      -1,     9,    10,    -1,    12,    -1,    -1,    -1,    -1,    -1,
      -1,    19,    20,    -1,    -1,    23,    24,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    32,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,
      -1,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    73,    74,    75,    -1,    77,
      78,    79,    80,    81,    82,    83,    84,    85,    86,     9,
      10,    -1,    12,    -1,    -1,    -1,    -1,    -1,    -1,    19,
      20,    -1,    -1,    23,    24,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    32,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,    -1,    49,
      50,    51,    52,    53,    54,    -1,    56,    57,    58,    59,
      60,    61,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    73,    74,    75,    -1,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,     9,    10,    -1,
      12,    -1,    -1,    -1,    -1,    -1,    -1,    19,    20,    -1,
      -1,    23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      32,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      42,    -1,    -1,    -1,    -1,    -1,    -1,    49,    50,    51,
      52,    53,    54,    -1,    56,    57,    58,    59,    60,    61,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    73,    74,    75,    -1,    77,    78,    79,    80,    81,
      82,    83,    84,    85,    86,     9,    10,    -1,    12,    -1,
      -1,    -1,    16,    17,    -1,    19,    20,    -1,    -1,    23,
      24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    32,    -1,
      -1,    -1,     9,    10,    -1,    12,    -1,    -1,    42,    16,
      -1,    -1,    19,    20,    -1,    -1,    23,    24,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    32,    60,    61,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    60,    61,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
       9,    10,    -1,    12,    -1,    -1,    -1,    16,    -1,    -1,
      19,    20,    -1,    -1,    23,    24,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    32,    -1,    -1,    -1,     9,    10,    -1,
      12,    -1,    -1,    42,    -1,    -1,    -1,    19,    20,    -1,
      -1,    23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      32,    60,    61,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      42,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    60,    61,
       5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    17,     5,    -1,    77,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    17,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     5,    49,    50,    51,    52,    53,    54,
      -1,    56,    57,    58,    59,    17,     7,    49,    50,    51,
      52,    53,    54,    -1,    56,    57,    58,    59,    73,    74,
      75,    -1,    -1,    78,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    73,    74,    75,    -1,    -1,    78,    49,    50,    51,
      52,    53,    54,     7,    56,    57,    58,    59,    49,    50,
      51,    52,    53,    54,    -1,    56,    57,    58,    59,    -1,
      -1,    73,    74,    75,    -1,    -1,    78,    -1,    -1,    -1,
      -1,    -1,    73,    74,    75,    -1,    -1,    78,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    49,    50,    51,    52,    53,
      54,    -1,    56,    57,    58,    59,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    73,
      74,    75,     3,    -1,    78,     6,    -1,     8,     9,    10,
      11,    -1,    13,    14,    -1,    -1,    -1,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    -1,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    -1,    43,    44,    45,    46,    47,    48,     3,    -1,
      -1,     6,    -1,     8,     9,    10,    11,    -1,    13,    14,
      -1,    -1,    -1,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    -1,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    -1,    43,    44,
      45,    46,    47,    48,     3,     4,    -1,     6,    -1,     8,
       9,    10,    11,    -1,    -1,    14,    -1,    -1,    -1,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    -1,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    -1,    43,    44,    45,    46,    47,    48,
       3,    -1,    -1,     6,    -1,     8,     9,    10,    11,    -1,
      -1,    14,    15,    -1,    -1,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    -1,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    -1,
      43,    44,    45,    46,    47,    48,     3,    -1,     5,     6,
      -1,     8,     9,    10,    11,    -1,    -1,    14,    -1,    -1,
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
      45,    46,    47,    48,     3,    -1,    -1,     6,    -1,     8,
       9,    10,    11,    -1,    13,    14,    -1,    -1,    -1,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    -1,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    -1,    43,    44,    45,    46,    47,    48,
       3,    -1,     5,     6,    -1,     8,     9,    10,    11,    -1,
      -1,    14,    -1,    -1,    -1,    18,    19,    20,    21,    22,
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
      47,    48,     3,    -1,    -1,     6,    -1,     8,     9,    10,
      11,    -1,    13,    14,    -1,    -1,    -1,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    -1,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    -1,    43,    44,    45,    46,    47,    48,     3,    -1,
      -1,     6,    -1,     8,     9,    10,    11,    -1,    13,    14,
      -1,    -1,    -1,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    -1,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    -1,    43,    44,
      45,    46,    47,    48,     3,     4,    -1,     6,    -1,     8,
       9,    10,    11,    -1,    -1,    14,    -1,    -1,    -1,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    -1,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    -1,    43,    44,    45,    46,    47,    48,
       6,    -1,     8,     9,    10,    11,    -1,    -1,    14,    -1,
      -1,    -1,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    -1,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    -1,    43,    44,    45,
      46,    47,    48,     6,    -1,     8,     9,    10,    11,    -1,
      -1,    14,    -1,    -1,    -1,    -1,    19,    20,    21,    22,
      23,    24,    -1,    -1,    -1,    -1,    -1,    30,    31,    -1,
      -1,    -1,    -1,    36,    37,    -1,    -1,    40,    41,    -1,
      43,    44,    45,    46,    47,    48,     8,     9,    10,    11,
      -1,    -1,    14,    -1,    -1,    -1,    -1,    19,    20,    21,
      22,    23,    24,    -1,    -1,    -1,    -1,    -1,    30,    31,
      -1,    -1,    -1,    -1,    36,    37,    -1,    -1,    40,    -1,
      -1,    43,    44,    45,    46,    47,    48,     8,     9,    10,
      11,    -1,    -1,    14,    -1,    -1,    -1,    -1,    19,    20,
      21,    22,    23,    24,    -1,    -1,    -1,    -1,    -1,    30,
      31,    -1,    -1,    -1,    -1,    36,    37,    -1,    -1,    -1,
      -1,    -1,    43,    44,    45,    46,    47,    48,     8,     9,
      10,    11,    -1,    -1,    14,    -1,    -1,    -1,    -1,    19,
      20,    21,    22,    23,    24,    -1,    -1,    -1,    -1,    -1,
      -1,    31,    -1,    -1,    -1,    -1,    36,    37,    -1,    -1,
      -1,    -1,    -1,    43,    44,    45,    46,    47,    48,     8,
       9,    10,    11,    -1,    -1,    14,    -1,    -1,    -1,    -1,
      19,    20,    21,    22,    23,    24,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    36,    37,    -1,
      -1,    -1,    -1,    -1,    43,    44,    45,    46,    47,    48,
       8,     9,    -1,    11,    -1,    -1,    14,    -1,    -1,    -1,
      -1,    19,    20,    21,    22,    23,    24,    49,    50,    51,
      52,    53,    54,    -1,    56,    57,    58,    59,    36,    37,
      -1,    -1,    -1,    -1,    -1,    43,    44,    45,    46,    47,
      48,    73,    74,    75,    -1,    -1,    78,    49,    50,    51,
      52,    53,    54,    -1,    56,    57,    58,    59,    49,    50,
      51,    52,    53,    -1,    -1,    56,    57,    58,    59,    -1,
      -1,    73,    74,    75,    -1,    -1,    78,    -1,    -1,    -1,
      -1,    -1,    73,    74,    75,    -1,    -1,    78
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    88,    89,     0,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    73,    74,    75,    76,    78,
      90,    91,    92,    94,    95,    96,    97,   106,    49,    50,
      51,    52,    97,    96,    97,    78,    78,    78,    73,    74,
      96,    78,    98,    99,     5,     9,    78,    98,    16,    16,
      16,    78,    78,    78,    12,    14,   102,   103,     3,     5,
      12,     5,   107,   107,    78,   110,   111,    16,    16,     5,
       7,    96,   104,   105,    15,    80,    18,   103,    78,    99,
     104,     5,    17,    96,   108,    17,    18,     3,    17,   107,
     107,    78,     3,    13,    15,     9,    10,    12,    16,    19,
      20,    23,    24,    32,    42,    60,    61,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,   125,   127,    13,
      78,   109,    80,   111,    17,    17,     7,   105,     5,    16,
      93,   125,   125,    78,    96,   125,    16,    17,   100,   101,
     125,   125,   125,   125,   125,   125,   125,    12,    12,     3,
       6,     8,     9,    10,    11,    14,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    43,
      44,    45,    46,    47,    48,     5,    93,     3,     5,    78,
      78,   112,    13,    13,   100,     3,    17,    78,    96,   125,
     125,   126,   125,   125,    78,   125,   125,    78,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,    78,     5,     5,     5,
      16,    17,    55,    62,    64,    67,    68,    69,    70,    71,
      72,    94,    95,    96,   113,   114,   115,   118,   119,   120,
     121,   122,   123,   124,   125,   125,    17,   101,    13,    13,
      13,     3,    13,     4,    15,   112,    96,    12,    12,    12,
     113,    12,     5,     5,     5,   125,     5,   125,   125,    17,
     125,   125,     5,    94,   125,    69,   125,     5,    13,    13,
     125,   125,     5,    12,    13,   113,    16,     5,     5,   125,
     125,   113,    63,   116,   125,   125,     5,    13,   113,    17,
      65,    66,   117,    13,    13,   125,     5,   125,     4,   113,
     113,    13,     4,   112,   113,   112
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    87,    88,    89,    89,    90,    90,    90,    90,    91,
      91,    91,    92,    92,    92,    92,    93,    94,    94,    95,
      96,    96,    97,    97,    97,    97,    97,    97,    97,    97,
      97,    98,    98,    98,    99,    99,    99,    99,   100,   100,
     101,   101,   102,   102,   102,   103,   103,   104,   104,   104,
     104,   104,   105,   105,   106,   106,   106,   106,   106,   106,
     106,   106,   106,   106,   106,   106,   106,   107,   107,   108,
     108,   109,   109,   109,   110,   110,   110,   111,   111,   112,
     112,   113,   113,   113,   113,   113,   113,   113,   113,   113,
     113,   113,   113,   113,   114,   114,   115,   116,   116,   117,
     117,   118,   118,   118,   119,   120,   121,   122,   123,   123,
     124,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   126,   126,   126,   127,   127,   127,   127,
     127,   127,   127,   127,   127,   127
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     0,     1,     1,     1,     1,     4,
       8,     8,     7,     7,     6,     6,     3,     4,     3,     2,
       1,     2,     1,     5,     2,     5,     2,     5,     2,     2,
       1,     3,     1,     0,     2,     4,     6,     5,     3,     1,
       1,     3,     2,     1,     0,     3,     2,     3,     3,     1,
       1,     0,     2,     1,     1,     1,     1,     1,     1,     2,
       2,     2,     2,     1,     1,     1,     1,     2,     0,     3,
       1,     3,     1,     0,     3,     1,     0,     1,     3,     2,
       0,     2,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     7,     5,     7,     2,     0,     4,
       3,     9,     8,     8,     7,     5,     2,     2,     2,     3,
       3,     1,     1,     3,     3,     4,     3,     3,     4,     4,
       4,     4,     4,     2,     2,     2,     2,     3,     3,     3,
       3,     3,     3,     2,     2,     2,     2,     3,     3,     3,
       3,     3,     3,     3,     3,     2,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     2,     3,     3,     3,     3,
       3,     3,     5,     3,     1,     0,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1
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
  switch (yykind)
    {
    case YYSYMBOL_IDENTIFIER: /* IDENTIFIER  */
#line 133 "Parser.y"
            { delete ((*yyvaluep).idVal); }
#line 1929 "Parser.cpp"
        break;

    case YYSYMBOL_STRING: /* STRING  */
#line 134 "Parser.y"
            { delete ((*yyvaluep).strVal); }
#line 1935 "Parser.cpp"
        break;

      default:
        break;
    }
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
#line 230 "Parser.y"
                                { (yyval.program) = new AST::Program((yyvsp[0].decls)); g_root = (yyval.program); }
#line 2233 "Parser.cpp"
    break;

  case 3: /* Decls: Decls Decl  */
#line 233 "Parser.y"
                                { (yyval.decls) = (yyvsp[-1].decls); (yyval.decls)->push_back((yyvsp[0].decl)); }
#line 2239 "Parser.cpp"
    break;

  case 4: /* Decls: %empty  */
#line 234 "Parser.y"
                                { (yyval.decls) = new AST::Decls(); }
#line 2245 "Parser.cpp"
    break;

  case 5: /* Decl: FuncDecl  */
#line 237 "Parser.y"
                                { (yyval.decl) = (yyvsp[0].funcDecl); }
#line 2251 "Parser.cpp"
    break;

  case 6: /* Decl: VarDecl  */
#line 238 "Parser.y"
                                { (yyval.decl) = (yyvsp[0].varDecl); }
#line 2257 "Parser.cpp"
    break;

  case 7: /* Decl: TypeDecl  */
#line 239 "Parser.y"
                                { (yyval.decl) = (yyvsp[0].typeDecl); }
#line 2263 "Parser.cpp"
    break;

  case 8: /* Decl: TypedefDecl  */
#line 240 "Parser.y"
                                { (yyval.decl) = (yyvsp[0].typedefDecl); }
#line 2269 "Parser.cpp"
    break;

  case 9: /* TypedefDecl: TYPEDEF VarType IDENTIFIER SEMICOLON  */
#line 246 "Parser.y"
                                { (yyval.typedefDecl) = new AST::TypedefDecl((yyvsp[-2].varType), *(yyvsp[-1].idVal)); }
#line 2275 "Parser.cpp"
    break;

  case 10: /* TypedefDecl: TYPEDEF STRUCT IDENTIFIER LBRACE FieldDecls RBRACE IDENTIFIER SEMICOLON  */
#line 248 "Parser.y"
                                { (yyval.typedefDecl) = new AST::TypedefDecl(
                                      new AST::StructType((yyvsp[-3].fieldDecls), *(yyvsp[-5].idVal)), *(yyvsp[-1].idVal)); }
#line 2282 "Parser.cpp"
    break;

  case 11: /* TypedefDecl: TYPEDEF UNION IDENTIFIER LBRACE FieldDecls RBRACE IDENTIFIER SEMICOLON  */
#line 251 "Parser.y"
                                { (yyval.typedefDecl) = new AST::TypedefDecl(
                                      new AST::UnionType((yyvsp[-3].fieldDecls), *(yyvsp[-5].idVal)), *(yyvsp[-1].idVal)); }
#line 2289 "Parser.cpp"
    break;

  case 12: /* FuncDecl: STATIC VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES SEMICOLON  */
#line 256 "Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList));
                                  (yyval.funcDecl)->isStatic_ = true;
                                  (yyval.funcDecl)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 2297 "Parser.cpp"
    break;

  case 13: /* FuncDecl: STATIC VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES FuncBody  */
#line 260 "Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList), (yyvsp[0].funcBody));
                                  (yyval.funcDecl)->isStatic_ = true;
                                  (yyval.funcDecl)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 2305 "Parser.cpp"
    break;

  case 14: /* FuncDecl: VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES SEMICOLON  */
#line 264 "Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList));
                                  (yyval.funcDecl)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 2312 "Parser.cpp"
    break;

  case 15: /* FuncDecl: VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES FuncBody  */
#line 267 "Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList), (yyvsp[0].funcBody));
                                  (yyval.funcDecl)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 2319 "Parser.cpp"
    break;

  case 16: /* FuncBody: LBRACE Stmts RBRACE  */
#line 271 "Parser.y"
                                { (yyval.funcBody) = new AST::FuncBody((yyvsp[-1].stmts)); }
#line 2325 "Parser.cpp"
    break;

  case 17: /* VarDecl: STATIC VarType VarList SEMICOLON  */
#line 275 "Parser.y"
                                { (yyval.varDecl) = new AST::VarDecl((yyvsp[-2].varType), (yyvsp[-1].varList)); (yyval.varDecl)->isStatic_ = true;
                                  (yyval.varDecl)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 2332 "Parser.cpp"
    break;

  case 18: /* VarDecl: VarType VarList SEMICOLON  */
#line 278 "Parser.y"
                                { (yyval.varDecl) = new AST::VarDecl((yyvsp[-2].varType), (yyvsp[-1].varList));
                                  (yyval.varDecl)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 2339 "Parser.cpp"
    break;

  case 19: /* TypeDecl: _VarType SEMICOLON  */
#line 282 "Parser.y"
                                { (yyval.typeDecl) = new AST::TypeDecl((yyvsp[-1].varType)); }
#line 2345 "Parser.cpp"
    break;

  case 20: /* VarType: _VarType  */
#line 287 "Parser.y"
                                { (yyval.varType) = (yyvsp[0].varType); }
#line 2351 "Parser.cpp"
    break;

  case 21: /* VarType: CONST _VarType  */
#line 288 "Parser.y"
                                { (yyval.varType) = (yyvsp[0].varType); (yyval.varType)->setConst(); }
#line 2357 "Parser.cpp"
    break;

  case 22: /* _VarType: BuiltinType  */
#line 291 "Parser.y"
                                { (yyval.varType) = (yyvsp[0].builtinType); }
#line 2363 "Parser.cpp"
    break;

  case 23: /* _VarType: STRUCT IDENTIFIER LBRACE FieldDecls RBRACE  */
#line 293 "Parser.y"
                                { (yyval.varType) = new AST::StructType((yyvsp[-1].fieldDecls), *(yyvsp[-3].idVal)); }
#line 2369 "Parser.cpp"
    break;

  case 24: /* _VarType: STRUCT IDENTIFIER  */
#line 294 "Parser.y"
                                { (yyval.varType) = new AST::DefinedType(*(yyvsp[0].idVal)); }
#line 2375 "Parser.cpp"
    break;

  case 25: /* _VarType: UNION IDENTIFIER LBRACE FieldDecls RBRACE  */
#line 296 "Parser.y"
                                { (yyval.varType) = new AST::UnionType((yyvsp[-1].fieldDecls), *(yyvsp[-3].idVal)); }
#line 2381 "Parser.cpp"
    break;

  case 26: /* _VarType: UNION IDENTIFIER  */
#line 297 "Parser.y"
                                { (yyval.varType) = new AST::DefinedType(*(yyvsp[0].idVal)); }
#line 2387 "Parser.cpp"
    break;

  case 27: /* _VarType: ENUM IDENTIFIER LBRACE EnumList RBRACE  */
#line 299 "Parser.y"
                                { (yyval.varType) = new AST::EnumType((yyvsp[-1].enumList), *(yyvsp[-3].idVal)); }
#line 2393 "Parser.cpp"
    break;

  case 28: /* _VarType: ENUM IDENTIFIER  */
#line 300 "Parser.y"
                                { (yyval.varType) = new AST::DefinedType(*(yyvsp[0].idVal)); }
#line 2399 "Parser.cpp"
    break;

  case 29: /* _VarType: _VarType ASTERISK  */
#line 301 "Parser.y"
                                { (yyval.varType) = new AST::PointerType((yyvsp[-1].varType)); }
#line 2405 "Parser.cpp"
    break;

  case 30: /* _VarType: IDENTIFIER  */
#line 302 "Parser.y"
                                { (yyval.varType) = new AST::DefinedType(*(yyvsp[0].idVal)); }
#line 2411 "Parser.cpp"
    break;

  case 31: /* VarList: VarList COMMA VarInit  */
#line 309 "Parser.y"
                                { (yyval.varList) = (yyvsp[-2].varList); (yyval.varList)->push_back((yyvsp[0].varInit)); }
#line 2417 "Parser.cpp"
    break;

  case 32: /* VarList: VarInit  */
#line 310 "Parser.y"
                                { (yyval.varList) = new AST::VarList(); (yyval.varList)->push_back((yyvsp[0].varInit)); }
#line 2423 "Parser.cpp"
    break;

  case 33: /* VarList: %empty  */
#line 311 "Parser.y"
                                { (yyval.varList) = new AST::VarList(); }
#line 2429 "Parser.cpp"
    break;

  case 34: /* VarInit: IDENTIFIER ArrayBoundList  */
#line 317 "Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-1].idVal), *(yyvsp[0].arrayBoundList)); delete (yyvsp[0].arrayBoundList); }
#line 2435 "Parser.cpp"
    break;

  case 35: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN Expr  */
#line 319 "Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-3].idVal), *(yyvsp[-2].arrayBoundList), (yyvsp[0].expr)); delete (yyvsp[-2].arrayBoundList); }
#line 2441 "Parser.cpp"
    break;

  case 36: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN LBRACE InitList RBRACE  */
#line 321 "Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-5].idVal), *(yyvsp[-4].arrayBoundList), nullptr, (yyvsp[-1].initList));
                                  delete (yyvsp[-4].arrayBoundList); }
#line 2448 "Parser.cpp"
    break;

  case 37: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN LBRACE RBRACE  */
#line 324 "Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-4].idVal), *(yyvsp[-3].arrayBoundList), nullptr,
                                                        new AST::InitList());
                                  delete (yyvsp[-3].arrayBoundList); }
#line 2456 "Parser.cpp"
    break;

  case 38: /* InitList: InitList COMMA InitItem  */
#line 332 "Parser.y"
                                { (yyval.initList) = (yyvsp[-2].initList); (yyval.initList)->push_back((yyvsp[0].initElement)); }
#line 2462 "Parser.cpp"
    break;

  case 39: /* InitList: InitItem  */
#line 334 "Parser.y"
                                { (yyval.initList) = new AST::InitList(); (yyval.initList)->push_back((yyvsp[0].initElement)); }
#line 2468 "Parser.cpp"
    break;

  case 40: /* InitItem: Expr  */
#line 339 "Parser.y"
                                { (yyval.initElement) = new AST::InitElement((yyvsp[0].expr)); }
#line 2474 "Parser.cpp"
    break;

  case 41: /* InitItem: LBRACE InitList RBRACE  */
#line 341 "Parser.y"
                                { (yyval.initElement) = new AST::InitElement((yyvsp[-1].initList)); }
#line 2480 "Parser.cpp"
    break;

  case 42: /* ArrayBoundList: ArrayBoundList ArrayBound  */
#line 349 "Parser.y"
                                { (yyval.arrayBoundList) = (yyvsp[-1].arrayBoundList); (yyval.arrayBoundList)->push_back((yyvsp[0].sizeVal)); }
#line 2486 "Parser.cpp"
    break;

  case 43: /* ArrayBoundList: ArrayBound  */
#line 351 "Parser.y"
                                { (yyval.arrayBoundList) = new std::vector<size_t>(); (yyval.arrayBoundList)->push_back((yyvsp[0].sizeVal)); }
#line 2492 "Parser.cpp"
    break;

  case 44: /* ArrayBoundList: %empty  */
#line 352 "Parser.y"
                                { (yyval.arrayBoundList) = new std::vector<size_t>(); }
#line 2498 "Parser.cpp"
    break;

  case 45: /* ArrayBound: LBRACKET INTEGER RBRACKET  */
#line 356 "Parser.y"
                                { (yyval.sizeVal) = static_cast<size_t>((yyvsp[-1].intVal)); }
#line 2504 "Parser.cpp"
    break;

  case 46: /* ArrayBound: LBRACKET RBRACKET  */
#line 358 "Parser.y"
                                { (yyval.sizeVal) = AST::kInferredArrayBound; }
#line 2510 "Parser.cpp"
    break;

  case 47: /* ParamList: ParamList COMMA Param  */
#line 364 "Parser.y"
                                { (yyval.paramList) = (yyvsp[-2].paramList); (yyval.paramList)->push_back((yyvsp[0].param)); }
#line 2516 "Parser.cpp"
    break;

  case 48: /* ParamList: ParamList COMMA ELLIPSES  */
#line 366 "Parser.y"
                                { (yyval.paramList) = (yyvsp[-2].paramList); (yyval.paramList)->setVariant(); }
#line 2522 "Parser.cpp"
    break;

  case 49: /* ParamList: Param  */
#line 367 "Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); (yyval.paramList)->push_back((yyvsp[0].param)); }
#line 2528 "Parser.cpp"
    break;

  case 50: /* ParamList: ELLIPSES  */
#line 368 "Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); (yyval.paramList)->setVariant(); }
#line 2534 "Parser.cpp"
    break;

  case 51: /* ParamList: %empty  */
#line 369 "Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); }
#line 2540 "Parser.cpp"
    break;

  case 52: /* Param: VarType IDENTIFIER  */
#line 375 "Parser.y"
                                { (yyval.param) = new AST::Param((yyvsp[-1].varType), *(yyvsp[0].idVal)); }
#line 2546 "Parser.cpp"
    break;

  case 53: /* Param: VarType  */
#line 376 "Parser.y"
                                { (yyval.param) = new AST::Param((yyvsp[0].varType)); }
#line 2552 "Parser.cpp"
    break;

  case 54: /* BuiltinType: CHAR  */
#line 380 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::CHAR, "char"); }
#line 2558 "Parser.cpp"
    break;

  case 55: /* BuiltinType: SHORT  */
#line 381 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::SHORT, "short"); }
#line 2564 "Parser.cpp"
    break;

  case 56: /* BuiltinType: INT  */
#line 382 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::INT, "int"); }
#line 2570 "Parser.cpp"
    break;

  case 57: /* BuiltinType: LONG  */
#line 383 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::LONG, "long"); }
#line 2576 "Parser.cpp"
    break;

  case 58: /* BuiltinType: UNSIGNED  */
#line 384 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::UINT, "uint"); }
#line 2582 "Parser.cpp"
    break;

  case 59: /* BuiltinType: UNSIGNED CHAR  */
#line 385 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::UCHAR, "uchar"); }
#line 2588 "Parser.cpp"
    break;

  case 60: /* BuiltinType: UNSIGNED SHORT  */
#line 386 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::USHORT, "ushort"); }
#line 2594 "Parser.cpp"
    break;

  case 61: /* BuiltinType: UNSIGNED INT  */
#line 387 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::UINT, "uint"); }
#line 2600 "Parser.cpp"
    break;

  case 62: /* BuiltinType: UNSIGNED LONG  */
#line 388 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::ULONG, "ulong"); }
#line 2606 "Parser.cpp"
    break;

  case 63: /* BuiltinType: FLOAT  */
#line 389 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::FLOAT, "float"); }
#line 2612 "Parser.cpp"
    break;

  case 64: /* BuiltinType: DOUBLE  */
#line 390 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::DOUBLE, "double"); }
#line 2618 "Parser.cpp"
    break;

  case 65: /* BuiltinType: BOOL  */
#line 391 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::BOOL, "bool"); }
#line 2624 "Parser.cpp"
    break;

  case 66: /* BuiltinType: VOID  */
#line 392 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::VOID, "void"); }
#line 2630 "Parser.cpp"
    break;

  case 67: /* FieldDecls: FieldDecls FieldDecl  */
#line 398 "Parser.y"
                                { (yyval.fieldDecls) = (yyvsp[-1].fieldDecls); if ((yyvsp[0].fieldDecl) != NULL) (yyval.fieldDecls)->push_back((yyvsp[0].fieldDecl)); }
#line 2636 "Parser.cpp"
    break;

  case 68: /* FieldDecls: %empty  */
#line 399 "Parser.y"
                                { (yyval.fieldDecls) = new AST::FieldDecls(); }
#line 2642 "Parser.cpp"
    break;

  case 69: /* FieldDecl: VarType MemberList SEMICOLON  */
#line 403 "Parser.y"
                                { (yyval.fieldDecl) = new AST::FieldDecl((yyvsp[-2].varType), (yyvsp[-1].memberList)); }
#line 2648 "Parser.cpp"
    break;

  case 70: /* FieldDecl: SEMICOLON  */
#line 404 "Parser.y"
                                { (yyval.fieldDecl) = NULL; }
#line 2654 "Parser.cpp"
    break;

  case 71: /* MemberList: MemberList COMMA IDENTIFIER  */
#line 410 "Parser.y"
                                { (yyval.memberList) = (yyvsp[-2].memberList); (yyval.memberList)->push_back(*(yyvsp[0].idVal)); }
#line 2660 "Parser.cpp"
    break;

  case 72: /* MemberList: IDENTIFIER  */
#line 411 "Parser.y"
                                { (yyval.memberList) = new AST::MemberList(); (yyval.memberList)->push_back(*(yyvsp[0].idVal)); }
#line 2666 "Parser.cpp"
    break;

  case 73: /* MemberList: %empty  */
#line 412 "Parser.y"
                                { (yyval.memberList) = new AST::MemberList(); }
#line 2672 "Parser.cpp"
    break;

  case 74: /* EnumList: EnumList COMMA Enum  */
#line 418 "Parser.y"
                                { (yyval.enumList) = (yyvsp[-2].enumList); (yyval.enumList)->push_back((yyvsp[0].enumeration)); }
#line 2678 "Parser.cpp"
    break;

  case 75: /* EnumList: Enum  */
#line 419 "Parser.y"
                                { (yyval.enumList) = new AST::EnumList(); (yyval.enumList)->push_back((yyvsp[0].enumeration)); }
#line 2684 "Parser.cpp"
    break;

  case 76: /* EnumList: %empty  */
#line 420 "Parser.y"
                                { (yyval.enumList) = new AST::EnumList(); }
#line 2690 "Parser.cpp"
    break;

  case 77: /* Enum: IDENTIFIER  */
#line 423 "Parser.y"
                                { (yyval.enumeration) = new AST::Enum(*(yyvsp[0].idVal)); }
#line 2696 "Parser.cpp"
    break;

  case 78: /* Enum: IDENTIFIER ASSIGN INTEGER  */
#line 425 "Parser.y"
                                { (yyval.enumeration) = new AST::Enum(*(yyvsp[-2].idVal), true, (yyvsp[0].intVal)); }
#line 2702 "Parser.cpp"
    break;

  case 79: /* Stmts: Stmts Stmt  */
#line 430 "Parser.y"
                                { (yyval.stmts) = (yyvsp[-1].stmts); if ((yyvsp[0].stmt) != NULL) (yyval.stmts)->push_back((yyvsp[0].stmt)); }
#line 2708 "Parser.cpp"
    break;

  case 80: /* Stmts: %empty  */
#line 431 "Parser.y"
                                { (yyval.stmts) = new AST::Stmts(); }
#line 2714 "Parser.cpp"
    break;

  case 81: /* Stmt: Expr SEMICOLON  */
#line 434 "Parser.y"
                                { (yyval.stmt) = (yyvsp[-1].expr); (yyval.stmt)->setLoc((yylsp[-1]).first_line, (yylsp[-1]).first_column); }
#line 2720 "Parser.cpp"
    break;

  case 82: /* Stmt: IfStmt  */
#line 435 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].ifStmt); }
#line 2726 "Parser.cpp"
    break;

  case 83: /* Stmt: SwitchStmt  */
#line 436 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].switchStmt); }
#line 2732 "Parser.cpp"
    break;

  case 84: /* Stmt: ForStmt  */
#line 437 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].forStmt); }
#line 2738 "Parser.cpp"
    break;

  case 85: /* Stmt: DoStmt  */
#line 438 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].doStmt); }
#line 2744 "Parser.cpp"
    break;

  case 86: /* Stmt: WhileStmt  */
#line 439 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].whileStmt); }
#line 2750 "Parser.cpp"
    break;

  case 87: /* Stmt: ContinueStmt  */
#line 440 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].continueStmt); }
#line 2756 "Parser.cpp"
    break;

  case 88: /* Stmt: BreakStmt  */
#line 441 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].breakStmt); }
#line 2762 "Parser.cpp"
    break;

  case 89: /* Stmt: ReturnStmt  */
#line 442 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].returnStmt); }
#line 2768 "Parser.cpp"
    break;

  case 90: /* Stmt: Block  */
#line 443 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].block); }
#line 2774 "Parser.cpp"
    break;

  case 91: /* Stmt: TypeDecl  */
#line 444 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].typeDecl); }
#line 2780 "Parser.cpp"
    break;

  case 92: /* Stmt: VarDecl  */
#line 445 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].varDecl); }
#line 2786 "Parser.cpp"
    break;

  case 93: /* Stmt: SEMICOLON  */
#line 446 "Parser.y"
                                { (yyval.stmt) = NULL; }
#line 2792 "Parser.cpp"
    break;

  case 94: /* IfStmt: IF LPARENTHESES Expr RPARENTHESES Stmt ELSE Stmt  */
#line 450 "Parser.y"
                                { (yyval.ifStmt) = new AST::IfStmt((yyvsp[-4].expr), (yyvsp[-2].stmt), (yyvsp[0].stmt));
                                  (yyval.ifStmt)->setLoc((yylsp[-6]).first_line, (yylsp[-6]).first_column); }
#line 2799 "Parser.cpp"
    break;

  case 95: /* IfStmt: IF LPARENTHESES Expr RPARENTHESES Stmt  */
#line 453 "Parser.y"
                                { (yyval.ifStmt) = new AST::IfStmt((yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.ifStmt)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 2806 "Parser.cpp"
    break;

  case 96: /* SwitchStmt: SWITCH LPARENTHESES Expr RPARENTHESES LBRACE CaseStmtList RBRACE  */
#line 460 "Parser.y"
                                { (yyval.switchStmt) = new AST::SwitchStmt((yyvsp[-4].expr), (yyvsp[-1].caseStmtList));
                                  (yyval.switchStmt)->setLoc((yylsp[-6]).first_line, (yylsp[-6]).first_column); }
#line 2813 "Parser.cpp"
    break;

  case 97: /* CaseStmtList: CaseStmtList CaseStmt  */
#line 466 "Parser.y"
                                { (yyval.caseStmtList) = (yyvsp[-1].caseStmtList); (yyval.caseStmtList)->push_back((yyvsp[0].caseStmt)); }
#line 2819 "Parser.cpp"
    break;

  case 98: /* CaseStmtList: %empty  */
#line 467 "Parser.y"
                                { (yyval.caseStmtList) = new AST::CaseStmtList(); }
#line 2825 "Parser.cpp"
    break;

  case 99: /* CaseStmt: CASE Expr COLON Stmts  */
#line 471 "Parser.y"
                                { (yyval.caseStmt) = new AST::CaseStmt((yyvsp[-2].expr), (yyvsp[0].stmts));
                                  (yyval.caseStmt)->setLoc((yylsp[-3]).first_line, (yylsp[-3]).first_column); }
#line 2832 "Parser.cpp"
    break;

  case 100: /* CaseStmt: DEFAULT COLON Stmts  */
#line 474 "Parser.y"
                                { (yyval.caseStmt) = new AST::CaseStmt(NULL, (yyvsp[0].stmts));
                                  (yyval.caseStmt)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 2839 "Parser.cpp"
    break;

  case 101: /* ForStmt: FOR LPARENTHESES Expr SEMICOLON Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 479 "Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt((yyvsp[-6].expr), (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.forStmt)->setLoc((yylsp[-8]).first_line, (yylsp[-8]).first_column); }
#line 2846 "Parser.cpp"
    break;

  case 102: /* ForStmt: FOR LPARENTHESES SEMICOLON Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 482 "Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt(NULL, (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.forStmt)->setLoc((yylsp[-7]).first_line, (yylsp[-7]).first_column); }
#line 2853 "Parser.cpp"
    break;

  case 103: /* ForStmt: FOR LPARENTHESES VarDecl Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 485 "Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt((yyvsp[-5].varDecl), (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.forStmt)->setLoc((yylsp[-7]).first_line, (yylsp[-7]).first_column); }
#line 2860 "Parser.cpp"
    break;

  case 104: /* DoStmt: DO Stmt WHILE LPARENTHESES Expr RPARENTHESES SEMICOLON  */
#line 490 "Parser.y"
                                { (yyval.doStmt) = new AST::DoStmt((yyvsp[-5].stmt), (yyvsp[-2].expr));
                                  (yyval.doStmt)->setLoc((yylsp[-6]).first_line, (yylsp[-6]).first_column); }
#line 2867 "Parser.cpp"
    break;

  case 105: /* WhileStmt: WHILE LPARENTHESES Expr RPARENTHESES Stmt  */
#line 495 "Parser.y"
                                { (yyval.whileStmt) = new AST::WhileStmt((yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.whileStmt)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 2874 "Parser.cpp"
    break;

  case 106: /* ContinueStmt: CONTINUE SEMICOLON  */
#line 500 "Parser.y"
                                { (yyval.continueStmt) = new AST::ContinueStmt();
                                  (yyval.continueStmt)->setLoc((yylsp[-1]).first_line, (yylsp[-1]).first_column); }
#line 2881 "Parser.cpp"
    break;

  case 107: /* BreakStmt: BREAK SEMICOLON  */
#line 504 "Parser.y"
                                { (yyval.breakStmt) = new AST::BreakStmt();
                                  (yyval.breakStmt)->setLoc((yylsp[-1]).first_line, (yylsp[-1]).first_column); }
#line 2888 "Parser.cpp"
    break;

  case 108: /* ReturnStmt: RETURN SEMICOLON  */
#line 508 "Parser.y"
                                { (yyval.returnStmt) = new AST::ReturnStmt();
                                  (yyval.returnStmt)->setLoc((yylsp[-1]).first_line, (yylsp[-1]).first_column); }
#line 2895 "Parser.cpp"
    break;

  case 109: /* ReturnStmt: RETURN Expr SEMICOLON  */
#line 511 "Parser.y"
                                { (yyval.returnStmt) = new AST::ReturnStmt((yyvsp[-1].expr));
                                  (yyval.returnStmt)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 2902 "Parser.cpp"
    break;

  case 110: /* Block: LBRACE Stmts RBRACE  */
#line 515 "Parser.y"
                                { (yyval.block) = new AST::Block((yyvsp[-1].stmts));
                                  (yyval.block)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 2909 "Parser.cpp"
    break;

  case 111: /* Expr: IDENTIFIER  */
#line 523 "Parser.y"
                                { (yyval.expr) = new AST::Variable(*(yyvsp[0].idVal)); }
#line 2915 "Parser.cpp"
    break;

  case 112: /* Expr: Constant  */
#line 524 "Parser.y"
                                { (yyval.expr) = (yyvsp[0].constant); }
#line 2921 "Parser.cpp"
    break;

  case 113: /* Expr: LPARENTHESES Expr RPARENTHESES  */
#line 526 "Parser.y"
                                { (yyval.expr) = (yyvsp[-1].expr); }
#line 2927 "Parser.cpp"
    break;

  case 114: /* Expr: Expr COMMA Expr  */
#line 527 "Parser.y"
                                { (yyval.expr) = new AST::CommaExpr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2933 "Parser.cpp"
    break;

  case 115: /* Expr: IDENTIFIER LPARENTHESES ExprList RPARENTHESES  */
#line 529 "Parser.y"
                                { (yyval.expr) = new AST::FuncCall(*(yyvsp[-3].idVal), (yyvsp[-1].exprList)); }
#line 2939 "Parser.cpp"
    break;

  case 116: /* Expr: Expr DOT IDENTIFIER  */
#line 531 "Parser.y"
                                { (yyval.expr) = new AST::StructRef((yyvsp[-2].expr), *(yyvsp[0].idVal)); }
#line 2945 "Parser.cpp"
    break;

  case 117: /* Expr: Expr ARROW IDENTIFIER  */
#line 533 "Parser.y"
                                { (yyval.expr) = new AST::StructDeref((yyvsp[-2].expr), *(yyvsp[0].idVal)); }
#line 2951 "Parser.cpp"
    break;

  case 118: /* Expr: Expr LBRACKET Expr RBRACKET  */
#line 535 "Parser.y"
                                { (yyval.expr) = new AST::Subscript((yyvsp[-3].expr), (yyvsp[-1].expr)); }
#line 2957 "Parser.cpp"
    break;

  case 119: /* Expr: LPARENTHESES VarType RPARENTHESES Expr  */
#line 537 "Parser.y"
                                { (yyval.expr) = new AST::TypeCast((yyvsp[-2].varType), (yyvsp[0].expr)); }
#line 2963 "Parser.cpp"
    break;

  case 120: /* Expr: SIZEOF LPARENTHESES VarType RPARENTHESES  */
#line 539 "Parser.y"
                                { (yyval.expr) = new AST::SizeOf((yyvsp[-1].varType)); }
#line 2969 "Parser.cpp"
    break;

  case 121: /* Expr: SIZEOF LPARENTHESES Expr RPARENTHESES  */
#line 541 "Parser.y"
                                { (yyval.expr) = new AST::SizeOf((yyvsp[-1].expr)); }
#line 2975 "Parser.cpp"
    break;

  case 122: /* Expr: SIZEOF LPARENTHESES IDENTIFIER RPARENTHESES  */
#line 543 "Parser.y"
                                { (yyval.expr) = new AST::SizeOf(*(yyvsp[-1].idVal)); }
#line 2981 "Parser.cpp"
    break;

  case 123: /* Expr: ADD Expr  */
#line 545 "Parser.y"
                                { (yyval.expr) = new AST::UnaryPlus((yyvsp[0].expr)); }
#line 2987 "Parser.cpp"
    break;

  case 124: /* Expr: SUB Expr  */
#line 547 "Parser.y"
                                { (yyval.expr) = new AST::UnaryMinus((yyvsp[0].expr)); }
#line 2993 "Parser.cpp"
    break;

  case 125: /* Expr: ASTERISK Expr  */
#line 549 "Parser.y"
                                { (yyval.expr) = new AST::PointerDeref((yyvsp[0].expr)); }
#line 2999 "Parser.cpp"
    break;

  case 126: /* Expr: AMPERSAND Expr  */
#line 551 "Parser.y"
                                { (yyval.expr) = new AST::AddressOf((yyvsp[0].expr)); }
#line 3005 "Parser.cpp"
    break;

  case 127: /* Expr: Expr ASSIGN Expr  */
#line 552 "Parser.y"
                                { (yyval.expr) = new AST::Assign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3011 "Parser.cpp"
    break;

  case 128: /* Expr: Expr ADD Expr  */
#line 554 "Parser.y"
                                { (yyval.expr) = new AST::Add((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3017 "Parser.cpp"
    break;

  case 129: /* Expr: Expr SUB Expr  */
#line 556 "Parser.y"
                                { (yyval.expr) = new AST::Sub((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3023 "Parser.cpp"
    break;

  case 130: /* Expr: Expr ASTERISK Expr  */
#line 558 "Parser.y"
                                { (yyval.expr) = new AST::Mul((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3029 "Parser.cpp"
    break;

  case 131: /* Expr: Expr DIV Expr  */
#line 559 "Parser.y"
                                { (yyval.expr) = new AST::Div((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3035 "Parser.cpp"
    break;

  case 132: /* Expr: Expr MOD Expr  */
#line 560 "Parser.y"
                                { (yyval.expr) = new AST::Mod((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3041 "Parser.cpp"
    break;

  case 133: /* Expr: Expr DADD  */
#line 562 "Parser.y"
                                { (yyval.expr) = new AST::PostfixInc((yyvsp[-1].expr)); }
#line 3047 "Parser.cpp"
    break;

  case 134: /* Expr: Expr DSUB  */
#line 564 "Parser.y"
                                { (yyval.expr) = new AST::PostfixDec((yyvsp[-1].expr)); }
#line 3053 "Parser.cpp"
    break;

  case 135: /* Expr: DADD Expr  */
#line 566 "Parser.y"
                                { (yyval.expr) = new AST::PrefixInc((yyvsp[0].expr)); }
#line 3059 "Parser.cpp"
    break;

  case 136: /* Expr: DSUB Expr  */
#line 568 "Parser.y"
                                { (yyval.expr) = new AST::PrefixDec((yyvsp[0].expr)); }
#line 3065 "Parser.cpp"
    break;

  case 137: /* Expr: Expr ADDEQ Expr  */
#line 569 "Parser.y"
                                { (yyval.expr) = new AST::AddAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3071 "Parser.cpp"
    break;

  case 138: /* Expr: Expr SUBEQ Expr  */
#line 570 "Parser.y"
                                { (yyval.expr) = new AST::SubAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3077 "Parser.cpp"
    break;

  case 139: /* Expr: Expr MULEQ Expr  */
#line 571 "Parser.y"
                                { (yyval.expr) = new AST::MulAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3083 "Parser.cpp"
    break;

  case 140: /* Expr: Expr DIVEQ Expr  */
#line 572 "Parser.y"
                                { (yyval.expr) = new AST::DivAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3089 "Parser.cpp"
    break;

  case 141: /* Expr: Expr MODEQ Expr  */
#line 573 "Parser.y"
                                { (yyval.expr) = new AST::ModAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3095 "Parser.cpp"
    break;

  case 142: /* Expr: Expr AMPERSAND Expr  */
#line 575 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseAnd((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3101 "Parser.cpp"
    break;

  case 143: /* Expr: Expr BOR Expr  */
#line 576 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseOr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3107 "Parser.cpp"
    break;

  case 144: /* Expr: Expr BXOR Expr  */
#line 577 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseXor((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3113 "Parser.cpp"
    break;

  case 145: /* Expr: BNOT Expr  */
#line 578 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseNot((yyvsp[0].expr)); }
#line 3119 "Parser.cpp"
    break;

  case 146: /* Expr: Expr BANDEQ Expr  */
#line 579 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseAndAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3125 "Parser.cpp"
    break;

  case 147: /* Expr: Expr BOREQ Expr  */
#line 580 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseOrAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3131 "Parser.cpp"
    break;

  case 148: /* Expr: Expr BXOREQ Expr  */
#line 581 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseXorAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3137 "Parser.cpp"
    break;

  case 149: /* Expr: Expr SHL Expr  */
#line 582 "Parser.y"
                                { (yyval.expr) = new AST::LeftShift((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3143 "Parser.cpp"
    break;

  case 150: /* Expr: Expr SHR Expr  */
#line 583 "Parser.y"
                                { (yyval.expr) = new AST::RightShift((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3149 "Parser.cpp"
    break;

  case 151: /* Expr: Expr SHLEQ Expr  */
#line 584 "Parser.y"
                                { (yyval.expr) = new AST::LeftShiftAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3155 "Parser.cpp"
    break;

  case 152: /* Expr: Expr SHREQ Expr  */
#line 585 "Parser.y"
                                { (yyval.expr) = new AST::RightShiftAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3161 "Parser.cpp"
    break;

  case 153: /* Expr: Expr AND Expr  */
#line 586 "Parser.y"
                                { (yyval.expr) = new AST::LogicAnd((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3167 "Parser.cpp"
    break;

  case 154: /* Expr: Expr OR Expr  */
#line 587 "Parser.y"
                                { (yyval.expr) = new AST::LogicOr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3173 "Parser.cpp"
    break;

  case 155: /* Expr: NOT Expr  */
#line 588 "Parser.y"
                                { (yyval.expr) = new AST::LogicNot((yyvsp[0].expr)); }
#line 3179 "Parser.cpp"
    break;

  case 156: /* Expr: Expr EQ Expr  */
#line 589 "Parser.y"
                                { (yyval.expr) = new AST::LogicEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3185 "Parser.cpp"
    break;

  case 157: /* Expr: Expr NEQ Expr  */
#line 590 "Parser.y"
                                { (yyval.expr) = new AST::LogicNotEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3191 "Parser.cpp"
    break;

  case 158: /* Expr: Expr LT Expr  */
#line 591 "Parser.y"
                                { (yyval.expr) = new AST::LogicLessThan((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3197 "Parser.cpp"
    break;

  case 159: /* Expr: Expr LE Expr  */
#line 592 "Parser.y"
                                { (yyval.expr) = new AST::LogicLessEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3203 "Parser.cpp"
    break;

  case 160: /* Expr: Expr GT Expr  */
#line 593 "Parser.y"
                                { (yyval.expr) = new AST::LogicGreaterThan((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3209 "Parser.cpp"
    break;

  case 161: /* Expr: Expr GE Expr  */
#line 594 "Parser.y"
                                { (yyval.expr) = new AST::LogicGreaterEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3215 "Parser.cpp"
    break;

  case 162: /* Expr: Expr QUESTION Expr COLON Expr  */
#line 596 "Parser.y"
                                { (yyval.expr) = new AST::TernaryCondition((yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3221 "Parser.cpp"
    break;

  case 163: /* ExprList: ExprList COMMA Expr  */
#line 600 "Parser.y"
                                { (yyval.exprList) = (yyvsp[-2].exprList); (yyval.exprList)->push_back((yyvsp[0].expr)); }
#line 3227 "Parser.cpp"
    break;

  case 164: /* ExprList: Expr  */
#line 601 "Parser.y"
                                { (yyval.exprList) = new AST::ExprList(); (yyval.exprList)->push_back((yyvsp[0].expr)); }
#line 3233 "Parser.cpp"
    break;

  case 165: /* ExprList: %empty  */
#line 602 "Parser.y"
                                { (yyval.exprList) = new AST::ExprList(); }
#line 3239 "Parser.cpp"
    break;

  case 166: /* Constant: CHARACTER  */
#line 605 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].charVal)); }
#line 3245 "Parser.cpp"
    break;

  case 167: /* Constant: INTEGER  */
#line 606 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].intVal)); }
#line 3251 "Parser.cpp"
    break;

  case 168: /* Constant: UINTEGER  */
#line 607 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].uintVal)); }
#line 3257 "Parser.cpp"
    break;

  case 169: /* Constant: LONGVAL  */
#line 608 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].longVal)); }
#line 3263 "Parser.cpp"
    break;

  case 170: /* Constant: ULONGVAL  */
#line 609 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].ulongVal)); }
#line 3269 "Parser.cpp"
    break;

  case 171: /* Constant: FLOATVAL  */
#line 610 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].floatVal)); }
#line 3275 "Parser.cpp"
    break;

  case 172: /* Constant: DOUBLEVAL  */
#line 611 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].doubleVal)); }
#line 3281 "Parser.cpp"
    break;

  case 173: /* Constant: STRING  */
#line 612 "Parser.y"
                                { (yyval.constant) = new AST::ConstStr(*(yyvsp[0].strVal)); }
#line 3287 "Parser.cpp"
    break;

  case 174: /* Constant: TRUE  */
#line 613 "Parser.y"
                                { (yyval.constant) = new AST::Constant(true); }
#line 3293 "Parser.cpp"
    break;

  case 175: /* Constant: FALSE  */
#line 614 "Parser.y"
                                { (yyval.constant) = new AST::Constant(false); }
#line 3299 "Parser.cpp"
    break;


#line 3303 "Parser.cpp"

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

#line 617 "Parser.y"


 /* Subroutines Section */
