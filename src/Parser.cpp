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
  YYSYMBOL_InitItem = 98,                  /* InitItem  */
  YYSYMBOL_ArrayBoundList = 99,            /* ArrayBoundList  */
  YYSYMBOL_ArrayBound = 100,               /* ArrayBound  */
  YYSYMBOL_ParamList = 101,                /* ParamList  */
  YYSYMBOL_Param = 102,                    /* Param  */
  YYSYMBOL_BuiltinType = 103,              /* BuiltinType  */
  YYSYMBOL_FieldDecls = 104,               /* FieldDecls  */
  YYSYMBOL_FieldDecl = 105,                /* FieldDecl  */
  YYSYMBOL_MemberList = 106,               /* MemberList  */
  YYSYMBOL_EnumList = 107,                 /* EnumList  */
  YYSYMBOL_Enum = 108,                     /* Enum  */
  YYSYMBOL_Stmts = 109,                    /* Stmts  */
  YYSYMBOL_Stmt = 110,                     /* Stmt  */
  YYSYMBOL_IfStmt = 111,                   /* IfStmt  */
  YYSYMBOL_SwitchStmt = 112,               /* SwitchStmt  */
  YYSYMBOL_CaseStmtList = 113,             /* CaseStmtList  */
  YYSYMBOL_CaseStmt = 114,                 /* CaseStmt  */
  YYSYMBOL_ForStmt = 115,                  /* ForStmt  */
  YYSYMBOL_DoStmt = 116,                   /* DoStmt  */
  YYSYMBOL_WhileStmt = 117,                /* WhileStmt  */
  YYSYMBOL_ContinueStmt = 118,             /* ContinueStmt  */
  YYSYMBOL_BreakStmt = 119,                /* BreakStmt  */
  YYSYMBOL_ReturnStmt = 120,               /* ReturnStmt  */
  YYSYMBOL_Block = 121,                    /* Block  */
  YYSYMBOL_Expr = 122,                     /* Expr  */
  YYSYMBOL_ExprList = 123,                 /* ExprList  */
  YYSYMBOL_Constant = 124                  /* Constant  */
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
#define YYLAST   2189

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  85
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  40
/* YYNRULES -- Number of rules.  */
#define YYNRULES  165
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  305

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
       0,   223,   223,   226,   227,   230,   231,   232,   235,   237,
     241,   244,   248,   253,   254,   257,   258,   260,   262,   264,
     265,   271,   273,   274,   279,   281,   283,   286,   294,   296,
     300,   302,   310,   312,   314,   317,   319,   325,   327,   329,
     330,   331,   337,   338,   342,   343,   344,   345,   346,   347,
     348,   349,   350,   351,   352,   353,   354,   359,   361,   364,
     366,   371,   373,   374,   379,   381,   382,   385,   386,   392,
     393,   396,   397,   398,   399,   400,   401,   402,   403,   404,
     405,   406,   407,   408,   411,   413,   419,   424,   426,   429,
     431,   435,   437,   439,   443,   447,   452,   455,   458,   459,
     463,   470,   471,   472,   474,   475,   477,   479,   481,   483,
     485,   487,   489,   491,   493,   495,   497,   499,   500,   502,
     504,   506,   507,   508,   510,   512,   514,   516,   517,   518,
     519,   520,   521,   523,   524,   525,   526,   527,   528,   529,
     530,   531,   532,   533,   534,   535,   536,   537,   538,   539,
     540,   541,   542,   546,   548,   549,   552,   553,   554,   555,
     556,   557,   558,   559,   560,   561
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
  "VarList", "VarInit", "InitList", "InitItem", "ArrayBoundList",
  "ArrayBound", "ParamList", "Param", "BuiltinType", "FieldDecls",
  "FieldDecl", "MemberList", "EnumList", "Enum", "Stmts", "Stmt", "IfStmt",
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

#define YYPACT_NINF (-181)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-21)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
    -181,     9,  2085,  -181,  -181,  -181,  -181,  -181,    97,  2113,
    -181,  -181,  -181,  -181,   -64,   -60,   -40,  -181,  -181,  -181,
    -181,  -181,   -39,     6,  -181,  -181,  -181,  -181,  -181,    37,
      52,    58,    69,    31,   105,  -181,  -181,  -181,  -181,  -181,
     -16,   952,   -13,    44,  -181,    48,  -181,   126,   924,    91,
      15,  -181,  -181,    51,    37,     4,  -181,  -181,   113,   809,
    -181,   127,  -181,  -181,  -181,    64,  -181,  -181,    66,   -16,
    -181,  -181,   965,     3,  -181,   911,   911,   628,   780,   911,
     911,   911,   911,   911,   911,  -181,  -181,   138,   141,  -181,
    -181,  -181,  -181,  -181,  -181,  -181,  -181,  1862,  -181,  -181,
     110,  -181,  -181,  -181,  -181,  -181,  -181,  -181,   128,   128,
       1,   142,  1037,   885,  -181,    17,  -181,  1862,   128,   128,
     128,   128,   128,   128,   704,   911,   911,   911,    80,   911,
     911,    85,   911,   911,   911,   911,   911,   911,  -181,  -181,
     911,   911,   911,   911,   911,   911,   911,   911,   911,   911,
     911,   911,   911,   911,   911,   911,   911,   911,   911,   911,
     911,   911,    86,  -181,   232,   911,  -181,    32,   885,  -181,
      54,   151,  1083,  1862,    35,  1862,  1129,  -181,   128,  2067,
    -181,  1175,  1862,   111,   111,   128,   128,  1862,  1862,  1862,
    1862,  1862,  1985,  2026,  1862,  1862,  1862,    33,    33,  1862,
    1862,  1944,  1903,  2108,  2108,   149,   149,   149,   149,  -181,
    -181,  -181,  -181,   153,   155,   162,   392,   176,   185,   186,
     552,  -181,  -181,    48,  -181,  -181,  -181,  -181,  -181,  -181,
    -181,  -181,  -181,  -181,  1221,   128,  -181,  -181,  -181,  -181,
    -181,   911,  -181,   911,  -181,   312,   911,   911,   472,   129,
     911,  -181,  -181,  -181,  1267,  -181,  1862,   559,  -181,  1313,
    1359,   911,   911,  1405,   183,  1451,  -181,   392,   187,  1497,
    1543,   911,   911,   392,   139,  -181,   911,   911,  1589,  1635,
    -181,   392,   -14,  1681,  1727,   911,   199,  -181,  -181,   911,
     201,  -181,   392,   392,  1773,  -181,  1819,  -181,  -181,  -181,
     392,  -181,   392,  -181,   392
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       4,     0,     2,     1,    44,    45,    46,    47,    48,     0,
      56,    53,    54,    55,     0,     0,     0,    20,     3,     5,
       6,     7,    23,    13,    15,    49,    50,    51,    52,    14,
       0,     0,     0,    34,     0,    22,    12,    19,    58,    58,
      66,    41,     0,    24,    33,     0,    11,     0,     0,    67,
       0,    65,    40,    43,    13,     0,    39,    36,     0,     0,
      32,    34,    21,    60,    16,    63,    57,    17,     0,     0,
      18,    42,     0,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   164,   165,     0,   101,   156,
     157,   158,   159,   160,   161,   162,   163,    25,   102,    62,
       0,    68,    64,    38,    37,     8,    70,     9,   115,   116,
     101,     0,     0,     0,    27,     0,    29,    30,   113,   114,
     125,   126,   135,   145,     0,   155,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   123,   124,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    59,     0,     0,   103,     0,     0,    26,
     101,     0,     0,   154,     0,   104,     0,   106,   120,   132,
     107,     0,   117,   118,   119,   121,   122,   127,   128,   129,
     130,   131,   133,   134,   136,   137,   138,   139,   140,   141,
     142,   143,   144,   146,   147,   150,   151,   148,   149,    61,
      83,    70,    10,     0,     0,     0,     0,     0,     0,     0,
       0,    82,    81,    23,    69,    72,    73,    74,    75,    76,
      77,    78,    79,    80,     0,   109,    31,    28,   112,   110,
     111,     0,   105,     0,   108,     0,     0,     0,     0,     0,
       0,    96,    97,    98,     0,    71,   153,   152,   100,     0,
       0,     0,     0,     0,     0,     0,    99,     0,     0,     0,
       0,     0,     0,     0,    85,    88,     0,     0,     0,     0,
      95,     0,     0,     0,     0,     0,     0,    84,    86,     0,
       0,    87,     0,     0,     0,    94,     0,    70,    92,    93,
       0,    70,    90,    91,    89
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -181,  -181,  -181,  -181,  -181,  -181,    -2,   207,    82,    -8,
    -181,   165,    98,    45,  -181,   169,  -181,   143,  -181,   175,
    -181,  -181,  -181,   147,  -180,  -155,  -181,  -181,  -181,  -181,
    -181,  -181,  -181,  -181,  -181,  -181,  -181,   -54,  -181,  -181
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
       0,     1,     2,    18,    19,   107,   221,   222,   223,    23,
      34,    35,   115,   116,    43,    44,    55,    56,    24,    47,
      66,   100,    50,    51,   164,   224,   225,   226,   282,   291,
     227,   228,   229,   230,   231,   232,   233,   234,   174,    98
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      20,    29,    57,   288,   -20,    97,   -20,    72,   105,     3,
     -20,    36,    30,   125,   -20,    37,    31,    73,    69,   106,
     168,   108,   109,   112,   117,   118,   119,   120,   121,   122,
     123,   245,    70,    54,   169,   168,    32,    33,   241,    54,
      54,   128,   129,    41,   131,    42,    37,   132,   242,   236,
     289,   290,   134,   135,   136,   137,   138,   139,    42,   117,
      49,   249,    59,   -20,    54,    58,   125,   238,    38,    54,
     172,   173,   175,   176,    39,   178,   179,   -20,   181,   182,
     183,   184,   185,   186,    22,    40,   187,   188,   189,   190,
     191,   192,   193,   194,   195,   196,   197,   198,   199,   200,
     201,   202,   203,   204,   205,   206,   207,   208,    45,    68,
      46,   235,   274,   162,   117,   163,    54,   302,   280,   128,
     129,   304,   131,    53,    61,   132,   287,    71,    74,    65,
      65,    63,   136,   137,   138,   139,   128,   298,   299,   131,
      99,    42,   132,    64,   101,   303,    25,    26,    27,    28,
     124,   138,   139,   125,    53,   165,   177,   128,   129,   111,
     131,   180,   209,   132,   239,   246,   254,   247,   134,   135,
     136,   137,   138,   139,   248,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,   150,   151,   256,   250,   257,
     251,   252,   259,   260,   263,   272,   265,   264,    14,    15,
      16,   281,    17,   275,   295,   297,   171,   269,   270,    21,
      62,   167,    60,   237,    48,   104,   102,   278,   279,     0,
       0,     0,   283,   284,     0,     0,     0,     0,     0,     0,
       0,   294,     0,     0,     0,   296,     0,   210,     0,     0,
      54,    75,    76,     0,    77,     0,   262,     0,   211,   212,
       0,    79,    80,     0,     0,    81,    82,     0,     0,     0,
       0,     0,     0,     0,    83,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    84,     0,     0,     0,     0,     0,
       0,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    85,    86,   213,     0,   214,     0,     0,   215,   216,
     217,   218,   219,   220,    14,    15,    16,    87,   110,    89,
      90,    91,    92,    93,    94,    95,    96,   210,     0,     0,
       0,    75,    76,     0,    77,     0,     0,     0,   211,   258,
       0,    79,    80,     0,     0,    81,    82,     0,     0,     0,
       0,     0,     0,     0,    83,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    84,     0,     0,     0,     0,     0,
       0,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    85,    86,   213,     0,   214,     0,     0,   215,   216,
     217,   218,   219,   220,    14,    15,    16,    87,   110,    89,
      90,    91,    92,    93,    94,    95,    96,   210,     0,     0,
       0,    75,    76,     0,    77,     0,     0,     0,   211,     0,
       0,    79,    80,     0,     0,    81,    82,     0,     0,     0,
       0,     0,     0,     0,    83,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    84,     0,     0,     0,     0,     0,
       0,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    85,    86,   213,     0,   214,     0,     0,   215,   216,
     217,   218,   219,   220,    14,    15,    16,    87,   110,    89,
      90,    91,    92,    93,    94,    95,    96,   261,     0,     0,
       0,    75,    76,     0,    77,     0,     0,     0,     0,     0,
       0,    79,    80,     0,     0,    81,    82,     0,     0,     0,
       0,     0,     0,     0,    83,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    84,     0,     0,     0,     0,     0,
       0,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    85,    86,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    14,    15,    16,    87,   110,    89,
      90,    91,    92,    93,    94,    95,    96,   253,     0,     0,
       0,    75,    76,     0,    77,   127,     0,   128,   129,   130,
     131,    79,    80,   132,     0,    81,    82,     0,   134,   135,
     136,   137,   138,   139,    83,     0,     0,     0,     0,   145,
     146,     0,     0,     0,    84,   150,   151,     0,     0,   154,
     155,     0,   156,   157,   158,   159,   160,   161,     0,     0,
       0,    85,    86,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,    75,    76,     0,
      77,     0,     0,     0,     0,     0,     0,    79,    80,     0,
       0,    81,    82,     0,     0,     0,     0,     0,     0,     0,
      83,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      84,     0,     0,     0,     0,     0,     0,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    85,    86,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      14,    15,    16,    87,   110,    89,    90,    91,    92,    93,
      94,    95,    96,    75,    76,     0,    77,     0,     0,     0,
       0,     0,     0,    79,    80,     0,     0,    81,    82,     0,
       0,     0,     0,     0,     0,     0,    83,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    84,     0,     0,     0,
       0,     0,     0,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    85,    86,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    14,    15,    16,    87,
     170,    89,    90,    91,    92,    93,    94,    95,    96,    75,
      76,     0,    77,     0,     0,     0,   113,   114,     0,    79,
      80,     0,     0,    81,    82,     0,     0,     0,     0,     0,
       0,     0,    83,     0,     0,     0,     0,     0,    75,    76,
       0,    77,    84,     0,     0,    78,     0,     0,    79,    80,
       0,     0,    81,    82,     0,     0,     0,     0,     0,    85,
      86,    83,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    84,     0,     0,     0,    87,    88,    89,    90,    91,
      92,    93,    94,    95,    96,     0,     0,     0,    85,    86,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    75,    76,     0,    77,     0,     0,
       0,   113,     0,     0,    79,    80,     0,     0,    81,    82,
       0,     0,     0,     0,     0,     0,     0,    83,     0,     0,
      75,    76,     0,    77,     0,     0,     0,    84,     0,    63,
      79,    80,     0,     0,    81,    82,     0,     0,     0,     0,
       0,    67,     0,    83,    85,    86,     0,     0,     0,     0,
       0,     0,     0,    84,     0,     0,     0,     0,     0,    52,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      85,    86,   103,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,     0,     0,     0,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    14,    15,    16,     0,
      17,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,     0,     0,     0,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,     0,    17,     0,
       0,     0,     0,     0,     0,     0,     0,    14,    15,    16,
     126,    17,     0,   127,     0,   128,   129,   130,   131,     0,
     166,   132,     0,     0,     0,   133,   134,   135,   136,   137,
     138,   139,   140,   141,   142,   143,   144,   145,   146,     0,
     147,   148,   149,   150,   151,   152,   153,   154,   155,     0,
     156,   157,   158,   159,   160,   161,   126,     0,     0,   127,
       0,   128,   129,   130,   131,     0,   240,   132,     0,     0,
       0,   133,   134,   135,   136,   137,   138,   139,   140,   141,
     142,   143,   144,   145,   146,     0,   147,   148,   149,   150,
     151,   152,   153,   154,   155,     0,   156,   157,   158,   159,
     160,   161,   126,   243,     0,   127,     0,   128,   129,   130,
     131,     0,     0,   132,     0,     0,     0,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,     0,   147,   148,   149,   150,   151,   152,   153,   154,
     155,     0,   156,   157,   158,   159,   160,   161,   126,     0,
       0,   127,     0,   128,   129,   130,   131,     0,     0,   132,
     244,     0,     0,   133,   134,   135,   136,   137,   138,   139,
     140,   141,   142,   143,   144,   145,   146,     0,   147,   148,
     149,   150,   151,   152,   153,   154,   155,     0,   156,   157,
     158,   159,   160,   161,   126,     0,   255,   127,     0,   128,
     129,   130,   131,     0,     0,   132,     0,     0,     0,   133,
     134,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,     0,   147,   148,   149,   150,   151,   152,
     153,   154,   155,     0,   156,   157,   158,   159,   160,   161,
     126,     0,   266,   127,     0,   128,   129,   130,   131,     0,
       0,   132,     0,     0,     0,   133,   134,   135,   136,   137,
     138,   139,   140,   141,   142,   143,   144,   145,   146,     0,
     147,   148,   149,   150,   151,   152,   153,   154,   155,     0,
     156,   157,   158,   159,   160,   161,   126,     0,     0,   127,
       0,   128,   129,   130,   131,     0,   267,   132,     0,     0,
       0,   133,   134,   135,   136,   137,   138,   139,   140,   141,
     142,   143,   144,   145,   146,     0,   147,   148,   149,   150,
     151,   152,   153,   154,   155,     0,   156,   157,   158,   159,
     160,   161,   126,     0,     0,   127,     0,   128,   129,   130,
     131,     0,   268,   132,     0,     0,     0,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,     0,   147,   148,   149,   150,   151,   152,   153,   154,
     155,     0,   156,   157,   158,   159,   160,   161,   126,     0,
     271,   127,     0,   128,   129,   130,   131,     0,     0,   132,
       0,     0,     0,   133,   134,   135,   136,   137,   138,   139,
     140,   141,   142,   143,   144,   145,   146,     0,   147,   148,
     149,   150,   151,   152,   153,   154,   155,     0,   156,   157,
     158,   159,   160,   161,   126,     0,     0,   127,     0,   128,
     129,   130,   131,     0,   273,   132,     0,     0,     0,   133,
     134,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,     0,   147,   148,   149,   150,   151,   152,
     153,   154,   155,     0,   156,   157,   158,   159,   160,   161,
     126,     0,   276,   127,     0,   128,   129,   130,   131,     0,
       0,   132,     0,     0,     0,   133,   134,   135,   136,   137,
     138,   139,   140,   141,   142,   143,   144,   145,   146,     0,
     147,   148,   149,   150,   151,   152,   153,   154,   155,     0,
     156,   157,   158,   159,   160,   161,   126,     0,   277,   127,
       0,   128,   129,   130,   131,     0,     0,   132,     0,     0,
       0,   133,   134,   135,   136,   137,   138,   139,   140,   141,
     142,   143,   144,   145,   146,     0,   147,   148,   149,   150,
     151,   152,   153,   154,   155,     0,   156,   157,   158,   159,
     160,   161,   126,     0,   285,   127,     0,   128,   129,   130,
     131,     0,     0,   132,     0,     0,     0,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,     0,   147,   148,   149,   150,   151,   152,   153,   154,
     155,     0,   156,   157,   158,   159,   160,   161,   126,     0,
       0,   127,     0,   128,   129,   130,   131,     0,   286,   132,
       0,     0,     0,   133,   134,   135,   136,   137,   138,   139,
     140,   141,   142,   143,   144,   145,   146,     0,   147,   148,
     149,   150,   151,   152,   153,   154,   155,     0,   156,   157,
     158,   159,   160,   161,   126,     0,     0,   127,     0,   128,
     129,   130,   131,     0,   292,   132,     0,     0,     0,   133,
     134,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   146,     0,   147,   148,   149,   150,   151,   152,
     153,   154,   155,     0,   156,   157,   158,   159,   160,   161,
     126,     0,     0,   127,     0,   128,   129,   130,   131,     0,
     293,   132,     0,     0,     0,   133,   134,   135,   136,   137,
     138,   139,   140,   141,   142,   143,   144,   145,   146,     0,
     147,   148,   149,   150,   151,   152,   153,   154,   155,     0,
     156,   157,   158,   159,   160,   161,   126,     0,     0,   127,
       0,   128,   129,   130,   131,     0,   300,   132,     0,     0,
       0,   133,   134,   135,   136,   137,   138,   139,   140,   141,
     142,   143,   144,   145,   146,     0,   147,   148,   149,   150,
     151,   152,   153,   154,   155,     0,   156,   157,   158,   159,
     160,   161,   126,   301,     0,   127,     0,   128,   129,   130,
     131,     0,     0,   132,     0,     0,     0,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,     0,   147,   148,   149,   150,   151,   152,   153,   154,
     155,     0,   156,   157,   158,   159,   160,   161,   127,     0,
     128,   129,   130,   131,     0,     0,   132,     0,     0,     0,
     133,   134,   135,   136,   137,   138,   139,   140,   141,   142,
     143,   144,   145,   146,     0,   147,   148,   149,   150,   151,
     152,   153,   154,   155,     0,   156,   157,   158,   159,   160,
     161,   128,   129,   130,   131,     0,     0,   132,     0,     0,
       0,     0,   134,   135,   136,   137,   138,   139,     0,     0,
       0,     0,     0,   145,   146,     0,     0,     0,     0,   150,
     151,     0,     0,   154,     0,     0,   156,   157,   158,   159,
     160,   161,   128,   129,   130,   131,     0,     0,   132,     0,
       0,     0,     0,   134,   135,   136,   137,   138,   139,     0,
       0,     0,     0,     0,   145,   146,     0,     0,     0,     0,
     150,   151,     0,     0,     0,     0,     0,   156,   157,   158,
     159,   160,   161,   128,   129,   130,   131,     0,     0,   132,
       0,     0,     0,     0,   134,   135,   136,   137,   138,   139,
       0,     0,     0,     0,     0,     0,   146,     0,     0,     0,
       0,   150,   151,     0,     0,     0,     0,     0,   156,   157,
     158,   159,   160,   161,   128,   129,   130,   131,     0,     0,
     132,     0,     0,     0,     0,   134,   135,   136,   137,   138,
     139,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   150,   151,     0,     0,     0,     0,     0,   156,
     157,   158,   159,   160,   161,   128,   129,     0,   131,     0,
       0,   132,     0,     0,     0,     0,   134,   135,   136,   137,
     138,   139,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   150,   151,     0,     0,     0,     0,     0,
     156,   157,   158,   159,   160,   161,   128,   129,     0,   131,
       0,     0,   132,     0,     0,     0,     0,   134,   135,   136,
     137,   138,   139,     0,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,   150,   151,     0,     0,     0,     0,
       0,     0,     0,   158,   159,   160,   161,    14,    15,    16,
       0,    17,     4,     5,     6,     7,     8,     0,    10,    11,
      12,    13,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    14,    15,    16,     0,    17
};

static const yytype_int16 yycheck[] =
{
       2,     9,    15,    17,     3,    59,     5,     3,     5,     0,
       9,     5,    76,    12,    13,     9,    76,    13,     3,    16,
       3,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,   211,    17,    41,    17,     3,    76,    76,     3,    47,
      48,     8,     9,    12,    11,    14,     9,    14,    13,    17,
      64,    65,    19,    20,    21,    22,    23,    24,    14,   113,
      76,   216,    18,     9,    72,    78,    12,    13,    16,    77,
     124,   125,   126,   127,    16,   129,   130,    76,   132,   133,
     134,   135,   136,   137,     2,    16,   140,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,     3,    18,
       5,   165,   267,     3,   168,     5,   124,   297,   273,     8,
       9,   301,    11,    41,    76,    14,   281,    76,    15,    47,
      48,     5,    21,    22,    23,    24,     8,   292,   293,    11,
      76,    14,    14,    17,    78,   300,    49,    50,    51,    52,
      12,    23,    24,    12,    72,    13,    76,     8,     9,    77,
      11,    76,    76,    14,    13,    12,   220,    12,    19,    20,
      21,    22,    23,    24,    12,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    36,    37,   241,    12,   243,
       5,     5,   246,   247,   248,    12,   250,    68,    72,    73,
      74,    62,    76,    16,     5,     4,   124,   261,   262,     2,
      45,   113,    43,   168,    39,    72,    69,   271,   272,    -1,
      -1,    -1,   276,   277,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   285,    -1,    -1,    -1,   289,    -1,     5,    -1,    -1,
     248,     9,    10,    -1,    12,    -1,   248,    -1,    16,    17,
      -1,    19,    20,    -1,    -1,    23,    24,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    32,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,
      -1,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    -1,    63,    -1,    -1,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,     5,    -1,    -1,
      -1,     9,    10,    -1,    12,    -1,    -1,    -1,    16,    17,
      -1,    19,    20,    -1,    -1,    23,    24,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    32,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,
      -1,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    -1,    63,    -1,    -1,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,     5,    -1,    -1,
      -1,     9,    10,    -1,    12,    -1,    -1,    -1,    16,    -1,
      -1,    19,    20,    -1,    -1,    23,    24,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    32,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,
      -1,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    -1,    63,    -1,    -1,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,     5,    -1,    -1,
      -1,     9,    10,    -1,    12,    -1,    -1,    -1,    -1,    -1,
      -1,    19,    20,    -1,    -1,    23,    24,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    32,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,
      -1,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,     5,    -1,    -1,
      -1,     9,    10,    -1,    12,     6,    -1,     8,     9,    10,
      11,    19,    20,    14,    -1,    23,    24,    -1,    19,    20,
      21,    22,    23,    24,    32,    -1,    -1,    -1,    -1,    30,
      31,    -1,    -1,    -1,    42,    36,    37,    -1,    -1,    40,
      41,    -1,    43,    44,    45,    46,    47,    48,    -1,    -1,
      -1,    59,    60,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,     9,    10,    -1,
      12,    -1,    -1,    -1,    -1,    -1,    -1,    19,    20,    -1,
      -1,    23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      32,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      42,    -1,    -1,    -1,    -1,    -1,    -1,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,     9,    10,    -1,    12,    -1,    -1,    -1,
      -1,    -1,    -1,    19,    20,    -1,    -1,    23,    24,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    32,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,
      -1,    -1,    -1,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,     9,
      10,    -1,    12,    -1,    -1,    -1,    16,    17,    -1,    19,
      20,    -1,    -1,    23,    24,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    32,    -1,    -1,    -1,    -1,    -1,     9,    10,
      -1,    12,    42,    -1,    -1,    16,    -1,    -1,    19,    20,
      -1,    -1,    23,    24,    -1,    -1,    -1,    -1,    -1,    59,
      60,    32,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    42,    -1,    -1,    -1,    75,    76,    77,    78,    79,
      80,    81,    82,    83,    84,    -1,    -1,    -1,    59,    60,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,     9,    10,    -1,    12,    -1,    -1,
      -1,    16,    -1,    -1,    19,    20,    -1,    -1,    23,    24,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    32,    -1,    -1,
       9,    10,    -1,    12,    -1,    -1,    -1,    42,    -1,     5,
      19,    20,    -1,    -1,    23,    24,    -1,    -1,    -1,    -1,
      -1,    17,    -1,    32,    59,    60,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,     7,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      59,    60,     7,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    -1,    -1,    -1,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    72,    73,    74,    -1,
      76,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    -1,    -1,    -1,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    72,    73,    74,    -1,    76,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    72,    73,    74,
       3,    76,    -1,     6,    -1,     8,     9,    10,    11,    -1,
      13,    14,    -1,    -1,    -1,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    -1,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    -1,
      43,    44,    45,    46,    47,    48,     3,    -1,    -1,     6,
      -1,     8,     9,    10,    11,    -1,    13,    14,    -1,    -1,
      -1,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    -1,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    -1,    43,    44,    45,    46,
      47,    48,     3,     4,    -1,     6,    -1,     8,     9,    10,
      11,    -1,    -1,    14,    -1,    -1,    -1,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    -1,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    -1,    43,    44,    45,    46,    47,    48,     3,    -1,
      -1,     6,    -1,     8,     9,    10,    11,    -1,    -1,    14,
      15,    -1,    -1,    18,    19,    20,    21,    22,    23,    24,
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
       5,     6,    -1,     8,     9,    10,    11,    -1,    -1,    14,
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
       3,    -1,    -1,     6,    -1,     8,     9,    10,    11,    -1,
      13,    14,    -1,    -1,    -1,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    -1,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    -1,
      43,    44,    45,    46,    47,    48,     3,    -1,    -1,     6,
      -1,     8,     9,    10,    11,    -1,    13,    14,    -1,    -1,
      -1,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    -1,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    -1,    43,    44,    45,    46,
      47,    48,     3,     4,    -1,     6,    -1,     8,     9,    10,
      11,    -1,    -1,    14,    -1,    -1,    -1,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    -1,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    -1,    43,    44,    45,    46,    47,    48,     6,    -1,
       8,     9,    10,    11,    -1,    -1,    14,    -1,    -1,    -1,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    -1,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    -1,    43,    44,    45,    46,    47,
      48,     8,     9,    10,    11,    -1,    -1,    14,    -1,    -1,
      -1,    -1,    19,    20,    21,    22,    23,    24,    -1,    -1,
      -1,    -1,    -1,    30,    31,    -1,    -1,    -1,    -1,    36,
      37,    -1,    -1,    40,    -1,    -1,    43,    44,    45,    46,
      47,    48,     8,     9,    10,    11,    -1,    -1,    14,    -1,
      -1,    -1,    -1,    19,    20,    21,    22,    23,    24,    -1,
      -1,    -1,    -1,    -1,    30,    31,    -1,    -1,    -1,    -1,
      36,    37,    -1,    -1,    -1,    -1,    -1,    43,    44,    45,
      46,    47,    48,     8,     9,    10,    11,    -1,    -1,    14,
      -1,    -1,    -1,    -1,    19,    20,    21,    22,    23,    24,
      -1,    -1,    -1,    -1,    -1,    -1,    31,    -1,    -1,    -1,
      -1,    36,    37,    -1,    -1,    -1,    -1,    -1,    43,    44,
      45,    46,    47,    48,     8,     9,    10,    11,    -1,    -1,
      14,    -1,    -1,    -1,    -1,    19,    20,    21,    22,    23,
      24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    36,    37,    -1,    -1,    -1,    -1,    -1,    43,
      44,    45,    46,    47,    48,     8,     9,    -1,    11,    -1,
      -1,    14,    -1,    -1,    -1,    -1,    19,    20,    21,    22,
      23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    36,    37,    -1,    -1,    -1,    -1,    -1,
      43,    44,    45,    46,    47,    48,     8,     9,    -1,    11,
      -1,    -1,    14,    -1,    -1,    -1,    -1,    19,    20,    21,
      22,    23,    24,    -1,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    36,    37,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    45,    46,    47,    48,    72,    73,    74,
      -1,    76,    49,    50,    51,    52,    53,    -1,    55,    56,
      57,    58,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    72,    73,    74,    -1,    76
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    86,    87,     0,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    72,    73,    74,    76,    88,    89,
      91,    92,    93,    94,   103,    49,    50,    51,    52,    94,
      76,    76,    76,    76,    95,    96,     5,     9,    16,    16,
      16,    12,    14,    99,   100,     3,     5,   104,   104,    76,
     107,   108,     7,    93,    94,   101,   102,    15,    78,    18,
     100,    76,    96,     5,    17,    93,   105,    17,    18,     3,
      17,    76,     3,    13,    15,     9,    10,    12,    16,    19,
      20,    23,    24,    32,    42,    59,    60,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,   122,   124,    76,
     106,    78,   108,     7,   102,     5,    16,    90,   122,   122,
      76,    93,   122,    16,    17,    97,    98,   122,   122,   122,
     122,   122,   122,   122,    12,    12,     3,     6,     8,     9,
      10,    11,    14,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    43,    44,    45,    46,
      47,    48,     3,     5,   109,    13,    13,    97,     3,    17,
      76,    93,   122,   122,   123,   122,   122,    76,   122,   122,
      76,   122,   122,   122,   122,   122,   122,   122,   122,   122,
     122,   122,   122,   122,   122,   122,   122,   122,   122,   122,
     122,   122,   122,   122,   122,   122,   122,   122,   122,    76,
       5,    16,    17,    61,    63,    66,    67,    68,    69,    70,
      71,    91,    92,    93,   110,   111,   112,   115,   116,   117,
     118,   119,   120,   121,   122,   122,    17,    98,    13,    13,
      13,     3,    13,     4,    15,   109,    12,    12,    12,   110,
      12,     5,     5,     5,   122,     5,   122,   122,    17,   122,
     122,     5,    91,   122,    68,   122,     5,    13,    13,   122,
     122,     5,    12,    13,   110,    16,     5,     5,   122,   122,
     110,    62,   113,   122,   122,     5,    13,   110,    17,    64,
      65,   114,    13,    13,   122,     5,   122,     4,   110,   110,
      13,     4,   109,   110,   109
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    85,    86,    87,    87,    88,    88,    88,    89,    89,
      90,    91,    92,    93,    93,    94,    94,    94,    94,    94,
      94,    95,    95,    95,    96,    96,    96,    96,    97,    97,
      98,    98,    99,    99,    99,   100,   100,   101,   101,   101,
     101,   101,   102,   102,   103,   103,   103,   103,   103,   103,
     103,   103,   103,   103,   103,   103,   103,   104,   104,   105,
     105,   106,   106,   106,   107,   107,   107,   108,   108,   109,
     109,   110,   110,   110,   110,   110,   110,   110,   110,   110,
     110,   110,   110,   110,   111,   111,   112,   113,   113,   114,
     114,   115,   115,   115,   116,   117,   118,   119,   120,   120,
     121,   122,   122,   122,   122,   122,   122,   122,   122,   122,
     122,   122,   122,   122,   122,   122,   122,   122,   122,   122,
     122,   122,   122,   122,   122,   122,   122,   122,   122,   122,
     122,   122,   122,   122,   122,   122,   122,   122,   122,   122,
     122,   122,   122,   122,   122,   122,   122,   122,   122,   122,
     122,   122,   122,   123,   123,   123,   124,   124,   124,   124,
     124,   124,   124,   124,   124,   124
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     0,     1,     1,     1,     6,     6,
       3,     3,     2,     1,     2,     1,     5,     5,     5,     2,
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
#line 223 "Parser.y"
                                { (yyval.program) = new AST::Program((yyvsp[0].decls)); g_root = (yyval.program); }
#line 2176 "Parser.cpp"
    break;

  case 3: /* Decls: Decls Decl  */
#line 226 "Parser.y"
                                { (yyval.decls) = (yyvsp[-1].decls); (yyval.decls)->push_back((yyvsp[0].decl)); }
#line 2182 "Parser.cpp"
    break;

  case 4: /* Decls: %empty  */
#line 227 "Parser.y"
                                { (yyval.decls) = new AST::Decls(); }
#line 2188 "Parser.cpp"
    break;

  case 5: /* Decl: FuncDecl  */
#line 230 "Parser.y"
                                { (yyval.decl) = (yyvsp[0].funcDecl); }
#line 2194 "Parser.cpp"
    break;

  case 6: /* Decl: VarDecl  */
#line 231 "Parser.y"
                                { (yyval.decl) = (yyvsp[0].varDecl); }
#line 2200 "Parser.cpp"
    break;

  case 7: /* Decl: TypeDecl  */
#line 232 "Parser.y"
                                { (yyval.decl) = (yyvsp[0].typeDecl); }
#line 2206 "Parser.cpp"
    break;

  case 8: /* FuncDecl: VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES SEMICOLON  */
#line 236 "Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList)); }
#line 2212 "Parser.cpp"
    break;

  case 9: /* FuncDecl: VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES FuncBody  */
#line 238 "Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList), (yyvsp[0].funcBody)); }
#line 2218 "Parser.cpp"
    break;

  case 10: /* FuncBody: LBRACE Stmts RBRACE  */
#line 241 "Parser.y"
                                { (yyval.funcBody) = new AST::FuncBody((yyvsp[-1].stmts)); }
#line 2224 "Parser.cpp"
    break;

  case 11: /* VarDecl: VarType VarList SEMICOLON  */
#line 245 "Parser.y"
                                { (yyval.varDecl) = new AST::VarDecl((yyvsp[-2].varType), (yyvsp[-1].varList)); }
#line 2230 "Parser.cpp"
    break;

  case 12: /* TypeDecl: _VarType SEMICOLON  */
#line 248 "Parser.y"
                                { (yyval.typeDecl) = new AST::TypeDecl((yyvsp[-1].varType)); }
#line 2236 "Parser.cpp"
    break;

  case 13: /* VarType: _VarType  */
#line 253 "Parser.y"
                                { (yyval.varType) = (yyvsp[0].varType); }
#line 2242 "Parser.cpp"
    break;

  case 14: /* VarType: CONST _VarType  */
#line 254 "Parser.y"
                                { (yyval.varType) = (yyvsp[0].varType); (yyval.varType)->setConst(); }
#line 2248 "Parser.cpp"
    break;

  case 15: /* _VarType: BuiltinType  */
#line 257 "Parser.y"
                                { (yyval.varType) = (yyvsp[0].builtinType); }
#line 2254 "Parser.cpp"
    break;

  case 16: /* _VarType: STRUCT IDENTIFIER LBRACE FieldDecls RBRACE  */
#line 259 "Parser.y"
                                { (yyval.varType) = new AST::StructType((yyvsp[-1].fieldDecls), *(yyvsp[-3].idVal)); }
#line 2260 "Parser.cpp"
    break;

  case 17: /* _VarType: UNION IDENTIFIER LBRACE FieldDecls RBRACE  */
#line 261 "Parser.y"
                                { (yyval.varType) = new AST::UnionType((yyvsp[-1].fieldDecls), *(yyvsp[-3].idVal)); }
#line 2266 "Parser.cpp"
    break;

  case 18: /* _VarType: ENUM IDENTIFIER LBRACE EnumList RBRACE  */
#line 263 "Parser.y"
                                { (yyval.varType) = new AST::EnumType((yyvsp[-1].enumList), *(yyvsp[-3].idVal)); }
#line 2272 "Parser.cpp"
    break;

  case 19: /* _VarType: _VarType ASTERISK  */
#line 264 "Parser.y"
                                { (yyval.varType) = new AST::PointerType((yyvsp[-1].varType)); }
#line 2278 "Parser.cpp"
    break;

  case 20: /* _VarType: IDENTIFIER  */
#line 265 "Parser.y"
                                { (yyval.varType) = new AST::DefinedType(*(yyvsp[0].idVal)); }
#line 2284 "Parser.cpp"
    break;

  case 21: /* VarList: VarList COMMA VarInit  */
#line 272 "Parser.y"
                                { (yyval.varList) = (yyvsp[-2].varList); (yyval.varList)->push_back((yyvsp[0].varInit)); }
#line 2290 "Parser.cpp"
    break;

  case 22: /* VarList: VarInit  */
#line 273 "Parser.y"
                                { (yyval.varList) = new AST::VarList(); (yyval.varList)->push_back((yyvsp[0].varInit)); }
#line 2296 "Parser.cpp"
    break;

  case 23: /* VarList: %empty  */
#line 274 "Parser.y"
                                { (yyval.varList) = new AST::VarList(); }
#line 2302 "Parser.cpp"
    break;

  case 24: /* VarInit: IDENTIFIER ArrayBoundList  */
#line 280 "Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-1].idVal), *(yyvsp[0].arrayBoundList)); delete (yyvsp[0].arrayBoundList); }
#line 2308 "Parser.cpp"
    break;

  case 25: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN Expr  */
#line 282 "Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-3].idVal), *(yyvsp[-2].arrayBoundList), (yyvsp[0].expr)); delete (yyvsp[-2].arrayBoundList); }
#line 2314 "Parser.cpp"
    break;

  case 26: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN LBRACE InitList RBRACE  */
#line 284 "Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-5].idVal), *(yyvsp[-4].arrayBoundList), nullptr, (yyvsp[-1].initList));
                                  delete (yyvsp[-4].arrayBoundList); }
#line 2321 "Parser.cpp"
    break;

  case 27: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN LBRACE RBRACE  */
#line 287 "Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-4].idVal), *(yyvsp[-3].arrayBoundList), nullptr,
                                                        new AST::InitList());
                                  delete (yyvsp[-3].arrayBoundList); }
#line 2329 "Parser.cpp"
    break;

  case 28: /* InitList: InitList COMMA InitItem  */
#line 295 "Parser.y"
                                { (yyval.initList) = (yyvsp[-2].initList); (yyval.initList)->push_back((yyvsp[0].initElement)); }
#line 2335 "Parser.cpp"
    break;

  case 29: /* InitList: InitItem  */
#line 297 "Parser.y"
                                { (yyval.initList) = new AST::InitList(); (yyval.initList)->push_back((yyvsp[0].initElement)); }
#line 2341 "Parser.cpp"
    break;

  case 30: /* InitItem: Expr  */
#line 301 "Parser.y"
                                { (yyval.initElement) = new AST::InitElement((yyvsp[0].expr)); }
#line 2347 "Parser.cpp"
    break;

  case 31: /* InitItem: LBRACE InitList RBRACE  */
#line 303 "Parser.y"
                                { (yyval.initElement) = new AST::InitElement((yyvsp[-1].initList)); }
#line 2353 "Parser.cpp"
    break;

  case 32: /* ArrayBoundList: ArrayBoundList ArrayBound  */
#line 311 "Parser.y"
                                { (yyval.arrayBoundList) = (yyvsp[-1].arrayBoundList); (yyval.arrayBoundList)->push_back((yyvsp[0].sizeVal)); }
#line 2359 "Parser.cpp"
    break;

  case 33: /* ArrayBoundList: ArrayBound  */
#line 313 "Parser.y"
                                { (yyval.arrayBoundList) = new std::vector<size_t>(); (yyval.arrayBoundList)->push_back((yyvsp[0].sizeVal)); }
#line 2365 "Parser.cpp"
    break;

  case 34: /* ArrayBoundList: %empty  */
#line 314 "Parser.y"
                                { (yyval.arrayBoundList) = new std::vector<size_t>(); }
#line 2371 "Parser.cpp"
    break;

  case 35: /* ArrayBound: LBRACKET INTEGER RBRACKET  */
#line 318 "Parser.y"
                                { (yyval.sizeVal) = static_cast<size_t>((yyvsp[-1].intVal)); }
#line 2377 "Parser.cpp"
    break;

  case 36: /* ArrayBound: LBRACKET RBRACKET  */
#line 320 "Parser.y"
                                { (yyval.sizeVal) = AST::kInferredArrayBound; }
#line 2383 "Parser.cpp"
    break;

  case 37: /* ParamList: ParamList COMMA Param  */
#line 326 "Parser.y"
                                { (yyval.paramList) = (yyvsp[-2].paramList); (yyval.paramList)->push_back((yyvsp[0].param)); }
#line 2389 "Parser.cpp"
    break;

  case 38: /* ParamList: ParamList COMMA ELLIPSES  */
#line 328 "Parser.y"
                                { (yyval.paramList) = (yyvsp[-2].paramList); (yyval.paramList)->setVariant(); }
#line 2395 "Parser.cpp"
    break;

  case 39: /* ParamList: Param  */
#line 329 "Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); (yyval.paramList)->push_back((yyvsp[0].param)); }
#line 2401 "Parser.cpp"
    break;

  case 40: /* ParamList: ELLIPSES  */
#line 330 "Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); (yyval.paramList)->setVariant(); }
#line 2407 "Parser.cpp"
    break;

  case 41: /* ParamList: %empty  */
#line 331 "Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); }
#line 2413 "Parser.cpp"
    break;

  case 42: /* Param: VarType IDENTIFIER  */
#line 337 "Parser.y"
                                { (yyval.param) = new AST::Param((yyvsp[-1].varType), *(yyvsp[0].idVal)); }
#line 2419 "Parser.cpp"
    break;

  case 43: /* Param: VarType  */
#line 338 "Parser.y"
                                { (yyval.param) = new AST::Param((yyvsp[0].varType)); }
#line 2425 "Parser.cpp"
    break;

  case 44: /* BuiltinType: CHAR  */
#line 342 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::CHAR, "char"); }
#line 2431 "Parser.cpp"
    break;

  case 45: /* BuiltinType: SHORT  */
#line 343 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::SHORT, "short"); }
#line 2437 "Parser.cpp"
    break;

  case 46: /* BuiltinType: INT  */
#line 344 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::INT, "int"); }
#line 2443 "Parser.cpp"
    break;

  case 47: /* BuiltinType: LONG  */
#line 345 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::LONG, "long"); }
#line 2449 "Parser.cpp"
    break;

  case 48: /* BuiltinType: UNSIGNED  */
#line 346 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::UINT, "uint"); }
#line 2455 "Parser.cpp"
    break;

  case 49: /* BuiltinType: UNSIGNED CHAR  */
#line 347 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::UCHAR, "uchar"); }
#line 2461 "Parser.cpp"
    break;

  case 50: /* BuiltinType: UNSIGNED SHORT  */
#line 348 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::USHORT, "ushort"); }
#line 2467 "Parser.cpp"
    break;

  case 51: /* BuiltinType: UNSIGNED INT  */
#line 349 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::UINT, "uint"); }
#line 2473 "Parser.cpp"
    break;

  case 52: /* BuiltinType: UNSIGNED LONG  */
#line 350 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::ULONG, "ulong"); }
#line 2479 "Parser.cpp"
    break;

  case 53: /* BuiltinType: FLOAT  */
#line 351 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::FLOAT, "float"); }
#line 2485 "Parser.cpp"
    break;

  case 54: /* BuiltinType: DOUBLE  */
#line 352 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::DOUBLE, "double"); }
#line 2491 "Parser.cpp"
    break;

  case 55: /* BuiltinType: BOOL  */
#line 353 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::BOOL, "bool"); }
#line 2497 "Parser.cpp"
    break;

  case 56: /* BuiltinType: VOID  */
#line 354 "Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinType::TypeId::VOID, "void"); }
#line 2503 "Parser.cpp"
    break;

  case 57: /* FieldDecls: FieldDecls FieldDecl  */
#line 360 "Parser.y"
                                { (yyval.fieldDecls) = (yyvsp[-1].fieldDecls); if ((yyvsp[0].fieldDecl) != NULL) (yyval.fieldDecls)->push_back((yyvsp[0].fieldDecl)); }
#line 2509 "Parser.cpp"
    break;

  case 58: /* FieldDecls: %empty  */
#line 361 "Parser.y"
                                { (yyval.fieldDecls) = new AST::FieldDecls(); }
#line 2515 "Parser.cpp"
    break;

  case 59: /* FieldDecl: VarType MemberList SEMICOLON  */
#line 365 "Parser.y"
                                { (yyval.fieldDecl) = new AST::FieldDecl((yyvsp[-2].varType), (yyvsp[-1].memberList)); }
#line 2521 "Parser.cpp"
    break;

  case 60: /* FieldDecl: SEMICOLON  */
#line 366 "Parser.y"
                                { (yyval.fieldDecl) = NULL; }
#line 2527 "Parser.cpp"
    break;

  case 61: /* MemberList: MemberList COMMA IDENTIFIER  */
#line 372 "Parser.y"
                                { (yyval.memberList) = (yyvsp[-2].memberList); (yyval.memberList)->push_back(*(yyvsp[0].idVal)); }
#line 2533 "Parser.cpp"
    break;

  case 62: /* MemberList: IDENTIFIER  */
#line 373 "Parser.y"
                                { (yyval.memberList) = new AST::MemberList(); (yyval.memberList)->push_back(*(yyvsp[0].idVal)); }
#line 2539 "Parser.cpp"
    break;

  case 63: /* MemberList: %empty  */
#line 374 "Parser.y"
                                { (yyval.memberList) = new AST::MemberList(); }
#line 2545 "Parser.cpp"
    break;

  case 64: /* EnumList: EnumList COMMA Enum  */
#line 380 "Parser.y"
                                { (yyval.enumList) = (yyvsp[-2].enumList); (yyval.enumList)->push_back((yyvsp[0].enumeration)); }
#line 2551 "Parser.cpp"
    break;

  case 65: /* EnumList: Enum  */
#line 381 "Parser.y"
                                { (yyval.enumList) = new AST::EnumList(); (yyval.enumList)->push_back((yyvsp[0].enumeration)); }
#line 2557 "Parser.cpp"
    break;

  case 66: /* EnumList: %empty  */
#line 382 "Parser.y"
                                { (yyval.enumList) = new AST::EnumList(); }
#line 2563 "Parser.cpp"
    break;

  case 67: /* Enum: IDENTIFIER  */
#line 385 "Parser.y"
                                { (yyval.enumeration) = new AST::Enum(*(yyvsp[0].idVal)); }
#line 2569 "Parser.cpp"
    break;

  case 68: /* Enum: IDENTIFIER ASSIGN INTEGER  */
#line 387 "Parser.y"
                                { (yyval.enumeration) = new AST::Enum(*(yyvsp[-2].idVal), true, (yyvsp[0].intVal)); }
#line 2575 "Parser.cpp"
    break;

  case 69: /* Stmts: Stmts Stmt  */
#line 392 "Parser.y"
                                { (yyval.stmts) = (yyvsp[-1].stmts); if ((yyvsp[0].stmt) != NULL) (yyval.stmts)->push_back((yyvsp[0].stmt)); }
#line 2581 "Parser.cpp"
    break;

  case 70: /* Stmts: %empty  */
#line 393 "Parser.y"
                                { (yyval.stmts) = new AST::Stmts(); }
#line 2587 "Parser.cpp"
    break;

  case 71: /* Stmt: Expr SEMICOLON  */
#line 396 "Parser.y"
                                { (yyval.stmt) = (yyvsp[-1].expr); }
#line 2593 "Parser.cpp"
    break;

  case 72: /* Stmt: IfStmt  */
#line 397 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].ifStmt); }
#line 2599 "Parser.cpp"
    break;

  case 73: /* Stmt: SwitchStmt  */
#line 398 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].switchStmt); }
#line 2605 "Parser.cpp"
    break;

  case 74: /* Stmt: ForStmt  */
#line 399 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].forStmt); }
#line 2611 "Parser.cpp"
    break;

  case 75: /* Stmt: DoStmt  */
#line 400 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].doStmt); }
#line 2617 "Parser.cpp"
    break;

  case 76: /* Stmt: WhileStmt  */
#line 401 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].whileStmt); }
#line 2623 "Parser.cpp"
    break;

  case 77: /* Stmt: ContinueStmt  */
#line 402 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].continueStmt); }
#line 2629 "Parser.cpp"
    break;

  case 78: /* Stmt: BreakStmt  */
#line 403 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].breakStmt); }
#line 2635 "Parser.cpp"
    break;

  case 79: /* Stmt: ReturnStmt  */
#line 404 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].returnStmt); }
#line 2641 "Parser.cpp"
    break;

  case 80: /* Stmt: Block  */
#line 405 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].block); }
#line 2647 "Parser.cpp"
    break;

  case 81: /* Stmt: TypeDecl  */
#line 406 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].typeDecl); }
#line 2653 "Parser.cpp"
    break;

  case 82: /* Stmt: VarDecl  */
#line 407 "Parser.y"
                                { (yyval.stmt) = (yyvsp[0].varDecl); }
#line 2659 "Parser.cpp"
    break;

  case 83: /* Stmt: SEMICOLON  */
#line 408 "Parser.y"
                                { (yyval.stmt) = NULL; }
#line 2665 "Parser.cpp"
    break;

  case 84: /* IfStmt: IF LPARENTHESES Expr RPARENTHESES Stmt ELSE Stmt  */
#line 412 "Parser.y"
                                { (yyval.ifStmt) = new AST::IfStmt((yyvsp[-4].expr), (yyvsp[-2].stmt), (yyvsp[0].stmt)); }
#line 2671 "Parser.cpp"
    break;

  case 85: /* IfStmt: IF LPARENTHESES Expr RPARENTHESES Stmt  */
#line 414 "Parser.y"
                                { (yyval.ifStmt) = new AST::IfStmt((yyvsp[-2].expr), (yyvsp[0].stmt)); }
#line 2677 "Parser.cpp"
    break;

  case 86: /* SwitchStmt: SWITCH LPARENTHESES Expr RPARENTHESES LBRACE CaseStmtList RBRACE  */
#line 420 "Parser.y"
                                { (yyval.switchStmt) = new AST::SwitchStmt((yyvsp[-4].expr), (yyvsp[-1].caseStmtList)); }
#line 2683 "Parser.cpp"
    break;

  case 87: /* CaseStmtList: CaseStmtList CaseStmt  */
#line 425 "Parser.y"
                                { (yyval.caseStmtList) = (yyvsp[-1].caseStmtList); (yyval.caseStmtList)->push_back((yyvsp[0].caseStmt)); }
#line 2689 "Parser.cpp"
    break;

  case 88: /* CaseStmtList: %empty  */
#line 426 "Parser.y"
                                { (yyval.caseStmtList) = new AST::CaseStmtList(); }
#line 2695 "Parser.cpp"
    break;

  case 89: /* CaseStmt: CASE Expr COLON Stmts  */
#line 430 "Parser.y"
                                { (yyval.caseStmt) = new AST::CaseStmt((yyvsp[-2].expr), (yyvsp[0].stmts)); }
#line 2701 "Parser.cpp"
    break;

  case 90: /* CaseStmt: DEFAULT COLON Stmts  */
#line 432 "Parser.y"
                                { (yyval.caseStmt) = new AST::CaseStmt(NULL, (yyvsp[0].stmts)); }
#line 2707 "Parser.cpp"
    break;

  case 91: /* ForStmt: FOR LPARENTHESES Expr SEMICOLON Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 436 "Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt((yyvsp[-6].expr), (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt)); }
#line 2713 "Parser.cpp"
    break;

  case 92: /* ForStmt: FOR LPARENTHESES SEMICOLON Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 438 "Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt(NULL, (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt)); }
#line 2719 "Parser.cpp"
    break;

  case 93: /* ForStmt: FOR LPARENTHESES VarDecl Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 440 "Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt((yyvsp[-5].varDecl), (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt)); }
#line 2725 "Parser.cpp"
    break;

  case 94: /* DoStmt: DO Stmt WHILE LPARENTHESES Expr RPARENTHESES SEMICOLON  */
#line 444 "Parser.y"
                                { (yyval.doStmt) = new AST::DoStmt((yyvsp[-5].stmt), (yyvsp[-2].expr)); }
#line 2731 "Parser.cpp"
    break;

  case 95: /* WhileStmt: WHILE LPARENTHESES Expr RPARENTHESES Stmt  */
#line 448 "Parser.y"
                                { (yyval.whileStmt) = new AST::WhileStmt((yyvsp[-2].expr), (yyvsp[0].stmt)); }
#line 2737 "Parser.cpp"
    break;

  case 96: /* ContinueStmt: CONTINUE SEMICOLON  */
#line 452 "Parser.y"
                                { (yyval.continueStmt) = new AST::ContinueStmt(); }
#line 2743 "Parser.cpp"
    break;

  case 97: /* BreakStmt: BREAK SEMICOLON  */
#line 455 "Parser.y"
                                { (yyval.breakStmt) = new AST::BreakStmt(); }
#line 2749 "Parser.cpp"
    break;

  case 98: /* ReturnStmt: RETURN SEMICOLON  */
#line 458 "Parser.y"
                                { (yyval.returnStmt) = new AST::ReturnStmt(); }
#line 2755 "Parser.cpp"
    break;

  case 99: /* ReturnStmt: RETURN Expr SEMICOLON  */
#line 460 "Parser.y"
                                { (yyval.returnStmt) = new AST::ReturnStmt((yyvsp[-1].expr)); }
#line 2761 "Parser.cpp"
    break;

  case 100: /* Block: LBRACE Stmts RBRACE  */
#line 463 "Parser.y"
                                { (yyval.block) = new AST::Block((yyvsp[-1].stmts)); }
#line 2767 "Parser.cpp"
    break;

  case 101: /* Expr: IDENTIFIER  */
#line 470 "Parser.y"
                                { (yyval.expr) = new AST::Variable(*(yyvsp[0].idVal)); }
#line 2773 "Parser.cpp"
    break;

  case 102: /* Expr: Constant  */
#line 471 "Parser.y"
                                { (yyval.expr) = (yyvsp[0].constant); }
#line 2779 "Parser.cpp"
    break;

  case 103: /* Expr: LPARENTHESES Expr RPARENTHESES  */
#line 473 "Parser.y"
                                { (yyval.expr) = (yyvsp[-1].expr); }
#line 2785 "Parser.cpp"
    break;

  case 104: /* Expr: Expr COMMA Expr  */
#line 474 "Parser.y"
                                { (yyval.expr) = new AST::CommaExpr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2791 "Parser.cpp"
    break;

  case 105: /* Expr: IDENTIFIER LPARENTHESES ExprList RPARENTHESES  */
#line 476 "Parser.y"
                                { (yyval.expr) = new AST::FuncCall(*(yyvsp[-3].idVal), (yyvsp[-1].exprList)); }
#line 2797 "Parser.cpp"
    break;

  case 106: /* Expr: Expr DOT IDENTIFIER  */
#line 478 "Parser.y"
                                { (yyval.expr) = new AST::StructRef((yyvsp[-2].expr), *(yyvsp[0].idVal)); }
#line 2803 "Parser.cpp"
    break;

  case 107: /* Expr: Expr ARROW IDENTIFIER  */
#line 480 "Parser.y"
                                { (yyval.expr) = new AST::StructDeref((yyvsp[-2].expr), *(yyvsp[0].idVal)); }
#line 2809 "Parser.cpp"
    break;

  case 108: /* Expr: Expr LBRACKET Expr RBRACKET  */
#line 482 "Parser.y"
                                { (yyval.expr) = new AST::Subscript((yyvsp[-3].expr), (yyvsp[-1].expr)); }
#line 2815 "Parser.cpp"
    break;

  case 109: /* Expr: LPARENTHESES VarType RPARENTHESES Expr  */
#line 484 "Parser.y"
                                { (yyval.expr) = new AST::TypeCast((yyvsp[-2].varType), (yyvsp[0].expr)); }
#line 2821 "Parser.cpp"
    break;

  case 110: /* Expr: SIZEOF LPARENTHESES VarType RPARENTHESES  */
#line 486 "Parser.y"
                                { (yyval.expr) = new AST::SizeOf((yyvsp[-1].varType)); }
#line 2827 "Parser.cpp"
    break;

  case 111: /* Expr: SIZEOF LPARENTHESES Expr RPARENTHESES  */
#line 488 "Parser.y"
                                { (yyval.expr) = new AST::SizeOf((yyvsp[-1].expr)); }
#line 2833 "Parser.cpp"
    break;

  case 112: /* Expr: SIZEOF LPARENTHESES IDENTIFIER RPARENTHESES  */
#line 490 "Parser.y"
                                { (yyval.expr) = new AST::SizeOf(*(yyvsp[-1].idVal)); }
#line 2839 "Parser.cpp"
    break;

  case 113: /* Expr: ADD Expr  */
#line 492 "Parser.y"
                                { (yyval.expr) = new AST::UnaryPlus((yyvsp[0].expr)); }
#line 2845 "Parser.cpp"
    break;

  case 114: /* Expr: SUB Expr  */
#line 494 "Parser.y"
                                { (yyval.expr) = new AST::UnaryMinus((yyvsp[0].expr)); }
#line 2851 "Parser.cpp"
    break;

  case 115: /* Expr: ASTERISK Expr  */
#line 496 "Parser.y"
                                { (yyval.expr) = new AST::PointerDeref((yyvsp[0].expr)); }
#line 2857 "Parser.cpp"
    break;

  case 116: /* Expr: AMPERSAND Expr  */
#line 498 "Parser.y"
                                { (yyval.expr) = new AST::AddressOf((yyvsp[0].expr)); }
#line 2863 "Parser.cpp"
    break;

  case 117: /* Expr: Expr ASSIGN Expr  */
#line 499 "Parser.y"
                                { (yyval.expr) = new AST::Assign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2869 "Parser.cpp"
    break;

  case 118: /* Expr: Expr ADD Expr  */
#line 501 "Parser.y"
                                { (yyval.expr) = new AST::Add((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2875 "Parser.cpp"
    break;

  case 119: /* Expr: Expr SUB Expr  */
#line 503 "Parser.y"
                                { (yyval.expr) = new AST::Sub((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2881 "Parser.cpp"
    break;

  case 120: /* Expr: Expr ASTERISK Expr  */
#line 505 "Parser.y"
                                { (yyval.expr) = new AST::Mul((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2887 "Parser.cpp"
    break;

  case 121: /* Expr: Expr DIV Expr  */
#line 506 "Parser.y"
                                { (yyval.expr) = new AST::Div((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2893 "Parser.cpp"
    break;

  case 122: /* Expr: Expr MOD Expr  */
#line 507 "Parser.y"
                                { (yyval.expr) = new AST::Mod((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2899 "Parser.cpp"
    break;

  case 123: /* Expr: Expr DADD  */
#line 509 "Parser.y"
                                { (yyval.expr) = new AST::PostfixInc((yyvsp[-1].expr)); }
#line 2905 "Parser.cpp"
    break;

  case 124: /* Expr: Expr DSUB  */
#line 511 "Parser.y"
                                { (yyval.expr) = new AST::PostfixDec((yyvsp[-1].expr)); }
#line 2911 "Parser.cpp"
    break;

  case 125: /* Expr: DADD Expr  */
#line 513 "Parser.y"
                                { (yyval.expr) = new AST::PrefixInc((yyvsp[0].expr)); }
#line 2917 "Parser.cpp"
    break;

  case 126: /* Expr: DSUB Expr  */
#line 515 "Parser.y"
                                { (yyval.expr) = new AST::PrefixDec((yyvsp[0].expr)); }
#line 2923 "Parser.cpp"
    break;

  case 127: /* Expr: Expr ADDEQ Expr  */
#line 516 "Parser.y"
                                { (yyval.expr) = new AST::AddAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2929 "Parser.cpp"
    break;

  case 128: /* Expr: Expr SUBEQ Expr  */
#line 517 "Parser.y"
                                { (yyval.expr) = new AST::SubAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2935 "Parser.cpp"
    break;

  case 129: /* Expr: Expr MULEQ Expr  */
#line 518 "Parser.y"
                                { (yyval.expr) = new AST::MulAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2941 "Parser.cpp"
    break;

  case 130: /* Expr: Expr DIVEQ Expr  */
#line 519 "Parser.y"
                                { (yyval.expr) = new AST::DivAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2947 "Parser.cpp"
    break;

  case 131: /* Expr: Expr MODEQ Expr  */
#line 520 "Parser.y"
                                { (yyval.expr) = new AST::ModAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2953 "Parser.cpp"
    break;

  case 132: /* Expr: Expr AMPERSAND Expr  */
#line 522 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseAnd((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2959 "Parser.cpp"
    break;

  case 133: /* Expr: Expr BOR Expr  */
#line 523 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseOr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2965 "Parser.cpp"
    break;

  case 134: /* Expr: Expr BXOR Expr  */
#line 524 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseXor((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2971 "Parser.cpp"
    break;

  case 135: /* Expr: BNOT Expr  */
#line 525 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseNot((yyvsp[0].expr)); }
#line 2977 "Parser.cpp"
    break;

  case 136: /* Expr: Expr BANDEQ Expr  */
#line 526 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseAndAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2983 "Parser.cpp"
    break;

  case 137: /* Expr: Expr BOREQ Expr  */
#line 527 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseOrAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2989 "Parser.cpp"
    break;

  case 138: /* Expr: Expr BXOREQ Expr  */
#line 528 "Parser.y"
                                { (yyval.expr) = new AST::BitwiseXorAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 2995 "Parser.cpp"
    break;

  case 139: /* Expr: Expr SHL Expr  */
#line 529 "Parser.y"
                                { (yyval.expr) = new AST::LeftShift((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3001 "Parser.cpp"
    break;

  case 140: /* Expr: Expr SHR Expr  */
#line 530 "Parser.y"
                                { (yyval.expr) = new AST::RightShift((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3007 "Parser.cpp"
    break;

  case 141: /* Expr: Expr SHLEQ Expr  */
#line 531 "Parser.y"
                                { (yyval.expr) = new AST::LeftShiftAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3013 "Parser.cpp"
    break;

  case 142: /* Expr: Expr SHREQ Expr  */
#line 532 "Parser.y"
                                { (yyval.expr) = new AST::RightShiftAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3019 "Parser.cpp"
    break;

  case 143: /* Expr: Expr AND Expr  */
#line 533 "Parser.y"
                                { (yyval.expr) = new AST::LogicAnd((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3025 "Parser.cpp"
    break;

  case 144: /* Expr: Expr OR Expr  */
#line 534 "Parser.y"
                                { (yyval.expr) = new AST::LogicOr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3031 "Parser.cpp"
    break;

  case 145: /* Expr: NOT Expr  */
#line 535 "Parser.y"
                                { (yyval.expr) = new AST::LogicNot((yyvsp[0].expr)); }
#line 3037 "Parser.cpp"
    break;

  case 146: /* Expr: Expr EQ Expr  */
#line 536 "Parser.y"
                                { (yyval.expr) = new AST::LogicEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3043 "Parser.cpp"
    break;

  case 147: /* Expr: Expr NEQ Expr  */
#line 537 "Parser.y"
                                { (yyval.expr) = new AST::LogicNotEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3049 "Parser.cpp"
    break;

  case 148: /* Expr: Expr LT Expr  */
#line 538 "Parser.y"
                                { (yyval.expr) = new AST::LogicLessThan((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3055 "Parser.cpp"
    break;

  case 149: /* Expr: Expr LE Expr  */
#line 539 "Parser.y"
                                { (yyval.expr) = new AST::LogicLessEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3061 "Parser.cpp"
    break;

  case 150: /* Expr: Expr GT Expr  */
#line 540 "Parser.y"
                                { (yyval.expr) = new AST::LogicGreaterThan((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3067 "Parser.cpp"
    break;

  case 151: /* Expr: Expr GE Expr  */
#line 541 "Parser.y"
                                { (yyval.expr) = new AST::LogicGreaterEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3073 "Parser.cpp"
    break;

  case 152: /* Expr: Expr QUESTION Expr COLON Expr  */
#line 543 "Parser.y"
                                { (yyval.expr) = new AST::TernaryCondition((yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3079 "Parser.cpp"
    break;

  case 153: /* ExprList: ExprList COMMA Expr  */
#line 547 "Parser.y"
                                { (yyval.exprList) = (yyvsp[-2].exprList); (yyval.exprList)->push_back((yyvsp[0].expr)); }
#line 3085 "Parser.cpp"
    break;

  case 154: /* ExprList: Expr  */
#line 548 "Parser.y"
                                { (yyval.exprList) = new AST::ExprList(); (yyval.exprList)->push_back((yyvsp[0].expr)); }
#line 3091 "Parser.cpp"
    break;

  case 155: /* ExprList: %empty  */
#line 549 "Parser.y"
                                { (yyval.exprList) = new AST::ExprList(); }
#line 3097 "Parser.cpp"
    break;

  case 156: /* Constant: CHARACTER  */
#line 552 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].charVal)); }
#line 3103 "Parser.cpp"
    break;

  case 157: /* Constant: INTEGER  */
#line 553 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].intVal)); }
#line 3109 "Parser.cpp"
    break;

  case 158: /* Constant: UINTEGER  */
#line 554 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].uintVal)); }
#line 3115 "Parser.cpp"
    break;

  case 159: /* Constant: LONGVAL  */
#line 555 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].longVal)); }
#line 3121 "Parser.cpp"
    break;

  case 160: /* Constant: ULONGVAL  */
#line 556 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].ulongVal)); }
#line 3127 "Parser.cpp"
    break;

  case 161: /* Constant: FLOATVAL  */
#line 557 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].floatVal)); }
#line 3133 "Parser.cpp"
    break;

  case 162: /* Constant: DOUBLEVAL  */
#line 558 "Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].doubleVal)); }
#line 3139 "Parser.cpp"
    break;

  case 163: /* Constant: STRING  */
#line 559 "Parser.y"
                                { (yyval.constant) = new AST::ConstStr(*(yyvsp[0].strVal)); }
#line 3145 "Parser.cpp"
    break;

  case 164: /* Constant: TRUE  */
#line 560 "Parser.y"
                                { (yyval.constant) = new AST::Constant(true); }
#line 3151 "Parser.cpp"
    break;

  case 165: /* Constant: FALSE  */
#line 561 "Parser.y"
                                { (yyval.constant) = new AST::Constant(false); }
#line 3157 "Parser.cpp"
    break;


#line 3161 "Parser.cpp"

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

#line 564 "Parser.y"


 /* Subroutines Section */
