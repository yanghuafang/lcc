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
#line 3 "frontend/Parser.y"

#include "ast/Nodes.hpp"

#include "frontend/Diagnostics.hpp"

// Declared here and defined in the Subroutines Section at the bottom, which is
// the only place it can read yylloc: bison emits this prologue above its own
// YYLTYPE declaration, so the type does not exist yet at this point in the
// generated file.
void yyerror(const char* s);

int yylex(void);

AST::Program* g_root;

#line 87 "generated/Parser.cpp"

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
#define YYLAST   2351

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  87
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  41
/* YYNRULES -- Number of rules.  */
#define YYNRULES  181
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  357

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
       0,   252,   252,   255,   256,   259,   260,   261,   262,   267,
     269,   272,   277,   281,   285,   288,   293,   296,   299,   307,
     316,   321,   322,   325,   326,   328,   329,   331,   332,   334,
     335,   336,   342,   344,   345,   350,   352,   354,   357,   365,
     367,   372,   374,   382,   384,   386,   389,   391,   397,   399,
     401,   402,   403,   406,   407,   410,   417,   418,   419,   420,
     421,   422,   423,   424,   425,   426,   427,   428,   429,   434,
     436,   439,   441,   446,   448,   449,   454,   456,   457,   460,
     461,   465,   475,   476,   479,   480,   481,   482,   483,   484,
     485,   486,   487,   488,   489,   490,   491,   492,   495,   498,
     505,   511,   513,   516,   519,   524,   527,   530,   535,   540,
     546,   550,   554,   556,   561,   576,   577,   578,   580,   581,
     583,   585,   587,   589,   605,   607,   609,   611,   613,   615,
     617,   619,   621,   623,   624,   626,   628,   630,   631,   632,
     634,   636,   638,   640,   641,   642,   643,   644,   645,   647,
     648,   649,   650,   651,   652,   653,   654,   655,   656,   657,
     658,   659,   660,   661,   662,   663,   664,   665,   666,   670,
     672,   673,   676,   677,   678,   679,   680,   681,   682,   683,
     684,   685
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

#define YYPACT_NINF (-250)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-32)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
    -250,    22,  2202,  -250,  -250,  -250,  -250,  -250,   157,  2273,
    2232,  -250,  -250,  -250,  -250,   -57,   -51,   -48,  2243,  -250,
    -250,  -250,  -250,  -250,  -250,    -9,    98,  -250,  -250,  -250,
    -250,  -250,    30,   -26,    30,    50,    64,    67,    10,    13,
      23,   101,    49,   142,  -250,  -250,  -250,   189,   257,  -250,
    -250,    33,   108,   111,   126,    66,   985,    -4,   112,  -250,
      70,  -250,   985,  -250,   124,   137,   121,    14,  -250,  -250,
    -250,  -250,   139,  -250,    -3,    16,  -250,  -250,   138,   866,
    -250,   143,  -250,    40,  -250,  -250,    78,  -250,  -250,     5,
      33,  -250,   254,  1028,   148,   162,  -250,  1039,    21,  -250,
     971,   971,   683,   839,   971,   971,   971,   971,   971,   971,
    -250,  -250,   160,   167,  -250,  -250,  -250,  -250,  -250,  -250,
    -250,  -250,  1937,  -250,    41,  -250,   258,   104,  -250,  -250,
     107,   136,   985,   145,  -250,  -250,  -250,  -250,  -250,   135,
     135,    77,   179,  1112,   944,  -250,    17,  -250,  1937,   135,
     135,   135,   135,   135,   135,   761,   971,   971,   971,   152,
     971,   971,   153,   971,   971,   971,   971,   971,   971,  -250,
    -250,   971,   971,   971,   971,   971,   971,   971,   971,   971,
     971,   971,   971,   971,   971,   971,   971,   971,   971,   971,
     971,   971,   971,  -250,  -250,   176,  -250,  -250,   199,   208,
      57,   207,   359,   971,   971,  -250,    25,   944,  -250,    96,
     244,  1158,  1937,    65,  1937,  1204,  -250,   135,  2185,  -250,
    1250,  1937,    27,    27,   135,   135,  1937,  1937,  1937,  1937,
    1937,  2103,  2144,  1937,  1937,  1937,   261,   261,  1937,  1937,
    2062,  2021,  2226,  2226,   114,   114,   114,   114,  -250,  -250,
    -250,   262,   264,  -250,  -250,  -250,  2232,   265,   266,   267,
     523,   274,   268,   269,    35,     3,  -250,  -250,  -250,     4,
    -250,  -250,  -250,  -250,  -250,  -250,  -250,  -250,  -250,  -250,
    1296,   135,   135,  -250,  -250,  -250,  -250,  -250,   971,  -250,
     971,  -250,  -250,   985,   441,    70,   971,   971,   605,   218,
     971,  -250,  -250,  -250,  1342,  -250,  1937,  1980,    71,  -250,
    1388,  1434,   971,   971,  1480,   276,  1526,  -250,  -250,   523,
     273,  1572,  1618,   971,   971,   523,   227,  -250,   971,   971,
    1664,  1710,  -250,   523,     6,  1756,  1802,   971,   286,  -250,
    -250,   971,   290,  -250,   523,   523,  1848,  -250,  1894,  -250,
    -250,  -250,   523,  -250,   523,  -250,   523
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       4,     0,     2,     1,    56,    57,    58,    59,    60,     0,
       0,    68,    65,    66,    67,     0,     0,     0,     0,    31,
       3,     8,     5,     6,     7,    34,    21,    23,    61,    62,
      63,    64,    22,    34,    21,    25,    27,    29,     0,     0,
       0,     0,    45,     0,    33,    20,    30,    45,     0,    70,
      70,    78,    25,    27,     0,     0,    52,     0,    35,    44,
       0,    18,    52,    17,     0,     0,    79,     0,    77,    70,
      70,     9,     0,    51,    54,     0,    50,    47,     0,     0,
      43,    45,    32,     0,    72,    24,    75,    69,    26,     0,
       0,    28,     0,     0,     0,     0,    53,     0,     0,    46,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     180,   181,     0,   115,   172,   173,   174,   175,   176,   177,
     178,   179,    36,   116,     0,    74,     0,     0,    80,    76,
      24,    26,    52,     0,    49,    48,    14,    83,    15,   131,
     132,   115,     0,     0,     0,    38,     0,    40,    41,   129,
     130,   141,   142,   151,   161,     0,   171,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   139,
     140,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     0,    71,    81,     0,     0,
       0,     0,     0,   124,     0,   117,     0,     0,    37,   115,
       0,     0,   170,     0,   118,     0,   120,   136,   148,   121,
       0,   133,   134,   135,   137,   138,   143,   144,   145,   146,
     147,   149,   150,   152,   153,   154,   155,   156,   157,   158,
     159,   160,   162,   163,   166,   167,   164,   165,    73,    10,
      11,     0,     0,    97,    83,    16,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   115,    95,    96,    94,    34,
      82,    85,    86,    87,    88,    89,    90,    91,    92,    93,
       0,   125,   123,    42,    39,   128,   126,   127,     0,   119,
       0,   122,    19,    52,     0,    34,     0,     0,     0,     0,
       0,   110,   111,   112,     0,    84,   169,   168,     0,   114,
       0,     0,     0,     0,     0,     0,     0,   113,    55,     0,
       0,     0,     0,     0,     0,     0,    99,   102,     0,     0,
       0,     0,   109,     0,     0,     0,     0,     0,     0,    98,
     100,     0,     0,   101,     0,     0,     0,   108,     0,    83,
     106,   107,     0,    83,   104,   105,   103
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -250,  -250,  -250,  -250,   293,  -250,   172,    -1,   296,     0,
      -2,   -29,   239,   156,    94,  -250,   251,   -38,   205,  -250,
     -37,  -250,  -250,  -250,   224,  -249,  -246,  -250,  -250,  -250,
    -250,  -250,  -250,  -250,  -250,  -250,  -250,  -250,    61,  -250,
    -250
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
       0,     1,     2,    20,   266,    22,   138,   267,   268,   269,
      34,    43,    44,   146,   147,    58,    59,    75,    76,    27,
      64,    87,   126,    67,    68,   202,   270,   271,   272,   334,
     343,   273,   274,   275,   276,   277,   278,   279,   280,   213,
     123
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      26,    23,    25,    41,    48,   294,   -31,    32,   -31,    95,
      33,    77,   -31,    65,   299,   156,    41,    90,    40,    97,
     207,    35,     3,   340,    83,   127,   136,    36,   207,    98,
      37,    91,    92,    93,   208,   159,   160,   137,   162,    46,
     303,   163,   283,    97,   100,   101,   193,   102,   167,   168,
     169,   170,    47,   124,   104,   105,    74,   137,   106,   107,
      97,    56,    74,    57,    86,    86,    49,   108,   288,    42,
     251,   341,   342,   326,    97,    96,    78,   109,   289,   332,
      50,   -31,    81,    51,   318,   128,   -31,   339,    52,   156,
     203,    53,    86,    86,   200,   110,   111,    74,   350,   351,
     354,    54,   142,    45,   356,   -31,   355,    46,   156,   285,
      55,    66,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   159,   160,    69,   162,    57,    70,   163,    84,
      79,    71,    74,   165,   166,   167,   168,   169,   170,    89,
     122,    85,    84,   159,    72,    60,   162,    61,    81,   163,
     181,   182,    94,    99,    88,   210,   125,    57,   169,   170,
     132,   139,   140,   143,   148,   149,   150,   151,   152,   153,
     154,   133,   155,     4,     5,     6,     7,     8,     9,   156,
      11,    12,    13,    14,   197,   198,     4,     5,     6,     7,
       8,     9,   204,    11,    12,    13,    14,    15,    16,    17,
      26,    62,    19,    57,   249,   148,    28,    29,    30,    31,
      15,    16,    17,   250,   199,    19,   211,   212,   214,   215,
     252,   217,   218,   201,   220,   221,   222,   223,   224,   225,
     216,   219,   226,   227,   228,   229,   230,   231,   232,   233,
     234,   235,   236,   237,   238,   239,   240,   241,   242,   243,
     244,   245,   246,   247,   248,   308,   295,   286,    26,    84,
      60,   195,    63,   196,   281,   282,    48,   292,   148,   159,
     160,   130,   162,   301,   302,   163,   293,   296,   297,   298,
     165,   166,   167,   168,   169,   170,   300,   315,   324,   327,
     333,   347,    26,    74,   349,    21,   194,   313,    24,    82,
     206,   284,   135,     4,     5,     6,     7,     8,     9,    80,
      11,    12,    13,    14,   129,     0,     0,    26,     0,     0,
       0,     0,     0,    26,     0,   304,     0,    15,    16,    17,
       0,    26,    19,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    26,     0,     0,     0,     0,     0,   306,
      26,   307,    26,     0,    26,     0,     0,   310,   311,   314,
       0,   316,     0,     0,   253,     0,     0,     0,   100,   101,
       0,   102,     0,   321,   322,   254,   255,     0,   104,   105,
       0,     0,   106,   107,   330,   331,     0,     0,     0,   335,
     336,   108,     0,     0,     0,     0,     0,     0,   346,     0,
       0,   109,   348,     0,     0,     0,     0,     0,     4,     5,
       6,     7,     8,     9,   256,    11,    12,    13,    14,   110,
     111,   257,     0,   258,     0,     0,   259,   260,   261,   262,
     263,   264,    15,    16,    17,    18,   112,   265,   114,   115,
     116,   117,   118,   119,   120,   121,   253,     0,     0,     0,
     100,   101,     0,   102,     0,     0,     0,   254,   309,     0,
     104,   105,     0,     0,   106,   107,     0,     0,     0,     0,
       0,     0,     0,   108,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   109,     0,     0,     0,     0,     0,     0,
       4,     5,     6,     7,     8,     9,   256,    11,    12,    13,
      14,   110,   111,   257,     0,   258,     0,     0,   259,   260,
     261,   262,   263,   264,    15,    16,    17,    18,   112,   265,
     114,   115,   116,   117,   118,   119,   120,   121,   253,     0,
       0,     0,   100,   101,     0,   102,     0,     0,     0,   254,
       0,     0,   104,   105,     0,     0,   106,   107,     0,     0,
       0,     0,     0,     0,     0,   108,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   109,     0,     0,     0,     0,
       0,     0,     4,     5,     6,     7,     8,     9,   256,    11,
      12,    13,    14,   110,   111,   257,     0,   258,     0,     0,
     259,   260,   261,   262,   263,   264,    15,    16,    17,    18,
     112,   265,   114,   115,   116,   117,   118,   119,   120,   121,
     312,     0,     0,     0,   100,   101,     0,   102,     0,     0,
       0,     0,     0,     0,   104,   105,     0,     0,   106,   107,
       0,     0,     0,     0,     0,     0,     0,   108,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   109,     0,     0,
       0,     0,     0,     0,     4,     5,     6,     7,     8,     9,
     256,    11,    12,    13,    14,   110,   111,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    15,    16,
      17,     0,   112,   265,   114,   115,   116,   117,   118,   119,
     120,   121,   100,   101,     0,   102,     0,     0,     0,     0,
       0,     0,   104,   105,     0,     0,   106,   107,     0,     0,
       0,     0,     0,     0,     0,   108,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   109,     0,     0,     0,     0,
       0,     0,     4,     5,     6,     7,     8,     9,     0,    11,
      12,    13,    14,   110,   111,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    15,    16,    17,     0,
     112,   141,   114,   115,   116,   117,   118,   119,   120,   121,
     100,   101,     0,   102,     0,     0,     0,     0,     0,     0,
     104,   105,     0,     0,   106,   107,     0,     0,     0,     0,
       0,     0,     0,   108,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   109,     0,     0,     0,     0,     0,     0,
       4,     5,     6,     7,     8,     9,     0,    11,    12,    13,
      14,   110,   111,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    15,    16,    17,     0,   112,   209,
     114,   115,   116,   117,   118,   119,   120,   121,   100,   101,
       0,   102,     0,     0,     0,   144,   145,     0,   104,   105,
       0,     0,   106,   107,     0,     0,     0,     0,     0,     0,
       0,   108,     0,     0,     0,   100,   101,     0,   102,     0,
       0,   109,   103,     0,     0,   104,   105,     0,     0,   106,
     107,     0,     0,     0,     0,     0,     0,     0,   108,   110,
     111,     0,     0,     0,     0,     0,     0,     0,   109,     0,
       0,     0,     0,     0,     0,     0,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   110,   111,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   100,   101,     0,   102,     0,     0,     0,
     144,     0,     0,   104,   105,     0,     0,   106,   107,     0,
       0,     0,     0,     0,     0,     0,   108,     0,     0,     0,
     100,   101,     0,   102,     0,     0,   109,     0,     0,     0,
     104,   105,    73,     0,   106,   107,     0,     0,     0,     0,
       0,     0,     0,   108,   110,   111,     0,     0,     0,     0,
       0,     0,     0,   109,     0,     0,     0,     0,     0,     0,
       0,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   110,   111,    84,     4,     5,     6,     7,     8,     9,
       0,    11,    12,    13,    14,   131,   134,     0,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,    15,    16,
      17,     0,     0,    19,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     4,     5,     6,
       7,     8,     9,     0,    11,    12,    13,    14,     4,     5,
       6,     7,     8,     9,     0,    11,    12,    13,    14,     0,
       0,    15,    16,    17,     0,     0,    19,     0,     0,     0,
       0,     0,    15,    16,    17,   157,     0,    19,   158,     0,
     159,   160,   161,   162,     0,   205,   163,     0,     0,     0,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,     0,   178,   179,   180,   181,   182,
     183,   184,   185,   186,     0,   187,   188,   189,   190,   191,
     192,   157,     0,     0,   158,     0,   159,   160,   161,   162,
       0,   287,   163,     0,     0,     0,   164,   165,   166,   167,
     168,   169,   170,   171,   172,   173,   174,   175,   176,   177,
       0,   178,   179,   180,   181,   182,   183,   184,   185,   186,
       0,   187,   188,   189,   190,   191,   192,   157,   290,     0,
     158,     0,   159,   160,   161,   162,     0,     0,   163,     0,
       0,     0,   164,   165,   166,   167,   168,   169,   170,   171,
     172,   173,   174,   175,   176,   177,     0,   178,   179,   180,
     181,   182,   183,   184,   185,   186,     0,   187,   188,   189,
     190,   191,   192,   157,     0,     0,   158,     0,   159,   160,
     161,   162,     0,     0,   163,   291,     0,     0,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,     0,   178,   179,   180,   181,   182,   183,   184,
     185,   186,     0,   187,   188,   189,   190,   191,   192,   157,
       0,   305,   158,     0,   159,   160,   161,   162,     0,     0,
     163,     0,     0,     0,   164,   165,   166,   167,   168,   169,
     170,   171,   172,   173,   174,   175,   176,   177,     0,   178,
     179,   180,   181,   182,   183,   184,   185,   186,     0,   187,
     188,   189,   190,   191,   192,   157,     0,   317,   158,     0,
     159,   160,   161,   162,     0,     0,   163,     0,     0,     0,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,     0,   178,   179,   180,   181,   182,
     183,   184,   185,   186,     0,   187,   188,   189,   190,   191,
     192,   157,     0,     0,   158,     0,   159,   160,   161,   162,
       0,   319,   163,     0,     0,     0,   164,   165,   166,   167,
     168,   169,   170,   171,   172,   173,   174,   175,   176,   177,
       0,   178,   179,   180,   181,   182,   183,   184,   185,   186,
       0,   187,   188,   189,   190,   191,   192,   157,     0,     0,
     158,     0,   159,   160,   161,   162,     0,   320,   163,     0,
       0,     0,   164,   165,   166,   167,   168,   169,   170,   171,
     172,   173,   174,   175,   176,   177,     0,   178,   179,   180,
     181,   182,   183,   184,   185,   186,     0,   187,   188,   189,
     190,   191,   192,   157,     0,   323,   158,     0,   159,   160,
     161,   162,     0,     0,   163,     0,     0,     0,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,     0,   178,   179,   180,   181,   182,   183,   184,
     185,   186,     0,   187,   188,   189,   190,   191,   192,   157,
       0,     0,   158,     0,   159,   160,   161,   162,     0,   325,
     163,     0,     0,     0,   164,   165,   166,   167,   168,   169,
     170,   171,   172,   173,   174,   175,   176,   177,     0,   178,
     179,   180,   181,   182,   183,   184,   185,   186,     0,   187,
     188,   189,   190,   191,   192,   157,     0,   328,   158,     0,
     159,   160,   161,   162,     0,     0,   163,     0,     0,     0,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,     0,   178,   179,   180,   181,   182,
     183,   184,   185,   186,     0,   187,   188,   189,   190,   191,
     192,   157,     0,   329,   158,     0,   159,   160,   161,   162,
       0,     0,   163,     0,     0,     0,   164,   165,   166,   167,
     168,   169,   170,   171,   172,   173,   174,   175,   176,   177,
       0,   178,   179,   180,   181,   182,   183,   184,   185,   186,
       0,   187,   188,   189,   190,   191,   192,   157,     0,   337,
     158,     0,   159,   160,   161,   162,     0,     0,   163,     0,
       0,     0,   164,   165,   166,   167,   168,   169,   170,   171,
     172,   173,   174,   175,   176,   177,     0,   178,   179,   180,
     181,   182,   183,   184,   185,   186,     0,   187,   188,   189,
     190,   191,   192,   157,     0,     0,   158,     0,   159,   160,
     161,   162,     0,   338,   163,     0,     0,     0,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,     0,   178,   179,   180,   181,   182,   183,   184,
     185,   186,     0,   187,   188,   189,   190,   191,   192,   157,
       0,     0,   158,     0,   159,   160,   161,   162,     0,   344,
     163,     0,     0,     0,   164,   165,   166,   167,   168,   169,
     170,   171,   172,   173,   174,   175,   176,   177,     0,   178,
     179,   180,   181,   182,   183,   184,   185,   186,     0,   187,
     188,   189,   190,   191,   192,   157,     0,     0,   158,     0,
     159,   160,   161,   162,     0,   345,   163,     0,     0,     0,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,     0,   178,   179,   180,   181,   182,
     183,   184,   185,   186,     0,   187,   188,   189,   190,   191,
     192,   157,     0,     0,   158,     0,   159,   160,   161,   162,
       0,   352,   163,     0,     0,     0,   164,   165,   166,   167,
     168,   169,   170,   171,   172,   173,   174,   175,   176,   177,
       0,   178,   179,   180,   181,   182,   183,   184,   185,   186,
       0,   187,   188,   189,   190,   191,   192,   157,   353,     0,
     158,     0,   159,   160,   161,   162,     0,     0,   163,     0,
       0,     0,   164,   165,   166,   167,   168,   169,   170,   171,
     172,   173,   174,   175,   176,   177,     0,   178,   179,   180,
     181,   182,   183,   184,   185,   186,     0,   187,   188,   189,
     190,   191,   192,   158,     0,   159,   160,   161,   162,     0,
       0,   163,     0,     0,     0,   164,   165,   166,   167,   168,
     169,   170,   171,   172,   173,   174,   175,   176,   177,     0,
     178,   179,   180,   181,   182,   183,   184,   185,   186,     0,
     187,   188,   189,   190,   191,   192,   158,     0,   159,   160,
     161,   162,     0,     0,   163,     0,     0,     0,     0,   165,
     166,   167,   168,   169,   170,     0,     0,     0,     0,     0,
     176,   177,     0,     0,     0,     0,   181,   182,     0,     0,
     185,   186,     0,   187,   188,   189,   190,   191,   192,   159,
     160,   161,   162,     0,     0,   163,     0,     0,     0,     0,
     165,   166,   167,   168,   169,   170,     0,     0,     0,     0,
       0,   176,   177,     0,     0,     0,     0,   181,   182,     0,
       0,   185,     0,     0,   187,   188,   189,   190,   191,   192,
     159,   160,   161,   162,     0,     0,   163,     0,     0,     0,
       0,   165,   166,   167,   168,   169,   170,     0,     0,     0,
       0,     0,   176,   177,     0,     0,     0,     0,   181,   182,
       0,     0,     0,     0,     0,   187,   188,   189,   190,   191,
     192,   159,   160,   161,   162,     0,     0,   163,     0,     0,
       0,     0,   165,   166,   167,   168,   169,   170,     0,     0,
       0,     0,     0,     0,   177,     0,     0,     0,     0,   181,
     182,     0,     0,     0,     0,     0,   187,   188,   189,   190,
     191,   192,   159,   160,   161,   162,     0,     0,   163,     0,
       0,     0,     0,   165,   166,   167,   168,   169,   170,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     181,   182,     0,     0,     0,     0,     0,   187,   188,   189,
     190,   191,   192,   159,   160,     0,   162,     0,     0,   163,
       0,     0,     0,     0,   165,   166,   167,   168,   169,   170,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   181,   182,     0,     0,     0,     0,     0,   187,   188,
     189,   190,   191,   192,   159,   160,     0,   162,     0,     0,
     163,     0,     0,     0,     0,   165,   166,   167,   168,   169,
     170,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,   181,   182,     0,     0,     0,     0,     0,     0,
       0,   189,   190,   191,   192,    15,    16,    17,    18,     0,
      19,     4,     5,     6,     7,     8,     9,     0,    11,    12,
      13,    14,     4,     5,     6,     7,     8,     9,     0,    11,
      12,    13,    14,     0,     0,    15,    16,    17,     0,     0,
      19,     0,     0,     0,     0,     0,    38,    39,    17,     0,
       0,    19,     4,     5,     6,     7,     8,     0,     0,    11,
      12,    13,    14,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    15,    16,    17,     0,
       0,    19
};

static const yytype_int16 yycheck[] =
{
       2,     2,     2,    12,    33,   254,     3,     9,     5,    12,
      10,    15,     9,    50,   260,    12,    12,     3,    18,     3,
       3,    78,     0,    17,    62,    20,     5,    78,     3,    13,
      78,    17,    69,    70,    17,     8,     9,    16,    11,     9,
       5,    14,    17,     3,     9,    10,     5,    12,    21,    22,
      23,    24,    78,    13,    19,    20,    56,    16,    23,    24,
       3,    12,    62,    14,    64,    65,    16,    32,     3,    78,
      13,    65,    66,   319,     3,    78,    80,    42,    13,   325,
      16,    78,    78,    16,    13,    80,     9,   333,    78,    12,
      13,    78,    92,    93,   132,    60,    61,    97,   344,   345,
     349,    78,   102,     5,   353,     9,   352,     9,    12,    13,
       9,    78,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,     8,     9,    16,    11,    14,    16,    14,     5,
      18,     5,   132,    19,    20,    21,    22,    23,    24,    18,
      79,    17,     5,     8,    78,     3,    11,     5,    78,    14,
      36,    37,    13,    15,    17,   155,    78,    14,    23,    24,
      12,   100,   101,   102,   103,   104,   105,   106,   107,   108,
     109,     9,    12,    49,    50,    51,    52,    53,    54,    12,
      56,    57,    58,    59,    80,    78,    49,    50,    51,    52,
      53,    54,    13,    56,    57,    58,    59,    73,    74,    75,
     202,    12,    78,    14,     5,   144,    49,    50,    51,    52,
      73,    74,    75,     5,    78,    78,   155,   156,   157,   158,
      13,   160,   161,    78,   163,   164,   165,   166,   167,   168,
      78,    78,   171,   172,   173,   174,   175,   176,   177,   178,
     179,   180,   181,   182,   183,   184,   185,   186,   187,   188,
     189,   190,   191,   192,    78,   293,   256,    13,   260,     5,
       3,     3,     5,     5,   203,   204,   295,     5,   207,     8,
       9,    17,    11,     5,     5,    14,    12,    12,    12,    12,
      19,    20,    21,    22,    23,    24,    12,    69,    12,    16,
      63,     5,   294,   293,     4,     2,   124,   298,     2,    60,
     144,   207,    97,    49,    50,    51,    52,    53,    54,    58,
      56,    57,    58,    59,    90,    -1,    -1,   319,    -1,    -1,
      -1,    -1,    -1,   325,    -1,   264,    -1,    73,    74,    75,
      -1,   333,    78,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   344,   345,    -1,    -1,    -1,    -1,    -1,   288,
     352,   290,   354,    -1,   356,    -1,    -1,   296,   297,   298,
      -1,   300,    -1,    -1,     5,    -1,    -1,    -1,     9,    10,
      -1,    12,    -1,   312,   313,    16,    17,    -1,    19,    20,
      -1,    -1,    23,    24,   323,   324,    -1,    -1,    -1,   328,
     329,    32,    -1,    -1,    -1,    -1,    -1,    -1,   337,    -1,
      -1,    42,   341,    -1,    -1,    -1,    -1,    -1,    49,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    64,    -1,    -1,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,     5,    -1,    -1,    -1,
       9,    10,    -1,    12,    -1,    -1,    -1,    16,    17,    -1,
      19,    20,    -1,    -1,    23,    24,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    32,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,    -1,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    64,    -1,    -1,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,     5,    -1,
      -1,    -1,     9,    10,    -1,    12,    -1,    -1,    -1,    16,
      -1,    -1,    19,    20,    -1,    -1,    23,    24,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    32,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,
      -1,    -1,    49,    50,    51,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    64,    -1,    -1,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
       5,    -1,    -1,    -1,     9,    10,    -1,    12,    -1,    -1,
      -1,    -1,    -1,    -1,    19,    20,    -1,    -1,    23,    24,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    32,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    42,    -1,    -1,
      -1,    -1,    -1,    -1,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    73,    74,
      75,    -1,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,     9,    10,    -1,    12,    -1,    -1,    -1,    -1,
      -1,    -1,    19,    20,    -1,    -1,    23,    24,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    32,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,
      -1,    -1,    49,    50,    51,    52,    53,    54,    -1,    56,
      57,    58,    59,    60,    61,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    73,    74,    75,    -1,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
       9,    10,    -1,    12,    -1,    -1,    -1,    -1,    -1,    -1,
      19,    20,    -1,    -1,    23,    24,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    32,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,    -1,
      49,    50,    51,    52,    53,    54,    -1,    56,    57,    58,
      59,    60,    61,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    73,    74,    75,    -1,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,     9,    10,
      -1,    12,    -1,    -1,    -1,    16,    17,    -1,    19,    20,
      -1,    -1,    23,    24,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    32,    -1,    -1,    -1,     9,    10,    -1,    12,    -1,
      -1,    42,    16,    -1,    -1,    19,    20,    -1,    -1,    23,
      24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    32,    60,
      61,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    42,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    60,    61,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,     9,    10,    -1,    12,    -1,    -1,    -1,
      16,    -1,    -1,    19,    20,    -1,    -1,    23,    24,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    32,    -1,    -1,    -1,
       9,    10,    -1,    12,    -1,    -1,    42,    -1,    -1,    -1,
      19,    20,     7,    -1,    23,    24,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    32,    60,    61,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    60,    61,     5,    49,    50,    51,    52,    53,    54,
      -1,    56,    57,    58,    59,    17,     7,    -1,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    73,    74,
      75,    -1,    -1,    78,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    49,    50,    51,
      52,    53,    54,    -1,    56,    57,    58,    59,    49,    50,
      51,    52,    53,    54,    -1,    56,    57,    58,    59,    -1,
      -1,    73,    74,    75,    -1,    -1,    78,    -1,    -1,    -1,
      -1,    -1,    73,    74,    75,     3,    -1,    78,     6,    -1,
       8,     9,    10,    11,    -1,    13,    14,    -1,    -1,    -1,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    -1,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    -1,    43,    44,    45,    46,    47,
      48,     3,    -1,    -1,     6,    -1,     8,     9,    10,    11,
      -1,    13,    14,    -1,    -1,    -1,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      -1,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      -1,    43,    44,    45,    46,    47,    48,     3,     4,    -1,
       6,    -1,     8,     9,    10,    11,    -1,    -1,    14,    -1,
      -1,    -1,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    -1,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    -1,    43,    44,    45,
      46,    47,    48,     3,    -1,    -1,     6,    -1,     8,     9,
      10,    11,    -1,    -1,    14,    15,    -1,    -1,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    -1,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    -1,    43,    44,    45,    46,    47,    48,     3,
      -1,     5,     6,    -1,     8,     9,    10,    11,    -1,    -1,
      14,    -1,    -1,    -1,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    -1,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    -1,    43,
      44,    45,    46,    47,    48,     3,    -1,     5,     6,    -1,
       8,     9,    10,    11,    -1,    -1,    14,    -1,    -1,    -1,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    -1,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    -1,    43,    44,    45,    46,    47,
      48,     3,    -1,    -1,     6,    -1,     8,     9,    10,    11,
      -1,    13,    14,    -1,    -1,    -1,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      -1,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      -1,    43,    44,    45,    46,    47,    48,     3,    -1,    -1,
       6,    -1,     8,     9,    10,    11,    -1,    13,    14,    -1,
      -1,    -1,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    -1,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    -1,    43,    44,    45,
      46,    47,    48,     3,    -1,     5,     6,    -1,     8,     9,
      10,    11,    -1,    -1,    14,    -1,    -1,    -1,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    -1,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    -1,    43,    44,    45,    46,    47,    48,     3,
      -1,    -1,     6,    -1,     8,     9,    10,    11,    -1,    13,
      14,    -1,    -1,    -1,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    -1,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    -1,    43,
      44,    45,    46,    47,    48,     3,    -1,     5,     6,    -1,
       8,     9,    10,    11,    -1,    -1,    14,    -1,    -1,    -1,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    -1,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    -1,    43,    44,    45,    46,    47,
      48,     3,    -1,     5,     6,    -1,     8,     9,    10,    11,
      -1,    -1,    14,    -1,    -1,    -1,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      -1,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      -1,    43,    44,    45,    46,    47,    48,     3,    -1,     5,
       6,    -1,     8,     9,    10,    11,    -1,    -1,    14,    -1,
      -1,    -1,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    -1,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    -1,    43,    44,    45,
      46,    47,    48,     3,    -1,    -1,     6,    -1,     8,     9,
      10,    11,    -1,    13,    14,    -1,    -1,    -1,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    -1,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    -1,    43,    44,    45,    46,    47,    48,     3,
      -1,    -1,     6,    -1,     8,     9,    10,    11,    -1,    13,
      14,    -1,    -1,    -1,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    -1,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    -1,    43,
      44,    45,    46,    47,    48,     3,    -1,    -1,     6,    -1,
       8,     9,    10,    11,    -1,    13,    14,    -1,    -1,    -1,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    -1,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    -1,    43,    44,    45,    46,    47,
      48,     3,    -1,    -1,     6,    -1,     8,     9,    10,    11,
      -1,    13,    14,    -1,    -1,    -1,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      -1,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      -1,    43,    44,    45,    46,    47,    48,     3,     4,    -1,
       6,    -1,     8,     9,    10,    11,    -1,    -1,    14,    -1,
      -1,    -1,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    -1,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    -1,    43,    44,    45,
      46,    47,    48,     6,    -1,     8,     9,    10,    11,    -1,
      -1,    14,    -1,    -1,    -1,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    -1,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    -1,
      43,    44,    45,    46,    47,    48,     6,    -1,     8,     9,
      10,    11,    -1,    -1,    14,    -1,    -1,    -1,    -1,    19,
      20,    21,    22,    23,    24,    -1,    -1,    -1,    -1,    -1,
      30,    31,    -1,    -1,    -1,    -1,    36,    37,    -1,    -1,
      40,    41,    -1,    43,    44,    45,    46,    47,    48,     8,
       9,    10,    11,    -1,    -1,    14,    -1,    -1,    -1,    -1,
      19,    20,    21,    22,    23,    24,    -1,    -1,    -1,    -1,
      -1,    30,    31,    -1,    -1,    -1,    -1,    36,    37,    -1,
      -1,    40,    -1,    -1,    43,    44,    45,    46,    47,    48,
       8,     9,    10,    11,    -1,    -1,    14,    -1,    -1,    -1,
      -1,    19,    20,    21,    22,    23,    24,    -1,    -1,    -1,
      -1,    -1,    30,    31,    -1,    -1,    -1,    -1,    36,    37,
      -1,    -1,    -1,    -1,    -1,    43,    44,    45,    46,    47,
      48,     8,     9,    10,    11,    -1,    -1,    14,    -1,    -1,
      -1,    -1,    19,    20,    21,    22,    23,    24,    -1,    -1,
      -1,    -1,    -1,    -1,    31,    -1,    -1,    -1,    -1,    36,
      37,    -1,    -1,    -1,    -1,    -1,    43,    44,    45,    46,
      47,    48,     8,     9,    10,    11,    -1,    -1,    14,    -1,
      -1,    -1,    -1,    19,    20,    21,    22,    23,    24,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      36,    37,    -1,    -1,    -1,    -1,    -1,    43,    44,    45,
      46,    47,    48,     8,     9,    -1,    11,    -1,    -1,    14,
      -1,    -1,    -1,    -1,    19,    20,    21,    22,    23,    24,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    36,    37,    -1,    -1,    -1,    -1,    -1,    43,    44,
      45,    46,    47,    48,     8,     9,    -1,    11,    -1,    -1,
      14,    -1,    -1,    -1,    -1,    19,    20,    21,    22,    23,
      24,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    36,    37,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    45,    46,    47,    48,    73,    74,    75,    76,    -1,
      78,    49,    50,    51,    52,    53,    54,    -1,    56,    57,
      58,    59,    49,    50,    51,    52,    53,    54,    -1,    56,
      57,    58,    59,    -1,    -1,    73,    74,    75,    -1,    -1,
      78,    -1,    -1,    -1,    -1,    -1,    73,    74,    75,    -1,
      -1,    78,    49,    50,    51,    52,    53,    -1,    -1,    56,
      57,    58,    59,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    73,    74,    75,    -1,
      -1,    78
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    88,    89,     0,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    73,    74,    75,    76,    78,
      90,    91,    92,    94,    95,    96,    97,   106,    49,    50,
      51,    52,    97,    96,    97,    78,    78,    78,    73,    74,
      96,    12,    78,    98,    99,     5,     9,    78,    98,    16,
      16,    16,    78,    78,    78,     9,    12,    14,   102,   103,
       3,     5,    12,     5,   107,   107,    78,   110,   111,    16,
      16,     5,    78,     7,    96,   104,   105,    15,    80,    18,
     103,    78,    99,   104,     5,    17,    96,   108,    17,    18,
       3,    17,   107,   107,    13,    12,    78,     3,    13,    15,
       9,    10,    12,    16,    19,    20,    23,    24,    32,    42,
      60,    61,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,   125,   127,    13,    78,   109,    20,    80,   111,
      17,    17,    12,     9,     7,   105,     5,    16,    93,   125,
     125,    78,    96,   125,    16,    17,   100,   101,   125,   125,
     125,   125,   125,   125,   125,    12,    12,     3,     6,     8,
       9,    10,    11,    14,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    43,    44,    45,
      46,    47,    48,     5,    93,     3,     5,    80,    78,    78,
     104,    78,   112,    13,    13,    13,   100,     3,    17,    78,
      96,   125,   125,   126,   125,   125,    78,   125,   125,    78,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,    78,     5,
       5,    13,    13,     5,    16,    17,    55,    62,    64,    67,
      68,    69,    70,    71,    72,    78,    91,    94,    95,    96,
     113,   114,   115,   118,   119,   120,   121,   122,   123,   124,
     125,   125,   125,    17,   101,    13,    13,    13,     3,    13,
       4,    15,     5,    12,   112,    96,    12,    12,    12,   113,
      12,     5,     5,     5,   125,     5,   125,   125,   104,    17,
     125,   125,     5,    94,   125,    69,   125,     5,    13,    13,
      13,   125,   125,     5,    12,    13,   113,    16,     5,     5,
     125,   125,   113,    63,   116,   125,   125,     5,    13,   113,
      17,    65,    66,   117,    13,    13,   125,     5,   125,     4,
     113,   113,    13,     4,   112,   113,   112
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    87,    88,    89,    89,    90,    90,    90,    90,    91,
      91,    91,    92,    92,    92,    92,    93,    94,    94,    94,
      95,    96,    96,    97,    97,    97,    97,    97,    97,    97,
      97,    97,    98,    98,    98,    99,    99,    99,    99,   100,
     100,   101,   101,   102,   102,   102,   103,   103,   104,   104,
     104,   104,   104,   105,   105,   105,   106,   106,   106,   106,
     106,   106,   106,   106,   106,   106,   106,   106,   106,   107,
     107,   108,   108,   109,   109,   109,   110,   110,   110,   111,
     111,   111,   112,   112,   113,   113,   113,   113,   113,   113,
     113,   113,   113,   113,   113,   113,   113,   113,   114,   114,
     115,   116,   116,   117,   117,   118,   118,   118,   119,   120,
     121,   122,   123,   123,   124,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   126,
     126,   126,   127,   127,   127,   127,   127,   127,   127,   127,
     127,   127
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     0,     1,     1,     1,     1,     4,
       8,     8,     7,     7,     6,     6,     3,     4,     3,     9,
       2,     1,     2,     1,     5,     2,     5,     2,     5,     2,
       2,     1,     3,     1,     0,     2,     4,     6,     5,     3,
       1,     1,     3,     2,     1,     0,     3,     2,     3,     3,
       1,     1,     0,     2,     1,     8,     1,     1,     1,     1,
       1,     2,     2,     2,     2,     1,     1,     1,     1,     2,
       0,     3,     1,     3,     1,     0,     3,     1,     0,     1,
       3,     4,     2,     0,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     7,     5,
       7,     2,     0,     4,     3,     9,     8,     8,     7,     5,
       2,     2,     2,     3,     3,     1,     1,     3,     3,     4,
       3,     3,     4,     4,     3,     4,     4,     4,     4,     2,
       2,     2,     2,     3,     3,     3,     3,     3,     3,     2,
       2,     2,     2,     3,     3,     3,     3,     3,     3,     3,
       3,     2,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     2,     3,     3,     3,     3,     3,     3,     5,     3,
       1,     0,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1
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
    case YYSYMBOL_Decls: /* Decls  */
#line 144 "frontend/Parser.y"
            { delete ((*yyvaluep).decls); }
#line 1950 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Decl: /* Decl  */
#line 144 "frontend/Parser.y"
            { delete ((*yyvaluep).decl); }
#line 1956 "generated/Parser.cpp"
        break;

    case YYSYMBOL_TypedefDecl: /* TypedefDecl  */
#line 144 "frontend/Parser.y"
            { delete ((*yyvaluep).typedefDecl); }
#line 1962 "generated/Parser.cpp"
        break;

    case YYSYMBOL_FuncDecl: /* FuncDecl  */
#line 145 "frontend/Parser.y"
            { delete ((*yyvaluep).funcDecl); }
#line 1968 "generated/Parser.cpp"
        break;

    case YYSYMBOL_FuncBody: /* FuncBody  */
#line 145 "frontend/Parser.y"
            { delete ((*yyvaluep).funcBody); }
#line 1974 "generated/Parser.cpp"
        break;

    case YYSYMBOL_VarDecl: /* VarDecl  */
#line 145 "frontend/Parser.y"
            { delete ((*yyvaluep).varDecl); }
#line 1980 "generated/Parser.cpp"
        break;

    case YYSYMBOL_TypeDecl: /* TypeDecl  */
#line 144 "frontend/Parser.y"
            { delete ((*yyvaluep).typeDecl); }
#line 1986 "generated/Parser.cpp"
        break;

    case YYSYMBOL_VarType: /* VarType  */
#line 145 "frontend/Parser.y"
            { delete ((*yyvaluep).varType); }
#line 1992 "generated/Parser.cpp"
        break;

    case YYSYMBOL__VarType: /* _VarType  */
#line 145 "frontend/Parser.y"
            { delete ((*yyvaluep).varType); }
#line 1998 "generated/Parser.cpp"
        break;

    case YYSYMBOL_VarList: /* VarList  */
#line 146 "frontend/Parser.y"
            { delete ((*yyvaluep).varList); }
#line 2004 "generated/Parser.cpp"
        break;

    case YYSYMBOL_VarInit: /* VarInit  */
#line 146 "frontend/Parser.y"
            { delete ((*yyvaluep).varInit); }
#line 2010 "generated/Parser.cpp"
        break;

    case YYSYMBOL_InitList: /* InitList  */
#line 148 "frontend/Parser.y"
            { delete ((*yyvaluep).initList); }
#line 2016 "generated/Parser.cpp"
        break;

    case YYSYMBOL_InitItem: /* InitItem  */
#line 148 "frontend/Parser.y"
            { delete ((*yyvaluep).initElement); }
#line 2022 "generated/Parser.cpp"
        break;

    case YYSYMBOL_ArrayBoundList: /* ArrayBoundList  */
#line 146 "frontend/Parser.y"
            { delete ((*yyvaluep).arrayBoundList); }
#line 2028 "generated/Parser.cpp"
        break;

    case YYSYMBOL_ParamList: /* ParamList  */
#line 146 "frontend/Parser.y"
            { delete ((*yyvaluep).paramList); }
#line 2034 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Param: /* Param  */
#line 146 "frontend/Parser.y"
            { delete ((*yyvaluep).param); }
#line 2040 "generated/Parser.cpp"
        break;

    case YYSYMBOL_BuiltinType: /* BuiltinType  */
#line 147 "frontend/Parser.y"
            { delete ((*yyvaluep).builtinType); }
#line 2046 "generated/Parser.cpp"
        break;

    case YYSYMBOL_FieldDecls: /* FieldDecls  */
#line 147 "frontend/Parser.y"
            { delete ((*yyvaluep).fieldDecls); }
#line 2052 "generated/Parser.cpp"
        break;

    case YYSYMBOL_FieldDecl: /* FieldDecl  */
#line 147 "frontend/Parser.y"
            { delete ((*yyvaluep).fieldDecl); }
#line 2058 "generated/Parser.cpp"
        break;

    case YYSYMBOL_MemberList: /* MemberList  */
#line 147 "frontend/Parser.y"
            { delete ((*yyvaluep).memberList); }
#line 2064 "generated/Parser.cpp"
        break;

    case YYSYMBOL_EnumList: /* EnumList  */
#line 152 "frontend/Parser.y"
            { delete ((*yyvaluep).enumList); }
#line 2070 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Enum: /* Enum  */
#line 152 "frontend/Parser.y"
            { delete ((*yyvaluep).enumeration); }
#line 2076 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Stmts: /* Stmts  */
#line 149 "frontend/Parser.y"
            { delete ((*yyvaluep).stmts); }
#line 2082 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Stmt: /* Stmt  */
#line 149 "frontend/Parser.y"
            { delete ((*yyvaluep).stmt); }
#line 2088 "generated/Parser.cpp"
        break;

    case YYSYMBOL_IfStmt: /* IfStmt  */
#line 149 "frontend/Parser.y"
            { delete ((*yyvaluep).ifStmt); }
#line 2094 "generated/Parser.cpp"
        break;

    case YYSYMBOL_SwitchStmt: /* SwitchStmt  */
#line 149 "frontend/Parser.y"
            { delete ((*yyvaluep).switchStmt); }
#line 2100 "generated/Parser.cpp"
        break;

    case YYSYMBOL_CaseStmtList: /* CaseStmtList  */
#line 149 "frontend/Parser.y"
            { delete ((*yyvaluep).caseStmtList); }
#line 2106 "generated/Parser.cpp"
        break;

    case YYSYMBOL_CaseStmt: /* CaseStmt  */
#line 150 "frontend/Parser.y"
            { delete ((*yyvaluep).caseStmt); }
#line 2112 "generated/Parser.cpp"
        break;

    case YYSYMBOL_ForStmt: /* ForStmt  */
#line 150 "frontend/Parser.y"
            { delete ((*yyvaluep).forStmt); }
#line 2118 "generated/Parser.cpp"
        break;

    case YYSYMBOL_DoStmt: /* DoStmt  */
#line 150 "frontend/Parser.y"
            { delete ((*yyvaluep).doStmt); }
#line 2124 "generated/Parser.cpp"
        break;

    case YYSYMBOL_WhileStmt: /* WhileStmt  */
#line 150 "frontend/Parser.y"
            { delete ((*yyvaluep).whileStmt); }
#line 2130 "generated/Parser.cpp"
        break;

    case YYSYMBOL_ContinueStmt: /* ContinueStmt  */
#line 151 "frontend/Parser.y"
            { delete ((*yyvaluep).continueStmt); }
#line 2136 "generated/Parser.cpp"
        break;

    case YYSYMBOL_BreakStmt: /* BreakStmt  */
#line 151 "frontend/Parser.y"
            { delete ((*yyvaluep).breakStmt); }
#line 2142 "generated/Parser.cpp"
        break;

    case YYSYMBOL_ReturnStmt: /* ReturnStmt  */
#line 151 "frontend/Parser.y"
            { delete ((*yyvaluep).returnStmt); }
#line 2148 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Block: /* Block  */
#line 145 "frontend/Parser.y"
            { delete ((*yyvaluep).block); }
#line 2154 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Expr: /* Expr  */
#line 148 "frontend/Parser.y"
            { delete ((*yyvaluep).expr); }
#line 2160 "generated/Parser.cpp"
        break;

    case YYSYMBOL_ExprList: /* ExprList  */
#line 148 "frontend/Parser.y"
            { delete ((*yyvaluep).exprList); }
#line 2166 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Constant: /* Constant  */
#line 148 "frontend/Parser.y"
            { delete ((*yyvaluep).constant); }
#line 2172 "generated/Parser.cpp"
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
#line 252 "frontend/Parser.y"
                                { (yyval.program) = new AST::Program((yyvsp[0].decls)); g_root = (yyval.program); }
#line 2470 "generated/Parser.cpp"
    break;

  case 3: /* Decls: Decls Decl  */
#line 255 "frontend/Parser.y"
                                { (yyval.decls) = (yyvsp[-1].decls); (yyval.decls)->push_back((yyvsp[0].decl)); }
#line 2476 "generated/Parser.cpp"
    break;

  case 4: /* Decls: %empty  */
#line 256 "frontend/Parser.y"
                                { (yyval.decls) = new AST::Decls(); }
#line 2482 "generated/Parser.cpp"
    break;

  case 5: /* Decl: FuncDecl  */
#line 259 "frontend/Parser.y"
                                { (yyval.decl) = (yyvsp[0].funcDecl); }
#line 2488 "generated/Parser.cpp"
    break;

  case 6: /* Decl: VarDecl  */
#line 260 "frontend/Parser.y"
                                { (yyval.decl) = (yyvsp[0].varDecl); }
#line 2494 "generated/Parser.cpp"
    break;

  case 7: /* Decl: TypeDecl  */
#line 261 "frontend/Parser.y"
                                { (yyval.decl) = (yyvsp[0].typeDecl); }
#line 2500 "generated/Parser.cpp"
    break;

  case 8: /* Decl: TypedefDecl  */
#line 262 "frontend/Parser.y"
                                { (yyval.decl) = (yyvsp[0].typedefDecl); }
#line 2506 "generated/Parser.cpp"
    break;

  case 9: /* TypedefDecl: TYPEDEF VarType IDENTIFIER SEMICOLON  */
#line 268 "frontend/Parser.y"
                                { (yyval.typedefDecl) = new AST::TypedefDecl((yyvsp[-2].varType), *(yyvsp[-1].idVal)); }
#line 2512 "generated/Parser.cpp"
    break;

  case 10: /* TypedefDecl: TYPEDEF STRUCT IDENTIFIER LBRACE FieldDecls RBRACE IDENTIFIER SEMICOLON  */
#line 270 "frontend/Parser.y"
                                { (yyval.typedefDecl) = new AST::TypedefDecl(
                                      new AST::StructType((yyvsp[-3].fieldDecls), *(yyvsp[-5].idVal)), *(yyvsp[-1].idVal)); }
#line 2519 "generated/Parser.cpp"
    break;

  case 11: /* TypedefDecl: TYPEDEF UNION IDENTIFIER LBRACE FieldDecls RBRACE IDENTIFIER SEMICOLON  */
#line 273 "frontend/Parser.y"
                                { (yyval.typedefDecl) = new AST::TypedefDecl(
                                      new AST::UnionType((yyvsp[-3].fieldDecls), *(yyvsp[-5].idVal)), *(yyvsp[-1].idVal)); }
#line 2526 "generated/Parser.cpp"
    break;

  case 12: /* FuncDecl: STATIC VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES SEMICOLON  */
#line 278 "frontend/Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList));
                                  (yyval.funcDecl)->isStatic_ = true;
                                  (yyval.funcDecl)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 2534 "generated/Parser.cpp"
    break;

  case 13: /* FuncDecl: STATIC VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES FuncBody  */
#line 282 "frontend/Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList), (yyvsp[0].funcBody));
                                  (yyval.funcDecl)->isStatic_ = true;
                                  (yyval.funcDecl)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 2542 "generated/Parser.cpp"
    break;

  case 14: /* FuncDecl: VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES SEMICOLON  */
#line 286 "frontend/Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList));
                                  (yyval.funcDecl)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 2549 "generated/Parser.cpp"
    break;

  case 15: /* FuncDecl: VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES FuncBody  */
#line 289 "frontend/Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList), (yyvsp[0].funcBody));
                                  (yyval.funcDecl)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 2556 "generated/Parser.cpp"
    break;

  case 16: /* FuncBody: LBRACE Stmts RBRACE  */
#line 293 "frontend/Parser.y"
                                { (yyval.funcBody) = new AST::FuncBody((yyvsp[-1].stmts)); }
#line 2562 "generated/Parser.cpp"
    break;

  case 17: /* VarDecl: STATIC VarType VarList SEMICOLON  */
#line 297 "frontend/Parser.y"
                                { (yyval.varDecl) = new AST::VarDecl((yyvsp[-2].varType), (yyvsp[-1].varList)); (yyval.varDecl)->isStatic_ = true;
                                  (yyval.varDecl)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 2569 "generated/Parser.cpp"
    break;

  case 18: /* VarDecl: VarType VarList SEMICOLON  */
#line 300 "frontend/Parser.y"
                                { (yyval.varDecl) = new AST::VarDecl((yyvsp[-2].varType), (yyvsp[-1].varList));
                                  (yyval.varDecl)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 2576 "generated/Parser.cpp"
    break;

  case 19: /* VarDecl: VarType LPARENTHESES ASTERISK IDENTIFIER RPARENTHESES LPARENTHESES ParamList RPARENTHESES SEMICOLON  */
#line 309 "frontend/Parser.y"
                                { AST::VarList* funcPtrList = new AST::VarList();
                                  funcPtrList->push_back(new AST::VarInit(*(yyvsp[-5].idVal), {}));
                                  (yyval.varDecl) = new AST::VarDecl(
                                      new AST::FuncPointerType((yyvsp[-8].varType), (yyvsp[-2].paramList)), funcPtrList);
                                  (yyval.varDecl)->setLoc((yylsp[-8]).first_line, (yylsp[-8]).first_column); }
#line 2586 "generated/Parser.cpp"
    break;

  case 20: /* TypeDecl: _VarType SEMICOLON  */
#line 316 "frontend/Parser.y"
                                { (yyval.typeDecl) = new AST::TypeDecl((yyvsp[-1].varType)); }
#line 2592 "generated/Parser.cpp"
    break;

  case 21: /* VarType: _VarType  */
#line 321 "frontend/Parser.y"
                                { (yyval.varType) = (yyvsp[0].varType); }
#line 2598 "generated/Parser.cpp"
    break;

  case 22: /* VarType: CONST _VarType  */
#line 322 "frontend/Parser.y"
                                { (yyval.varType) = (yyvsp[0].varType); (yyval.varType)->setConst(); }
#line 2604 "generated/Parser.cpp"
    break;

  case 23: /* _VarType: BuiltinType  */
#line 325 "frontend/Parser.y"
                                { (yyval.varType) = (yyvsp[0].builtinType); }
#line 2610 "generated/Parser.cpp"
    break;

  case 24: /* _VarType: STRUCT IDENTIFIER LBRACE FieldDecls RBRACE  */
#line 327 "frontend/Parser.y"
                                { (yyval.varType) = new AST::StructType((yyvsp[-1].fieldDecls), *(yyvsp[-3].idVal)); }
#line 2616 "generated/Parser.cpp"
    break;

  case 25: /* _VarType: STRUCT IDENTIFIER  */
#line 328 "frontend/Parser.y"
                                { (yyval.varType) = new AST::DefinedType(*(yyvsp[0].idVal)); }
#line 2622 "generated/Parser.cpp"
    break;

  case 26: /* _VarType: UNION IDENTIFIER LBRACE FieldDecls RBRACE  */
#line 330 "frontend/Parser.y"
                                { (yyval.varType) = new AST::UnionType((yyvsp[-1].fieldDecls), *(yyvsp[-3].idVal)); }
#line 2628 "generated/Parser.cpp"
    break;

  case 27: /* _VarType: UNION IDENTIFIER  */
#line 331 "frontend/Parser.y"
                                { (yyval.varType) = new AST::DefinedType(*(yyvsp[0].idVal)); }
#line 2634 "generated/Parser.cpp"
    break;

  case 28: /* _VarType: ENUM IDENTIFIER LBRACE EnumList RBRACE  */
#line 333 "frontend/Parser.y"
                                { (yyval.varType) = new AST::EnumType((yyvsp[-1].enumList), *(yyvsp[-3].idVal)); }
#line 2640 "generated/Parser.cpp"
    break;

  case 29: /* _VarType: ENUM IDENTIFIER  */
#line 334 "frontend/Parser.y"
                                { (yyval.varType) = new AST::DefinedType(*(yyvsp[0].idVal)); }
#line 2646 "generated/Parser.cpp"
    break;

  case 30: /* _VarType: _VarType ASTERISK  */
#line 335 "frontend/Parser.y"
                                { (yyval.varType) = new AST::PointerType((yyvsp[-1].varType)); }
#line 2652 "generated/Parser.cpp"
    break;

  case 31: /* _VarType: IDENTIFIER  */
#line 336 "frontend/Parser.y"
                                { (yyval.varType) = new AST::DefinedType(*(yyvsp[0].idVal)); }
#line 2658 "generated/Parser.cpp"
    break;

  case 32: /* VarList: VarList COMMA VarInit  */
#line 343 "frontend/Parser.y"
                                { (yyval.varList) = (yyvsp[-2].varList); (yyval.varList)->push_back((yyvsp[0].varInit)); }
#line 2664 "generated/Parser.cpp"
    break;

  case 33: /* VarList: VarInit  */
#line 344 "frontend/Parser.y"
                                { (yyval.varList) = new AST::VarList(); (yyval.varList)->push_back((yyvsp[0].varInit)); }
#line 2670 "generated/Parser.cpp"
    break;

  case 34: /* VarList: %empty  */
#line 345 "frontend/Parser.y"
                                { (yyval.varList) = new AST::VarList(); }
#line 2676 "generated/Parser.cpp"
    break;

  case 35: /* VarInit: IDENTIFIER ArrayBoundList  */
#line 351 "frontend/Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-1].idVal), *(yyvsp[0].arrayBoundList)); delete (yyvsp[0].arrayBoundList); }
#line 2682 "generated/Parser.cpp"
    break;

  case 36: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN Expr  */
#line 353 "frontend/Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-3].idVal), *(yyvsp[-2].arrayBoundList), (yyvsp[0].expr)); delete (yyvsp[-2].arrayBoundList); }
#line 2688 "generated/Parser.cpp"
    break;

  case 37: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN LBRACE InitList RBRACE  */
#line 355 "frontend/Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-5].idVal), *(yyvsp[-4].arrayBoundList), nullptr, (yyvsp[-1].initList));
                                  delete (yyvsp[-4].arrayBoundList); }
#line 2695 "generated/Parser.cpp"
    break;

  case 38: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN LBRACE RBRACE  */
#line 358 "frontend/Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-4].idVal), *(yyvsp[-3].arrayBoundList), nullptr,
                                                        new AST::InitList());
                                  delete (yyvsp[-3].arrayBoundList); }
#line 2703 "generated/Parser.cpp"
    break;

  case 39: /* InitList: InitList COMMA InitItem  */
#line 366 "frontend/Parser.y"
                                { (yyval.initList) = (yyvsp[-2].initList); (yyval.initList)->push_back((yyvsp[0].initElement)); }
#line 2709 "generated/Parser.cpp"
    break;

  case 40: /* InitList: InitItem  */
#line 368 "frontend/Parser.y"
                                { (yyval.initList) = new AST::InitList(); (yyval.initList)->push_back((yyvsp[0].initElement)); }
#line 2715 "generated/Parser.cpp"
    break;

  case 41: /* InitItem: Expr  */
#line 373 "frontend/Parser.y"
                                { (yyval.initElement) = new AST::InitElement((yyvsp[0].expr)); }
#line 2721 "generated/Parser.cpp"
    break;

  case 42: /* InitItem: LBRACE InitList RBRACE  */
#line 375 "frontend/Parser.y"
                                { (yyval.initElement) = new AST::InitElement((yyvsp[-1].initList)); }
#line 2727 "generated/Parser.cpp"
    break;

  case 43: /* ArrayBoundList: ArrayBoundList ArrayBound  */
#line 383 "frontend/Parser.y"
                                { (yyval.arrayBoundList) = (yyvsp[-1].arrayBoundList); (yyval.arrayBoundList)->push_back((yyvsp[0].sizeVal)); }
#line 2733 "generated/Parser.cpp"
    break;

  case 44: /* ArrayBoundList: ArrayBound  */
#line 385 "frontend/Parser.y"
                                { (yyval.arrayBoundList) = new std::vector<size_t>(); (yyval.arrayBoundList)->push_back((yyvsp[0].sizeVal)); }
#line 2739 "generated/Parser.cpp"
    break;

  case 45: /* ArrayBoundList: %empty  */
#line 386 "frontend/Parser.y"
                                { (yyval.arrayBoundList) = new std::vector<size_t>(); }
#line 2745 "generated/Parser.cpp"
    break;

  case 46: /* ArrayBound: LBRACKET INTEGER RBRACKET  */
#line 390 "frontend/Parser.y"
                                { (yyval.sizeVal) = static_cast<size_t>((yyvsp[-1].intVal)); }
#line 2751 "generated/Parser.cpp"
    break;

  case 47: /* ArrayBound: LBRACKET RBRACKET  */
#line 392 "frontend/Parser.y"
                                { (yyval.sizeVal) = AST::kInferredArrayBound; }
#line 2757 "generated/Parser.cpp"
    break;

  case 48: /* ParamList: ParamList COMMA Param  */
#line 398 "frontend/Parser.y"
                                { (yyval.paramList) = (yyvsp[-2].paramList); (yyval.paramList)->push_back((yyvsp[0].param)); }
#line 2763 "generated/Parser.cpp"
    break;

  case 49: /* ParamList: ParamList COMMA ELLIPSES  */
#line 400 "frontend/Parser.y"
                                { (yyval.paramList) = (yyvsp[-2].paramList); (yyval.paramList)->setVariant(); }
#line 2769 "generated/Parser.cpp"
    break;

  case 50: /* ParamList: Param  */
#line 401 "frontend/Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); (yyval.paramList)->push_back((yyvsp[0].param)); }
#line 2775 "generated/Parser.cpp"
    break;

  case 51: /* ParamList: ELLIPSES  */
#line 402 "frontend/Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); (yyval.paramList)->setVariant(); }
#line 2781 "generated/Parser.cpp"
    break;

  case 52: /* ParamList: %empty  */
#line 403 "frontend/Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); }
#line 2787 "generated/Parser.cpp"
    break;

  case 53: /* Param: VarType IDENTIFIER  */
#line 406 "frontend/Parser.y"
                                { (yyval.param) = new AST::Param((yyvsp[-1].varType), *(yyvsp[0].idVal)); }
#line 2793 "generated/Parser.cpp"
    break;

  case 54: /* Param: VarType  */
#line 407 "frontend/Parser.y"
                                { (yyval.param) = new AST::Param((yyvsp[0].varType)); }
#line 2799 "generated/Parser.cpp"
    break;

  case 55: /* Param: VarType LPARENTHESES ASTERISK IDENTIFIER RPARENTHESES LPARENTHESES ParamList RPARENTHESES  */
#line 412 "frontend/Parser.y"
                                { (yyval.param) = new AST::Param(
                                      new AST::FuncPointerType((yyvsp[-7].varType), (yyvsp[-1].paramList)), *(yyvsp[-4].idVal)); }
#line 2806 "generated/Parser.cpp"
    break;

  case 56: /* BuiltinType: CHAR  */
#line 417 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::CHAR, "char"); }
#line 2812 "generated/Parser.cpp"
    break;

  case 57: /* BuiltinType: SHORT  */
#line 418 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::SHORT, "short"); }
#line 2818 "generated/Parser.cpp"
    break;

  case 58: /* BuiltinType: INT  */
#line 419 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::INT, "int"); }
#line 2824 "generated/Parser.cpp"
    break;

  case 59: /* BuiltinType: LONG  */
#line 420 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::LONG, "long"); }
#line 2830 "generated/Parser.cpp"
    break;

  case 60: /* BuiltinType: UNSIGNED  */
#line 421 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::UINT, "uint"); }
#line 2836 "generated/Parser.cpp"
    break;

  case 61: /* BuiltinType: UNSIGNED CHAR  */
#line 422 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::UCHAR, "uchar"); }
#line 2842 "generated/Parser.cpp"
    break;

  case 62: /* BuiltinType: UNSIGNED SHORT  */
#line 423 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::USHORT, "ushort"); }
#line 2848 "generated/Parser.cpp"
    break;

  case 63: /* BuiltinType: UNSIGNED INT  */
#line 424 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::UINT, "uint"); }
#line 2854 "generated/Parser.cpp"
    break;

  case 64: /* BuiltinType: UNSIGNED LONG  */
#line 425 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::ULONG, "ulong"); }
#line 2860 "generated/Parser.cpp"
    break;

  case 65: /* BuiltinType: FLOAT  */
#line 426 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::FLOAT, "float"); }
#line 2866 "generated/Parser.cpp"
    break;

  case 66: /* BuiltinType: DOUBLE  */
#line 427 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::DOUBLE, "double"); }
#line 2872 "generated/Parser.cpp"
    break;

  case 67: /* BuiltinType: BOOL  */
#line 428 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::BOOL, "bool"); }
#line 2878 "generated/Parser.cpp"
    break;

  case 68: /* BuiltinType: VOID  */
#line 429 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::VOID, "void"); }
#line 2884 "generated/Parser.cpp"
    break;

  case 69: /* FieldDecls: FieldDecls FieldDecl  */
#line 435 "frontend/Parser.y"
                                { (yyval.fieldDecls) = (yyvsp[-1].fieldDecls); if ((yyvsp[0].fieldDecl) != nullptr) (yyval.fieldDecls)->push_back((yyvsp[0].fieldDecl)); }
#line 2890 "generated/Parser.cpp"
    break;

  case 70: /* FieldDecls: %empty  */
#line 436 "frontend/Parser.y"
                                { (yyval.fieldDecls) = new AST::FieldDecls(); }
#line 2896 "generated/Parser.cpp"
    break;

  case 71: /* FieldDecl: VarType MemberList SEMICOLON  */
#line 440 "frontend/Parser.y"
                                { (yyval.fieldDecl) = new AST::FieldDecl((yyvsp[-2].varType), (yyvsp[-1].memberList)); }
#line 2902 "generated/Parser.cpp"
    break;

  case 72: /* FieldDecl: SEMICOLON  */
#line 441 "frontend/Parser.y"
                                { (yyval.fieldDecl) = nullptr; }
#line 2908 "generated/Parser.cpp"
    break;

  case 73: /* MemberList: MemberList COMMA IDENTIFIER  */
#line 447 "frontend/Parser.y"
                                { (yyval.memberList) = (yyvsp[-2].memberList); (yyval.memberList)->push_back(*(yyvsp[0].idVal)); }
#line 2914 "generated/Parser.cpp"
    break;

  case 74: /* MemberList: IDENTIFIER  */
#line 448 "frontend/Parser.y"
                                { (yyval.memberList) = new AST::MemberList(); (yyval.memberList)->push_back(*(yyvsp[0].idVal)); }
#line 2920 "generated/Parser.cpp"
    break;

  case 75: /* MemberList: %empty  */
#line 449 "frontend/Parser.y"
                                { (yyval.memberList) = new AST::MemberList(); }
#line 2926 "generated/Parser.cpp"
    break;

  case 76: /* EnumList: EnumList COMMA Enum  */
#line 455 "frontend/Parser.y"
                                { (yyval.enumList) = (yyvsp[-2].enumList); (yyval.enumList)->push_back((yyvsp[0].enumeration)); }
#line 2932 "generated/Parser.cpp"
    break;

  case 77: /* EnumList: Enum  */
#line 456 "frontend/Parser.y"
                                { (yyval.enumList) = new AST::EnumList(); (yyval.enumList)->push_back((yyvsp[0].enumeration)); }
#line 2938 "generated/Parser.cpp"
    break;

  case 78: /* EnumList: %empty  */
#line 457 "frontend/Parser.y"
                                { (yyval.enumList) = new AST::EnumList(); }
#line 2944 "generated/Parser.cpp"
    break;

  case 79: /* Enum: IDENTIFIER  */
#line 460 "frontend/Parser.y"
                                { (yyval.enumeration) = new AST::Enum(*(yyvsp[0].idVal)); }
#line 2950 "generated/Parser.cpp"
    break;

  case 80: /* Enum: IDENTIFIER ASSIGN INTEGER  */
#line 462 "frontend/Parser.y"
                                { (yyval.enumeration) = new AST::Enum(*(yyvsp[-2].idVal), true, (yyvsp[0].intVal)); }
#line 2956 "generated/Parser.cpp"
    break;

  case 81: /* Enum: IDENTIFIER ASSIGN SUB INTEGER  */
#line 466 "frontend/Parser.y"
                                { (yyval.enumeration) = new AST::Enum(*(yyvsp[-3].idVal), true, -(yyvsp[0].intVal)); }
#line 2962 "generated/Parser.cpp"
    break;

  case 82: /* Stmts: Stmts Stmt  */
#line 475 "frontend/Parser.y"
                                { (yyval.stmts) = (yyvsp[-1].stmts); if ((yyvsp[0].stmt) != nullptr) (yyval.stmts)->push_back((yyvsp[0].stmt)); }
#line 2968 "generated/Parser.cpp"
    break;

  case 83: /* Stmts: %empty  */
#line 476 "frontend/Parser.y"
                                { (yyval.stmts) = new AST::Stmts(); }
#line 2974 "generated/Parser.cpp"
    break;

  case 84: /* Stmt: Expr SEMICOLON  */
#line 479 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[-1].expr); (yyval.stmt)->setLoc((yylsp[-1]).first_line, (yylsp[-1]).first_column); }
#line 2980 "generated/Parser.cpp"
    break;

  case 85: /* Stmt: IfStmt  */
#line 480 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].ifStmt); }
#line 2986 "generated/Parser.cpp"
    break;

  case 86: /* Stmt: SwitchStmt  */
#line 481 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].switchStmt); }
#line 2992 "generated/Parser.cpp"
    break;

  case 87: /* Stmt: ForStmt  */
#line 482 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].forStmt); }
#line 2998 "generated/Parser.cpp"
    break;

  case 88: /* Stmt: DoStmt  */
#line 483 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].doStmt); }
#line 3004 "generated/Parser.cpp"
    break;

  case 89: /* Stmt: WhileStmt  */
#line 484 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].whileStmt); }
#line 3010 "generated/Parser.cpp"
    break;

  case 90: /* Stmt: ContinueStmt  */
#line 485 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].continueStmt); }
#line 3016 "generated/Parser.cpp"
    break;

  case 91: /* Stmt: BreakStmt  */
#line 486 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].breakStmt); }
#line 3022 "generated/Parser.cpp"
    break;

  case 92: /* Stmt: ReturnStmt  */
#line 487 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].returnStmt); }
#line 3028 "generated/Parser.cpp"
    break;

  case 93: /* Stmt: Block  */
#line 488 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].block); }
#line 3034 "generated/Parser.cpp"
    break;

  case 94: /* Stmt: TypeDecl  */
#line 489 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].typeDecl); }
#line 3040 "generated/Parser.cpp"
    break;

  case 95: /* Stmt: TypedefDecl  */
#line 490 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].typedefDecl); }
#line 3046 "generated/Parser.cpp"
    break;

  case 96: /* Stmt: VarDecl  */
#line 491 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].varDecl); }
#line 3052 "generated/Parser.cpp"
    break;

  case 97: /* Stmt: SEMICOLON  */
#line 492 "frontend/Parser.y"
                                { (yyval.stmt) = nullptr; }
#line 3058 "generated/Parser.cpp"
    break;

  case 98: /* IfStmt: IF LPARENTHESES Expr RPARENTHESES Stmt ELSE Stmt  */
#line 496 "frontend/Parser.y"
                                { (yyval.ifStmt) = new AST::IfStmt((yyvsp[-4].expr), (yyvsp[-2].stmt), (yyvsp[0].stmt));
                                  (yyval.ifStmt)->setLoc((yylsp[-6]).first_line, (yylsp[-6]).first_column); }
#line 3065 "generated/Parser.cpp"
    break;

  case 99: /* IfStmt: IF LPARENTHESES Expr RPARENTHESES Stmt  */
#line 499 "frontend/Parser.y"
                                { (yyval.ifStmt) = new AST::IfStmt((yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.ifStmt)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 3072 "generated/Parser.cpp"
    break;

  case 100: /* SwitchStmt: SWITCH LPARENTHESES Expr RPARENTHESES LBRACE CaseStmtList RBRACE  */
#line 506 "frontend/Parser.y"
                                { (yyval.switchStmt) = new AST::SwitchStmt((yyvsp[-4].expr), (yyvsp[-1].caseStmtList));
                                  (yyval.switchStmt)->setLoc((yylsp[-6]).first_line, (yylsp[-6]).first_column); }
#line 3079 "generated/Parser.cpp"
    break;

  case 101: /* CaseStmtList: CaseStmtList CaseStmt  */
#line 512 "frontend/Parser.y"
                                { (yyval.caseStmtList) = (yyvsp[-1].caseStmtList); (yyval.caseStmtList)->push_back((yyvsp[0].caseStmt)); }
#line 3085 "generated/Parser.cpp"
    break;

  case 102: /* CaseStmtList: %empty  */
#line 513 "frontend/Parser.y"
                                { (yyval.caseStmtList) = new AST::CaseStmtList(); }
#line 3091 "generated/Parser.cpp"
    break;

  case 103: /* CaseStmt: CASE Expr COLON Stmts  */
#line 517 "frontend/Parser.y"
                                { (yyval.caseStmt) = new AST::CaseStmt((yyvsp[-2].expr), (yyvsp[0].stmts));
                                  (yyval.caseStmt)->setLoc((yylsp[-3]).first_line, (yylsp[-3]).first_column); }
#line 3098 "generated/Parser.cpp"
    break;

  case 104: /* CaseStmt: DEFAULT COLON Stmts  */
#line 520 "frontend/Parser.y"
                                { (yyval.caseStmt) = new AST::CaseStmt(nullptr, (yyvsp[0].stmts));
                                  (yyval.caseStmt)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 3105 "generated/Parser.cpp"
    break;

  case 105: /* ForStmt: FOR LPARENTHESES Expr SEMICOLON Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 525 "frontend/Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt((yyvsp[-6].expr), (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.forStmt)->setLoc((yylsp[-8]).first_line, (yylsp[-8]).first_column); }
#line 3112 "generated/Parser.cpp"
    break;

  case 106: /* ForStmt: FOR LPARENTHESES SEMICOLON Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 528 "frontend/Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt(nullptr, (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.forStmt)->setLoc((yylsp[-7]).first_line, (yylsp[-7]).first_column); }
#line 3119 "generated/Parser.cpp"
    break;

  case 107: /* ForStmt: FOR LPARENTHESES VarDecl Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 531 "frontend/Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt((yyvsp[-5].varDecl), (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.forStmt)->setLoc((yylsp[-7]).first_line, (yylsp[-7]).first_column); }
#line 3126 "generated/Parser.cpp"
    break;

  case 108: /* DoStmt: DO Stmt WHILE LPARENTHESES Expr RPARENTHESES SEMICOLON  */
#line 536 "frontend/Parser.y"
                                { (yyval.doStmt) = new AST::DoStmt((yyvsp[-5].stmt), (yyvsp[-2].expr));
                                  (yyval.doStmt)->setLoc((yylsp[-6]).first_line, (yylsp[-6]).first_column); }
#line 3133 "generated/Parser.cpp"
    break;

  case 109: /* WhileStmt: WHILE LPARENTHESES Expr RPARENTHESES Stmt  */
#line 541 "frontend/Parser.y"
                                { (yyval.whileStmt) = new AST::WhileStmt((yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.whileStmt)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 3140 "generated/Parser.cpp"
    break;

  case 110: /* ContinueStmt: CONTINUE SEMICOLON  */
#line 546 "frontend/Parser.y"
                                { (yyval.continueStmt) = new AST::ContinueStmt();
                                  (yyval.continueStmt)->setLoc((yylsp[-1]).first_line, (yylsp[-1]).first_column); }
#line 3147 "generated/Parser.cpp"
    break;

  case 111: /* BreakStmt: BREAK SEMICOLON  */
#line 550 "frontend/Parser.y"
                                { (yyval.breakStmt) = new AST::BreakStmt();
                                  (yyval.breakStmt)->setLoc((yylsp[-1]).first_line, (yylsp[-1]).first_column); }
#line 3154 "generated/Parser.cpp"
    break;

  case 112: /* ReturnStmt: RETURN SEMICOLON  */
#line 554 "frontend/Parser.y"
                                { (yyval.returnStmt) = new AST::ReturnStmt();
                                  (yyval.returnStmt)->setLoc((yylsp[-1]).first_line, (yylsp[-1]).first_column); }
#line 3161 "generated/Parser.cpp"
    break;

  case 113: /* ReturnStmt: RETURN Expr SEMICOLON  */
#line 557 "frontend/Parser.y"
                                { (yyval.returnStmt) = new AST::ReturnStmt((yyvsp[-1].expr));
                                  (yyval.returnStmt)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 3168 "generated/Parser.cpp"
    break;

  case 114: /* Block: LBRACE Stmts RBRACE  */
#line 561 "frontend/Parser.y"
                                { (yyval.block) = new AST::Block((yyvsp[-1].stmts));
                                  (yyval.block)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 3175 "generated/Parser.cpp"
    break;

  case 115: /* Expr: IDENTIFIER  */
#line 576 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Variable(*(yyvsp[0].idVal)); }
#line 3181 "generated/Parser.cpp"
    break;

  case 116: /* Expr: Constant  */
#line 577 "frontend/Parser.y"
                                { (yyval.expr) = (yyvsp[0].constant); }
#line 3187 "generated/Parser.cpp"
    break;

  case 117: /* Expr: LPARENTHESES Expr RPARENTHESES  */
#line 579 "frontend/Parser.y"
                                { (yyval.expr) = (yyvsp[-1].expr); }
#line 3193 "generated/Parser.cpp"
    break;

  case 118: /* Expr: Expr COMMA Expr  */
#line 580 "frontend/Parser.y"
                                { (yyval.expr) = new AST::CommaExpr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3199 "generated/Parser.cpp"
    break;

  case 119: /* Expr: IDENTIFIER LPARENTHESES ExprList RPARENTHESES  */
#line 582 "frontend/Parser.y"
                                { (yyval.expr) = new AST::FuncCall(*(yyvsp[-3].idVal), (yyvsp[-1].exprList)); }
#line 3205 "generated/Parser.cpp"
    break;

  case 120: /* Expr: Expr DOT IDENTIFIER  */
#line 584 "frontend/Parser.y"
                                { (yyval.expr) = new AST::StructRef((yyvsp[-2].expr), *(yyvsp[0].idVal)); }
#line 3211 "generated/Parser.cpp"
    break;

  case 121: /* Expr: Expr ARROW IDENTIFIER  */
#line 586 "frontend/Parser.y"
                                { (yyval.expr) = new AST::StructDeref((yyvsp[-2].expr), *(yyvsp[0].idVal)); }
#line 3217 "generated/Parser.cpp"
    break;

  case 122: /* Expr: Expr LBRACKET Expr RBRACKET  */
#line 588 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Subscript((yyvsp[-3].expr), (yyvsp[-1].expr)); }
#line 3223 "generated/Parser.cpp"
    break;

  case 123: /* Expr: LPARENTHESES VarType RPARENTHESES Expr  */
#line 590 "frontend/Parser.y"
                                { (yyval.expr) = new AST::TypeCast((yyvsp[-2].varType), (yyvsp[0].expr)); }
#line 3229 "generated/Parser.cpp"
    break;

  case 124: /* Expr: LPARENTHESES IDENTIFIER RPARENTHESES  */
#line 606 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Variable(*(yyvsp[-1].idVal)); }
#line 3235 "generated/Parser.cpp"
    break;

  case 125: /* Expr: LPARENTHESES IDENTIFIER RPARENTHESES Expr  */
#line 608 "frontend/Parser.y"
                                { (yyval.expr) = new AST::TypeCast(new AST::DefinedType(*(yyvsp[-2].idVal)), (yyvsp[0].expr)); }
#line 3241 "generated/Parser.cpp"
    break;

  case 126: /* Expr: SIZEOF LPARENTHESES VarType RPARENTHESES  */
#line 610 "frontend/Parser.y"
                                { (yyval.expr) = new AST::SizeOf((yyvsp[-1].varType)); }
#line 3247 "generated/Parser.cpp"
    break;

  case 127: /* Expr: SIZEOF LPARENTHESES Expr RPARENTHESES  */
#line 612 "frontend/Parser.y"
                                { (yyval.expr) = new AST::SizeOf((yyvsp[-1].expr)); }
#line 3253 "generated/Parser.cpp"
    break;

  case 128: /* Expr: SIZEOF LPARENTHESES IDENTIFIER RPARENTHESES  */
#line 614 "frontend/Parser.y"
                                { (yyval.expr) = new AST::SizeOf(*(yyvsp[-1].idVal)); }
#line 3259 "generated/Parser.cpp"
    break;

  case 129: /* Expr: ADD Expr  */
#line 616 "frontend/Parser.y"
                                { (yyval.expr) = new AST::UnaryPlus((yyvsp[0].expr)); }
#line 3265 "generated/Parser.cpp"
    break;

  case 130: /* Expr: SUB Expr  */
#line 618 "frontend/Parser.y"
                                { (yyval.expr) = new AST::UnaryMinus((yyvsp[0].expr)); }
#line 3271 "generated/Parser.cpp"
    break;

  case 131: /* Expr: ASTERISK Expr  */
#line 620 "frontend/Parser.y"
                                { (yyval.expr) = new AST::PointerDeref((yyvsp[0].expr)); }
#line 3277 "generated/Parser.cpp"
    break;

  case 132: /* Expr: AMPERSAND Expr  */
#line 622 "frontend/Parser.y"
                                { (yyval.expr) = new AST::AddressOf((yyvsp[0].expr)); }
#line 3283 "generated/Parser.cpp"
    break;

  case 133: /* Expr: Expr ASSIGN Expr  */
#line 623 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Assign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3289 "generated/Parser.cpp"
    break;

  case 134: /* Expr: Expr ADD Expr  */
#line 625 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Add((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3295 "generated/Parser.cpp"
    break;

  case 135: /* Expr: Expr SUB Expr  */
#line 627 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Sub((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3301 "generated/Parser.cpp"
    break;

  case 136: /* Expr: Expr ASTERISK Expr  */
#line 629 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Mul((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3307 "generated/Parser.cpp"
    break;

  case 137: /* Expr: Expr DIV Expr  */
#line 630 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Div((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3313 "generated/Parser.cpp"
    break;

  case 138: /* Expr: Expr MOD Expr  */
#line 631 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Mod((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3319 "generated/Parser.cpp"
    break;

  case 139: /* Expr: Expr DADD  */
#line 633 "frontend/Parser.y"
                                { (yyval.expr) = new AST::PostfixInc((yyvsp[-1].expr)); }
#line 3325 "generated/Parser.cpp"
    break;

  case 140: /* Expr: Expr DSUB  */
#line 635 "frontend/Parser.y"
                                { (yyval.expr) = new AST::PostfixDec((yyvsp[-1].expr)); }
#line 3331 "generated/Parser.cpp"
    break;

  case 141: /* Expr: DADD Expr  */
#line 637 "frontend/Parser.y"
                                { (yyval.expr) = new AST::PrefixInc((yyvsp[0].expr)); }
#line 3337 "generated/Parser.cpp"
    break;

  case 142: /* Expr: DSUB Expr  */
#line 639 "frontend/Parser.y"
                                { (yyval.expr) = new AST::PrefixDec((yyvsp[0].expr)); }
#line 3343 "generated/Parser.cpp"
    break;

  case 143: /* Expr: Expr ADDEQ Expr  */
#line 640 "frontend/Parser.y"
                                { (yyval.expr) = new AST::AddAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3349 "generated/Parser.cpp"
    break;

  case 144: /* Expr: Expr SUBEQ Expr  */
#line 641 "frontend/Parser.y"
                                { (yyval.expr) = new AST::SubAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3355 "generated/Parser.cpp"
    break;

  case 145: /* Expr: Expr MULEQ Expr  */
#line 642 "frontend/Parser.y"
                                { (yyval.expr) = new AST::MulAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3361 "generated/Parser.cpp"
    break;

  case 146: /* Expr: Expr DIVEQ Expr  */
#line 643 "frontend/Parser.y"
                                { (yyval.expr) = new AST::DivAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3367 "generated/Parser.cpp"
    break;

  case 147: /* Expr: Expr MODEQ Expr  */
#line 644 "frontend/Parser.y"
                                { (yyval.expr) = new AST::ModAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3373 "generated/Parser.cpp"
    break;

  case 148: /* Expr: Expr AMPERSAND Expr  */
#line 646 "frontend/Parser.y"
                                { (yyval.expr) = new AST::BitwiseAnd((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3379 "generated/Parser.cpp"
    break;

  case 149: /* Expr: Expr BOR Expr  */
#line 647 "frontend/Parser.y"
                                { (yyval.expr) = new AST::BitwiseOr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3385 "generated/Parser.cpp"
    break;

  case 150: /* Expr: Expr BXOR Expr  */
#line 648 "frontend/Parser.y"
                                { (yyval.expr) = new AST::BitwiseXor((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3391 "generated/Parser.cpp"
    break;

  case 151: /* Expr: BNOT Expr  */
#line 649 "frontend/Parser.y"
                                { (yyval.expr) = new AST::BitwiseNot((yyvsp[0].expr)); }
#line 3397 "generated/Parser.cpp"
    break;

  case 152: /* Expr: Expr BANDEQ Expr  */
#line 650 "frontend/Parser.y"
                                { (yyval.expr) = new AST::BitwiseAndAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3403 "generated/Parser.cpp"
    break;

  case 153: /* Expr: Expr BOREQ Expr  */
#line 651 "frontend/Parser.y"
                                { (yyval.expr) = new AST::BitwiseOrAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3409 "generated/Parser.cpp"
    break;

  case 154: /* Expr: Expr BXOREQ Expr  */
#line 652 "frontend/Parser.y"
                                { (yyval.expr) = new AST::BitwiseXorAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3415 "generated/Parser.cpp"
    break;

  case 155: /* Expr: Expr SHL Expr  */
#line 653 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LeftShift((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3421 "generated/Parser.cpp"
    break;

  case 156: /* Expr: Expr SHR Expr  */
#line 654 "frontend/Parser.y"
                                { (yyval.expr) = new AST::RightShift((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3427 "generated/Parser.cpp"
    break;

  case 157: /* Expr: Expr SHLEQ Expr  */
#line 655 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LeftShiftAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3433 "generated/Parser.cpp"
    break;

  case 158: /* Expr: Expr SHREQ Expr  */
#line 656 "frontend/Parser.y"
                                { (yyval.expr) = new AST::RightShiftAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3439 "generated/Parser.cpp"
    break;

  case 159: /* Expr: Expr AND Expr  */
#line 657 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicAnd((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3445 "generated/Parser.cpp"
    break;

  case 160: /* Expr: Expr OR Expr  */
#line 658 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicOr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3451 "generated/Parser.cpp"
    break;

  case 161: /* Expr: NOT Expr  */
#line 659 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicNot((yyvsp[0].expr)); }
#line 3457 "generated/Parser.cpp"
    break;

  case 162: /* Expr: Expr EQ Expr  */
#line 660 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3463 "generated/Parser.cpp"
    break;

  case 163: /* Expr: Expr NEQ Expr  */
#line 661 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicNotEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3469 "generated/Parser.cpp"
    break;

  case 164: /* Expr: Expr LT Expr  */
#line 662 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicLessThan((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3475 "generated/Parser.cpp"
    break;

  case 165: /* Expr: Expr LE Expr  */
#line 663 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicLessEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3481 "generated/Parser.cpp"
    break;

  case 166: /* Expr: Expr GT Expr  */
#line 664 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicGreaterThan((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3487 "generated/Parser.cpp"
    break;

  case 167: /* Expr: Expr GE Expr  */
#line 665 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicGreaterEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3493 "generated/Parser.cpp"
    break;

  case 168: /* Expr: Expr QUESTION Expr COLON Expr  */
#line 667 "frontend/Parser.y"
                                { (yyval.expr) = new AST::TernaryCondition((yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3499 "generated/Parser.cpp"
    break;

  case 169: /* ExprList: ExprList COMMA Expr  */
#line 671 "frontend/Parser.y"
                                { (yyval.exprList) = (yyvsp[-2].exprList); (yyval.exprList)->push_back((yyvsp[0].expr)); }
#line 3505 "generated/Parser.cpp"
    break;

  case 170: /* ExprList: Expr  */
#line 672 "frontend/Parser.y"
                                { (yyval.exprList) = new AST::ExprList(); (yyval.exprList)->push_back((yyvsp[0].expr)); }
#line 3511 "generated/Parser.cpp"
    break;

  case 171: /* ExprList: %empty  */
#line 673 "frontend/Parser.y"
                                { (yyval.exprList) = new AST::ExprList(); }
#line 3517 "generated/Parser.cpp"
    break;

  case 172: /* Constant: CHARACTER  */
#line 676 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].charVal)); }
#line 3523 "generated/Parser.cpp"
    break;

  case 173: /* Constant: INTEGER  */
#line 677 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].intVal)); }
#line 3529 "generated/Parser.cpp"
    break;

  case 174: /* Constant: UINTEGER  */
#line 678 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].uintVal)); }
#line 3535 "generated/Parser.cpp"
    break;

  case 175: /* Constant: LONGVAL  */
#line 679 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].longVal)); }
#line 3541 "generated/Parser.cpp"
    break;

  case 176: /* Constant: ULONGVAL  */
#line 680 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].ulongVal)); }
#line 3547 "generated/Parser.cpp"
    break;

  case 177: /* Constant: FLOATVAL  */
#line 681 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].floatVal)); }
#line 3553 "generated/Parser.cpp"
    break;

  case 178: /* Constant: DOUBLEVAL  */
#line 682 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].doubleVal)); }
#line 3559 "generated/Parser.cpp"
    break;

  case 179: /* Constant: STRING  */
#line 683 "frontend/Parser.y"
                                { (yyval.constant) = new AST::ConstStr(*(yyvsp[0].strVal)); }
#line 3565 "generated/Parser.cpp"
    break;

  case 180: /* Constant: TRUE  */
#line 684 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant(true); }
#line 3571 "generated/Parser.cpp"
    break;

  case 181: /* Constant: FALSE  */
#line 685 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant(false); }
#line 3577 "generated/Parser.cpp"
    break;


#line 3581 "generated/Parser.cpp"

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

#line 688 "frontend/Parser.y"


 /* Subroutines Section */

// The one funnel for front-end diagnostics: bison calls this for a syntax
// error, and frontend/Lexer.l calls it for a literal it had to reject. Both
// report a position without either one passing one, because yylloc already
// holds the current token's -- filled by YY_USER_ACTION in Lexer.l for every
// token the scanner returns.
//
// first_line rather than last_line: an error belongs at where the offending
// token starts, which is where a reader's eye and an editor's cursor both go.
void yyerror(const char* s) {
  frontend::reportError(s, yylloc.first_line, yylloc.first_column);
}
