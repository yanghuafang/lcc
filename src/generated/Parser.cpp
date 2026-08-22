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
#define YYLAST   2312

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  87
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  41
/* YYNRULES -- Number of rules.  */
#define YYNRULES  176
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  338

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
     269,   272,   277,   281,   285,   288,   293,   296,   299,   304,
     309,   310,   313,   314,   316,   317,   319,   320,   322,   323,
     324,   330,   332,   333,   338,   340,   342,   345,   353,   355,
     360,   362,   370,   372,   374,   377,   379,   385,   387,   389,
     390,   391,   394,   395,   399,   400,   401,   402,   403,   404,
     405,   406,   407,   408,   409,   410,   411,   416,   418,   421,
     423,   428,   430,   431,   436,   438,   439,   442,   443,   447,
     457,   458,   461,   462,   463,   464,   465,   466,   467,   468,
     469,   470,   471,   472,   473,   476,   479,   486,   492,   494,
     497,   500,   505,   508,   511,   516,   521,   527,   531,   535,
     537,   542,   557,   558,   559,   561,   562,   564,   566,   568,
     570,   572,   574,   576,   578,   580,   582,   584,   586,   587,
     589,   591,   593,   594,   595,   597,   599,   601,   603,   604,
     605,   606,   607,   608,   610,   611,   612,   613,   614,   615,
     616,   617,   618,   619,   620,   621,   622,   623,   624,   625,
     626,   627,   628,   629,   633,   635,   636,   639,   640,   641,
     642,   643,   644,   645,   646,   647,   648
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

#define YYPACT_NINF (-209)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-31)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
    -209,    40,   203,  -209,  -209,  -209,  -209,  -209,   100,  2234,
      -8,  -209,  -209,  -209,  -209,   -67,    10,    34,  2204,  -209,
    -209,  -209,  -209,  -209,  -209,    37,    11,  -209,  -209,  -209,
    -209,  -209,    60,    43,    60,   113,   120,   124,    63,    66,
      69,    23,    52,  -209,  -209,  -209,   104,   127,  -209,  -209,
      86,   150,   153,   162,  1041,    -9,    42,  -209,    94,  -209,
    1041,  -209,   959,   972,   155,    14,  -209,  -209,  -209,  -209,
    -209,    98,    51,  -209,  -209,   168,   797,  -209,   163,  -209,
      59,  -209,  -209,   106,  -209,  -209,   -12,    86,  -209,  1002,
    1052,  -209,  1082,    31,  -209,   902,   902,   614,   770,   902,
     902,   902,   902,   902,   902,  -209,  -209,   173,   174,  -209,
    -209,  -209,  -209,  -209,  -209,  -209,  -209,  1980,  -209,   112,
    -209,   132,   107,  -209,  -209,   110,   114,  -209,  -209,  -209,
    -209,  -209,   151,   151,     0,   176,  1155,   875,  -209,    35,
    -209,  1980,   151,   151,   151,   151,   151,   151,   692,   902,
     902,   902,   115,   902,   902,   116,   902,   902,   902,   902,
     902,   902,  -209,  -209,   902,   902,   902,   902,   902,   902,
     902,   902,   902,   902,   902,   902,   902,   902,   902,   902,
     902,   902,   902,   902,   902,   902,  -209,  -209,   117,  -209,
    -209,   185,   191,   290,   902,  -209,    36,   875,  -209,     6,
     184,  1201,  1980,   111,  1980,  1247,  -209,   151,  2228,  -209,
    1293,  1980,   471,   471,   151,   151,  1980,  1980,  1980,  1980,
    1980,  2146,  2187,  1980,  1980,  1980,   389,   389,  1980,  1980,
    2105,  2064,   134,   134,   543,   543,   543,   543,  -209,  -209,
    -209,  -209,  -209,  -209,    -8,   186,   188,   190,   454,   192,
     198,   206,   205,  -209,  -209,    94,  -209,  -209,  -209,  -209,
    -209,  -209,  -209,  -209,  -209,  -209,  1339,   151,  -209,  -209,
    -209,  -209,  -209,   902,  -209,   902,  -209,   372,    94,   902,
     902,   536,   139,   902,  -209,  -209,  -209,  1385,  -209,  1980,
    2023,  -209,  1431,  1477,   902,   902,  1523,   200,  1569,  -209,
     454,   197,  1615,  1661,   902,   902,   454,   159,  -209,   902,
     902,  1707,  1753,  -209,   454,    -7,  1799,  1845,   902,   211,
    -209,  -209,   902,   214,  -209,   454,   454,  1891,  -209,  1937,
    -209,  -209,  -209,   454,  -209,   454,  -209,   454
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
       0,     0,     0,     0,     0,   175,   176,     0,   112,   167,
     168,   169,   170,   171,   172,   173,   174,    35,   113,     0,
      72,     0,     0,    78,    74,    23,    25,    48,    47,    14,
      81,    15,   126,   127,   112,     0,     0,     0,    37,     0,
      39,    40,   124,   125,   136,   137,   146,   156,     0,   166,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   134,   135,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    12,    13,     0,    69,
      79,     0,     0,     0,     0,   114,     0,     0,    36,   112,
       0,     0,   165,     0,   115,     0,   117,   131,   143,   118,
       0,   128,   129,   130,   132,   133,   138,   139,   140,   141,
     142,   144,   145,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   157,   158,   161,   162,   159,   160,    71,    10,
      11,    94,    81,    16,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    93,    92,    33,    80,    83,    84,    85,
      86,    87,    88,    89,    90,    91,     0,   120,    41,    38,
     123,   121,   122,     0,   116,     0,   119,     0,    33,     0,
       0,     0,     0,     0,   107,   108,   109,     0,    82,   164,
     163,   111,     0,     0,     0,     0,     0,     0,     0,   110,
       0,     0,     0,     0,     0,     0,     0,    96,    99,     0,
       0,     0,     0,   106,     0,     0,     0,     0,     0,     0,
      95,    97,     0,     0,    98,     0,     0,     0,   105,     0,
      81,   103,   104,     0,    81,   101,   102,   100
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -209,  -209,  -209,  -209,  -209,  -209,   108,    -1,   221,    71,
      -2,   -29,   175,    89,    41,  -209,   178,   172,   147,  -209,
     -35,  -209,  -209,  -209,   154,  -208,  -187,  -209,  -209,  -209,
    -209,  -209,  -209,  -209,  -209,  -209,  -209,  -209,   -74,  -209,
    -209
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
       0,     1,     2,    20,    21,    22,   131,   253,   254,   255,
      34,    42,    43,   139,   140,    56,    57,    72,    73,    27,
      62,    84,   121,    65,    66,   193,   256,   257,   258,   315,
     324,   259,   260,   261,   262,   263,   264,   265,   266,   203,
     118
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      26,    23,   117,   -30,    47,   -30,    74,    32,   122,   -30,
     321,    35,   149,   -30,    63,   -30,    44,    87,   149,   270,
      45,   132,   133,   136,   141,   142,   143,   144,   145,   146,
     147,    88,    89,    90,   277,    54,   129,    55,   197,   197,
       3,     4,     5,     6,     7,     8,     9,   130,    11,    12,
      13,    14,   198,   268,    92,    58,    55,    59,   322,   323,
      76,   282,    92,   141,    93,    15,    16,    17,   123,    45,
      19,    75,   119,    25,   201,   202,   204,   205,   -30,   207,
     208,    33,   210,   211,   212,   213,   214,   215,    36,    40,
     216,   217,   218,   219,   220,   221,   222,   223,   224,   225,
     226,   227,   228,   229,   230,   231,   232,   233,   234,   235,
     236,   237,    37,   307,   273,    41,    60,   186,    55,   313,
     267,    46,   335,   141,   274,    71,   337,   320,   130,    48,
      58,    71,    61,    83,    83,   188,    49,   189,   331,   332,
      50,    51,   152,   153,    52,   155,   336,    53,   156,    28,
      29,    30,    31,   158,   159,   160,   161,   162,   163,   152,
      83,    83,   155,    71,    64,   156,    67,    69,   135,    68,
     174,   175,    78,    86,   162,   163,    91,    55,   287,   182,
     183,   184,   185,    94,   120,   148,   149,   190,   191,   194,
     239,    26,   192,   206,   209,   238,   240,   271,   279,   289,
     280,   290,   281,   284,   283,   292,   293,   296,   297,   298,
     286,   285,   305,   308,    95,    96,   328,    97,   330,   200,
     302,   303,   314,    24,    99,   100,   196,   187,   101,   102,
     311,   312,    80,    79,    77,   316,   317,   103,   269,   128,
       0,   124,     0,     0,   327,     0,    26,   104,   329,    47,
       0,     0,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,     0,     0,   105,   106,     0,     0,     0,
       0,     0,     0,     0,     0,    26,    15,    16,    17,    18,
     295,    19,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,     0,     0,     0,   241,     0,     0,    26,    95,
      96,     0,    97,     0,    26,     0,   242,   243,     0,    99,
     100,     0,    26,   101,   102,   278,     0,     0,     0,     0,
       0,     0,   103,    26,    26,     0,     0,     0,     0,     0,
       0,    26,   104,    26,     0,    26,     0,     0,     0,     4,
       5,     6,     7,     8,     9,   244,    11,    12,    13,    14,
     105,   106,   245,     0,   246,     0,     0,   247,   248,   249,
     250,   251,   252,    15,    16,    17,     0,   107,   134,   109,
     110,   111,   112,   113,   114,   115,   116,   241,     0,     0,
       0,    95,    96,     0,    97,     0,     0,     0,   242,   291,
       0,    99,   100,     0,     0,   101,   102,   152,   153,     0,
     155,     0,     0,   156,   103,     0,     0,     0,   158,   159,
     160,   161,   162,   163,   104,     0,     0,     0,     0,     0,
       0,     4,     5,     6,     7,     8,     9,   244,    11,    12,
      13,    14,   105,   106,   245,     0,   246,     0,     0,   247,
     248,   249,   250,   251,   252,    15,    16,    17,     0,   107,
     134,   109,   110,   111,   112,   113,   114,   115,   116,   241,
       0,     0,     0,    95,    96,     0,    97,     0,     0,     0,
     242,     0,     0,    99,   100,     0,     0,   101,   102,   152,
     153,     0,   155,     0,     0,   156,   103,     0,     0,     0,
       0,     0,   160,   161,   162,   163,   104,     0,     0,     0,
       0,     0,     0,     4,     5,     6,     7,     8,     9,   244,
      11,    12,    13,    14,   105,   106,   245,     0,   246,     0,
       0,   247,   248,   249,   250,   251,   252,    15,    16,    17,
       0,   107,   134,   109,   110,   111,   112,   113,   114,   115,
     116,   294,     0,     0,     0,    95,    96,     0,    97,     0,
       0,   152,   153,     0,   155,    99,   100,   156,     0,   101,
     102,     0,   158,   159,   160,   161,   162,   163,   103,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   104,   174,
     175,     0,     0,     0,     0,     4,     5,     6,     7,     8,
       9,   244,    11,    12,    13,    14,   105,   106,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    15,
      16,    17,     0,   107,   134,   109,   110,   111,   112,   113,
     114,   115,   116,    95,    96,     0,    97,     0,     0,     0,
       0,     0,     0,    99,   100,     0,     0,   101,   102,     0,
       0,     0,     0,     0,     0,     0,   103,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   104,     0,     0,     0,
       0,     0,     0,     4,     5,     6,     7,     8,     9,     0,
      11,    12,    13,    14,   105,   106,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    15,    16,    17,
       0,   107,   134,   109,   110,   111,   112,   113,   114,   115,
     116,    95,    96,     0,    97,     0,     0,     0,     0,     0,
       0,    99,   100,     0,     0,   101,   102,     0,     0,     0,
       0,     0,     0,     0,   103,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   104,     0,     0,     0,     0,     0,
       0,     4,     5,     6,     7,     8,     9,     0,    11,    12,
      13,    14,   105,   106,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    15,    16,    17,     0,   107,
     199,   109,   110,   111,   112,   113,   114,   115,   116,    95,
      96,     0,    97,     0,     0,     0,   137,   138,     0,    99,
     100,     0,     0,   101,   102,     0,     0,     0,     0,     0,
       0,     0,   103,     0,     0,     0,    95,    96,     0,    97,
       0,     0,   104,    98,     0,     0,    99,   100,     0,     0,
     101,   102,     0,     0,     0,     0,     0,     0,     0,   103,
     105,   106,     0,     0,     0,     0,     0,     0,     0,   104,
       0,     0,     0,     0,     0,     0,     0,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   105,   106,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,    95,    96,     0,    97,     0,     0,
       0,   137,     0,     0,    99,   100,     0,     0,   101,   102,
       0,     0,     0,     0,     0,     0,     0,   103,     0,     0,
       0,    95,    96,     0,    97,     0,     0,   104,     0,     0,
       0,    99,   100,     0,     0,   101,   102,     0,     0,     0,
       0,     0,     0,     0,   103,   105,   106,     0,     0,     0,
       0,     0,     0,     0,   104,     0,     0,     0,     0,     0,
       0,     0,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   105,   106,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    82,    81,     0,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,    85,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     4,     5,
       6,     7,     8,     9,     0,    11,    12,    13,    14,   125,
       0,     4,     5,     6,     7,     8,     9,     0,    11,    12,
      13,    14,    15,    16,    17,     0,     0,    19,     0,     0,
       0,     0,     0,     0,     0,    15,    16,    17,    70,     0,
      19,     4,     5,     6,     7,     8,     9,    81,    11,    12,
      13,    14,     0,     0,     0,     0,     0,     0,     0,   126,
       0,     0,     0,     0,     0,    15,    16,    17,     0,     0,
      19,     0,     0,     0,     0,     0,     0,     0,     0,   127,
       4,     5,     6,     7,     8,     9,     0,    11,    12,    13,
      14,     4,     5,     6,     7,     8,     9,     0,    11,    12,
      13,    14,     0,     0,    15,    16,    17,     0,     0,    19,
       0,     0,     0,     0,     0,    15,    16,    17,     0,     0,
      19,     4,     5,     6,     7,     8,     9,     0,    11,    12,
      13,    14,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    15,    16,    17,   150,     0,
      19,   151,     0,   152,   153,   154,   155,     0,   195,   156,
       0,     0,     0,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,     0,   171,   172,
     173,   174,   175,   176,   177,   178,   179,     0,   180,   181,
     182,   183,   184,   185,   150,     0,     0,   151,     0,   152,
     153,   154,   155,     0,   272,   156,     0,     0,     0,   157,
     158,   159,   160,   161,   162,   163,   164,   165,   166,   167,
     168,   169,   170,     0,   171,   172,   173,   174,   175,   176,
     177,   178,   179,     0,   180,   181,   182,   183,   184,   185,
     150,   275,     0,   151,     0,   152,   153,   154,   155,     0,
       0,   156,     0,     0,     0,   157,   158,   159,   160,   161,
     162,   163,   164,   165,   166,   167,   168,   169,   170,     0,
     171,   172,   173,   174,   175,   176,   177,   178,   179,     0,
     180,   181,   182,   183,   184,   185,   150,     0,     0,   151,
       0,   152,   153,   154,   155,     0,     0,   156,   276,     0,
       0,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,     0,   171,   172,   173,   174,
     175,   176,   177,   178,   179,     0,   180,   181,   182,   183,
     184,   185,   150,     0,   288,   151,     0,   152,   153,   154,
     155,     0,     0,   156,     0,     0,     0,   157,   158,   159,
     160,   161,   162,   163,   164,   165,   166,   167,   168,   169,
     170,     0,   171,   172,   173,   174,   175,   176,   177,   178,
     179,     0,   180,   181,   182,   183,   184,   185,   150,     0,
     299,   151,     0,   152,   153,   154,   155,     0,     0,   156,
       0,     0,     0,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,     0,   171,   172,
     173,   174,   175,   176,   177,   178,   179,     0,   180,   181,
     182,   183,   184,   185,   150,     0,     0,   151,     0,   152,
     153,   154,   155,     0,   300,   156,     0,     0,     0,   157,
     158,   159,   160,   161,   162,   163,   164,   165,   166,   167,
     168,   169,   170,     0,   171,   172,   173,   174,   175,   176,
     177,   178,   179,     0,   180,   181,   182,   183,   184,   185,
     150,     0,     0,   151,     0,   152,   153,   154,   155,     0,
     301,   156,     0,     0,     0,   157,   158,   159,   160,   161,
     162,   163,   164,   165,   166,   167,   168,   169,   170,     0,
     171,   172,   173,   174,   175,   176,   177,   178,   179,     0,
     180,   181,   182,   183,   184,   185,   150,     0,   304,   151,
       0,   152,   153,   154,   155,     0,     0,   156,     0,     0,
       0,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,     0,   171,   172,   173,   174,
     175,   176,   177,   178,   179,     0,   180,   181,   182,   183,
     184,   185,   150,     0,     0,   151,     0,   152,   153,   154,
     155,     0,   306,   156,     0,     0,     0,   157,   158,   159,
     160,   161,   162,   163,   164,   165,   166,   167,   168,   169,
     170,     0,   171,   172,   173,   174,   175,   176,   177,   178,
     179,     0,   180,   181,   182,   183,   184,   185,   150,     0,
     309,   151,     0,   152,   153,   154,   155,     0,     0,   156,
       0,     0,     0,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,     0,   171,   172,
     173,   174,   175,   176,   177,   178,   179,     0,   180,   181,
     182,   183,   184,   185,   150,     0,   310,   151,     0,   152,
     153,   154,   155,     0,     0,   156,     0,     0,     0,   157,
     158,   159,   160,   161,   162,   163,   164,   165,   166,   167,
     168,   169,   170,     0,   171,   172,   173,   174,   175,   176,
     177,   178,   179,     0,   180,   181,   182,   183,   184,   185,
     150,     0,   318,   151,     0,   152,   153,   154,   155,     0,
       0,   156,     0,     0,     0,   157,   158,   159,   160,   161,
     162,   163,   164,   165,   166,   167,   168,   169,   170,     0,
     171,   172,   173,   174,   175,   176,   177,   178,   179,     0,
     180,   181,   182,   183,   184,   185,   150,     0,     0,   151,
       0,   152,   153,   154,   155,     0,   319,   156,     0,     0,
       0,   157,   158,   159,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,     0,   171,   172,   173,   174,
     175,   176,   177,   178,   179,     0,   180,   181,   182,   183,
     184,   185,   150,     0,     0,   151,     0,   152,   153,   154,
     155,     0,   325,   156,     0,     0,     0,   157,   158,   159,
     160,   161,   162,   163,   164,   165,   166,   167,   168,   169,
     170,     0,   171,   172,   173,   174,   175,   176,   177,   178,
     179,     0,   180,   181,   182,   183,   184,   185,   150,     0,
       0,   151,     0,   152,   153,   154,   155,     0,   326,   156,
       0,     0,     0,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,     0,   171,   172,
     173,   174,   175,   176,   177,   178,   179,     0,   180,   181,
     182,   183,   184,   185,   150,     0,     0,   151,     0,   152,
     153,   154,   155,     0,   333,   156,     0,     0,     0,   157,
     158,   159,   160,   161,   162,   163,   164,   165,   166,   167,
     168,   169,   170,     0,   171,   172,   173,   174,   175,   176,
     177,   178,   179,     0,   180,   181,   182,   183,   184,   185,
     150,   334,     0,   151,     0,   152,   153,   154,   155,     0,
       0,   156,     0,     0,     0,   157,   158,   159,   160,   161,
     162,   163,   164,   165,   166,   167,   168,   169,   170,     0,
     171,   172,   173,   174,   175,   176,   177,   178,   179,     0,
     180,   181,   182,   183,   184,   185,   151,     0,   152,   153,
     154,   155,     0,     0,   156,     0,     0,     0,   157,   158,
     159,   160,   161,   162,   163,   164,   165,   166,   167,   168,
     169,   170,     0,   171,   172,   173,   174,   175,   176,   177,
     178,   179,     0,   180,   181,   182,   183,   184,   185,   151,
       0,   152,   153,   154,   155,     0,     0,   156,     0,     0,
       0,     0,   158,   159,   160,   161,   162,   163,     0,     0,
       0,     0,     0,   169,   170,     0,     0,     0,     0,   174,
     175,     0,     0,   178,   179,     0,   180,   181,   182,   183,
     184,   185,   152,   153,   154,   155,     0,     0,   156,     0,
       0,     0,     0,   158,   159,   160,   161,   162,   163,     0,
       0,     0,     0,     0,   169,   170,     0,     0,     0,     0,
     174,   175,     0,     0,   178,     0,     0,   180,   181,   182,
     183,   184,   185,   152,   153,   154,   155,     0,     0,   156,
       0,     0,     0,     0,   158,   159,   160,   161,   162,   163,
       0,     0,     0,     0,     0,   169,   170,     0,     0,     0,
       0,   174,   175,     0,     0,     0,     0,     0,   180,   181,
     182,   183,   184,   185,   152,   153,   154,   155,     0,     0,
     156,     0,     0,     0,     0,   158,   159,   160,   161,   162,
     163,     0,     0,     0,     0,     0,     0,   170,     0,     0,
       0,     0,   174,   175,     0,     0,     0,     0,     0,   180,
     181,   182,   183,   184,   185,   152,   153,   154,   155,     0,
       0,   156,     0,     0,     0,     0,   158,   159,   160,   161,
     162,   163,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   174,   175,     0,     0,     0,     0,     0,
     180,   181,   182,   183,   184,   185,   152,   153,     0,   155,
       0,     0,   156,     0,     0,     0,     0,   158,   159,   160,
     161,   162,   163,     4,     5,     6,     7,     8,     9,     0,
      11,    12,    13,    14,   174,   175,     0,     0,     0,     0,
       0,   180,   181,   182,   183,   184,   185,    38,    39,    17,
       0,     0,    19,     4,     5,     6,     7,     8,     0,     0,
      11,    12,    13,    14,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    15,    16,    17,
       0,     0,    19
};

static const yytype_int16 yycheck[] =
{
       2,     2,    76,     3,    33,     5,    15,     9,    20,     9,
      17,    78,    12,    13,    49,     9,     5,     3,    12,    13,
       9,    95,    96,    97,    98,    99,   100,   101,   102,   103,
     104,    17,    67,    68,   242,    12,     5,    14,     3,     3,
       0,    49,    50,    51,    52,    53,    54,    16,    56,    57,
      58,    59,    17,    17,     3,     3,    14,     5,    65,    66,
      18,   248,     3,   137,    13,    73,    74,    75,    80,     9,
      78,    80,    13,     2,   148,   149,   150,   151,    78,   153,
     154,    10,   156,   157,   158,   159,   160,   161,    78,    18,
     164,   165,   166,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,   178,   179,   180,   181,   182,   183,
     184,   185,    78,   300,     3,    78,    12,     5,    14,   306,
     194,    78,   330,   197,    13,    54,   334,   314,    16,    16,
       3,    60,     5,    62,    63,     3,    16,     5,   325,   326,
      16,    78,     8,     9,    78,    11,   333,    78,    14,    49,
      50,    51,    52,    19,    20,    21,    22,    23,    24,     8,
      89,    90,    11,    92,    78,    14,    16,     5,    97,    16,
      36,    37,    78,    18,    23,    24,    78,    14,   252,    45,
      46,    47,    48,    15,    78,    12,    12,    80,    78,    13,
       5,   193,    78,    78,    78,    78,     5,    13,    12,   273,
      12,   275,    12,     5,    12,   279,   280,   281,    69,   283,
       5,     5,    12,    16,     9,    10,     5,    12,     4,   148,
     294,   295,    63,     2,    19,    20,   137,   119,    23,    24,
     304,   305,    60,    58,    56,   309,   310,    32,   197,    92,
      -1,    87,    -1,    -1,   318,    -1,   248,    42,   322,   278,
      -1,    -1,    49,    50,    51,    52,    53,    54,    55,    56,
      57,    58,    59,    -1,    -1,    60,    61,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   277,    73,    74,    75,    76,
     281,    78,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    -1,    -1,    -1,     5,    -1,    -1,   300,     9,
      10,    -1,    12,    -1,   306,    -1,    16,    17,    -1,    19,
      20,    -1,   314,    23,    24,   244,    -1,    -1,    -1,    -1,
      -1,    -1,    32,   325,   326,    -1,    -1,    -1,    -1,    -1,
      -1,   333,    42,   335,    -1,   337,    -1,    -1,    -1,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    64,    -1,    -1,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    -1,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,     5,    -1,    -1,
      -1,     9,    10,    -1,    12,    -1,    -1,    -1,    16,    17,
      -1,    19,    20,    -1,    -1,    23,    24,     8,     9,    -1,
      11,    -1,    -1,    14,    32,    -1,    -1,    -1,    19,    20,
      21,    22,    23,    24,    42,    -1,    -1,    -1,    -1,    -1,
      -1,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    64,    -1,    -1,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    -1,    77,
      78,    79,    80,    81,    82,    83,    84,    85,    86,     5,
      -1,    -1,    -1,     9,    10,    -1,    12,    -1,    -1,    -1,
      16,    -1,    -1,    19,    20,    -1,    -1,    23,    24,     8,
       9,    -1,    11,    -1,    -1,    14,    32,    -1,    -1,    -1,
      -1,    -1,    21,    22,    23,    24,    42,    -1,    -1,    -1,
      -1,    -1,    -1,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    64,    -1,
      -1,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      -1,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,     5,    -1,    -1,    -1,     9,    10,    -1,    12,    -1,
      -1,     8,     9,    -1,    11,    19,    20,    14,    -1,    23,
      24,    -1,    19,    20,    21,    22,    23,    24,    32,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    42,    36,
      37,    -1,    -1,    -1,    -1,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    73,
      74,    75,    -1,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    86,     9,    10,    -1,    12,    -1,    -1,    -1,
      -1,    -1,    -1,    19,    20,    -1,    -1,    23,    24,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    32,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,
      -1,    -1,    -1,    49,    50,    51,    52,    53,    54,    -1,
      56,    57,    58,    59,    60,    61,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    73,    74,    75,
      -1,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,     9,    10,    -1,    12,    -1,    -1,    -1,    -1,    -1,
      -1,    19,    20,    -1,    -1,    23,    24,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    32,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,
      -1,    49,    50,    51,    52,    53,    54,    -1,    56,    57,
      58,    59,    60,    61,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    73,    74,    75,    -1,    77,
      78,    79,    80,    81,    82,    83,    84,    85,    86,     9,
      10,    -1,    12,    -1,    -1,    -1,    16,    17,    -1,    19,
      20,    -1,    -1,    23,    24,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    32,    -1,    -1,    -1,     9,    10,    -1,    12,
      -1,    -1,    42,    16,    -1,    -1,    19,    20,    -1,    -1,
      23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    32,
      60,    61,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    42,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    60,    61,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    86,     9,    10,    -1,    12,    -1,    -1,
      -1,    16,    -1,    -1,    19,    20,    -1,    -1,    23,    24,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    32,    -1,    -1,
      -1,     9,    10,    -1,    12,    -1,    -1,    42,    -1,    -1,
      -1,    19,    20,    -1,    -1,    23,    24,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    32,    60,    61,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    60,    61,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    17,     5,    -1,    77,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    17,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     5,    49,    50,
      51,    52,    53,    54,    -1,    56,    57,    58,    59,    17,
      -1,    49,    50,    51,    52,    53,    54,    -1,    56,    57,
      58,    59,    73,    74,    75,    -1,    -1,    78,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    73,    74,    75,     7,    -1,
      78,    49,    50,    51,    52,    53,    54,     5,    56,    57,
      58,    59,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    17,
      -1,    -1,    -1,    -1,    -1,    73,    74,    75,    -1,    -1,
      78,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     7,
      49,    50,    51,    52,    53,    54,    -1,    56,    57,    58,
      59,    49,    50,    51,    52,    53,    54,    -1,    56,    57,
      58,    59,    -1,    -1,    73,    74,    75,    -1,    -1,    78,
      -1,    -1,    -1,    -1,    -1,    73,    74,    75,    -1,    -1,
      78,    49,    50,    51,    52,    53,    54,    -1,    56,    57,
      58,    59,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    73,    74,    75,     3,    -1,
      78,     6,    -1,     8,     9,    10,    11,    -1,    13,    14,
      -1,    -1,    -1,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    -1,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    -1,    43,    44,
      45,    46,    47,    48,     3,    -1,    -1,     6,    -1,     8,
       9,    10,    11,    -1,    13,    14,    -1,    -1,    -1,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    -1,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    -1,    43,    44,    45,    46,    47,    48,
       3,     4,    -1,     6,    -1,     8,     9,    10,    11,    -1,
      -1,    14,    -1,    -1,    -1,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    -1,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    -1,
      43,    44,    45,    46,    47,    48,     3,    -1,    -1,     6,
      -1,     8,     9,    10,    11,    -1,    -1,    14,    15,    -1,
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
      45,    46,    47,    48,     3,    -1,    -1,     6,    -1,     8,
       9,    10,    11,    -1,    13,    14,    -1,    -1,    -1,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    -1,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    -1,    43,    44,    45,    46,    47,    48,
       3,    -1,    -1,     6,    -1,     8,     9,    10,    11,    -1,
      13,    14,    -1,    -1,    -1,    18,    19,    20,    21,    22,
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
       5,     6,    -1,     8,     9,    10,    11,    -1,    -1,    14,
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
      45,    46,    47,    48,     3,    -1,    -1,     6,    -1,     8,
       9,    10,    11,    -1,    13,    14,    -1,    -1,    -1,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    -1,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    -1,    43,    44,    45,    46,    47,    48,
       3,     4,    -1,     6,    -1,     8,     9,    10,    11,    -1,
      -1,    14,    -1,    -1,    -1,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    -1,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    -1,
      43,    44,    45,    46,    47,    48,     6,    -1,     8,     9,
      10,    11,    -1,    -1,    14,    -1,    -1,    -1,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    -1,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    -1,    43,    44,    45,    46,    47,    48,     6,
      -1,     8,     9,    10,    11,    -1,    -1,    14,    -1,    -1,
      -1,    -1,    19,    20,    21,    22,    23,    24,    -1,    -1,
      -1,    -1,    -1,    30,    31,    -1,    -1,    -1,    -1,    36,
      37,    -1,    -1,    40,    41,    -1,    43,    44,    45,    46,
      47,    48,     8,     9,    10,    11,    -1,    -1,    14,    -1,
      -1,    -1,    -1,    19,    20,    21,    22,    23,    24,    -1,
      -1,    -1,    -1,    -1,    30,    31,    -1,    -1,    -1,    -1,
      36,    37,    -1,    -1,    40,    -1,    -1,    43,    44,    45,
      46,    47,    48,     8,     9,    10,    11,    -1,    -1,    14,
      -1,    -1,    -1,    -1,    19,    20,    21,    22,    23,    24,
      -1,    -1,    -1,    -1,    -1,    30,    31,    -1,    -1,    -1,
      -1,    36,    37,    -1,    -1,    -1,    -1,    -1,    43,    44,
      45,    46,    47,    48,     8,     9,    10,    11,    -1,    -1,
      14,    -1,    -1,    -1,    -1,    19,    20,    21,    22,    23,
      24,    -1,    -1,    -1,    -1,    -1,    -1,    31,    -1,    -1,
      -1,    -1,    36,    37,    -1,    -1,    -1,    -1,    -1,    43,
      44,    45,    46,    47,    48,     8,     9,    10,    11,    -1,
      -1,    14,    -1,    -1,    -1,    -1,    19,    20,    21,    22,
      23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    36,    37,    -1,    -1,    -1,    -1,    -1,
      43,    44,    45,    46,    47,    48,     8,     9,    -1,    11,
      -1,    -1,    14,    -1,    -1,    -1,    -1,    19,    20,    21,
      22,    23,    24,    49,    50,    51,    52,    53,    54,    -1,
      56,    57,    58,    59,    36,    37,    -1,    -1,    -1,    -1,
      -1,    43,    44,    45,    46,    47,    48,    73,    74,    75,
      -1,    -1,    78,    49,    50,    51,    52,    53,    -1,    -1,
      56,    57,    58,    59,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    73,    74,    75,
      -1,    -1,    78
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
      78,   109,    20,    80,   111,    17,    17,     7,   105,     5,
      16,    93,   125,   125,    78,    96,   125,    16,    17,   100,
     101,   125,   125,   125,   125,   125,   125,   125,    12,    12,
       3,     6,     8,     9,    10,    11,    14,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      43,    44,    45,    46,    47,    48,     5,    93,     3,     5,
      80,    78,    78,   112,    13,    13,   100,     3,    17,    78,
      96,   125,   125,   126,   125,   125,    78,   125,   125,    78,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,    78,     5,
       5,     5,    16,    17,    55,    62,    64,    67,    68,    69,
      70,    71,    72,    94,    95,    96,   113,   114,   115,   118,
     119,   120,   121,   122,   123,   124,   125,   125,    17,   101,
      13,    13,    13,     3,    13,     4,    15,   112,    96,    12,
      12,    12,   113,    12,     5,     5,     5,   125,     5,   125,
     125,    17,   125,   125,     5,    94,   125,    69,   125,     5,
      13,    13,   125,   125,     5,    12,    13,   113,    16,     5,
       5,   125,   125,   113,    63,   116,   125,   125,     5,    13,
     113,    17,    65,    66,   117,    13,    13,   125,     5,   125,
       4,   113,   113,    13,     4,   112,   113,   112
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
     108,   109,   109,   109,   110,   110,   110,   111,   111,   111,
     112,   112,   113,   113,   113,   113,   113,   113,   113,   113,
     113,   113,   113,   113,   113,   114,   114,   115,   116,   116,
     117,   117,   118,   118,   118,   119,   120,   121,   122,   123,
     123,   124,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   126,   126,   126,   127,   127,   127,
     127,   127,   127,   127,   127,   127,   127
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
       1,     3,     1,     0,     3,     1,     0,     1,     3,     4,
       2,     0,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     7,     5,     7,     2,     0,
       4,     3,     9,     8,     8,     7,     5,     2,     2,     2,
       3,     3,     1,     1,     3,     3,     4,     3,     3,     4,
       4,     4,     4,     4,     2,     2,     2,     2,     3,     3,
       3,     3,     3,     3,     2,     2,     2,     2,     3,     3,
       3,     3,     3,     3,     3,     3,     2,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     2,     3,     3,     3,
       3,     3,     3,     5,     3,     1,     0,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1
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
#line 1933 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Decl: /* Decl  */
#line 144 "frontend/Parser.y"
            { delete ((*yyvaluep).decl); }
#line 1939 "generated/Parser.cpp"
        break;

    case YYSYMBOL_TypedefDecl: /* TypedefDecl  */
#line 144 "frontend/Parser.y"
            { delete ((*yyvaluep).typedefDecl); }
#line 1945 "generated/Parser.cpp"
        break;

    case YYSYMBOL_FuncDecl: /* FuncDecl  */
#line 145 "frontend/Parser.y"
            { delete ((*yyvaluep).funcDecl); }
#line 1951 "generated/Parser.cpp"
        break;

    case YYSYMBOL_FuncBody: /* FuncBody  */
#line 145 "frontend/Parser.y"
            { delete ((*yyvaluep).funcBody); }
#line 1957 "generated/Parser.cpp"
        break;

    case YYSYMBOL_VarDecl: /* VarDecl  */
#line 145 "frontend/Parser.y"
            { delete ((*yyvaluep).varDecl); }
#line 1963 "generated/Parser.cpp"
        break;

    case YYSYMBOL_TypeDecl: /* TypeDecl  */
#line 144 "frontend/Parser.y"
            { delete ((*yyvaluep).typeDecl); }
#line 1969 "generated/Parser.cpp"
        break;

    case YYSYMBOL_VarType: /* VarType  */
#line 145 "frontend/Parser.y"
            { delete ((*yyvaluep).varType); }
#line 1975 "generated/Parser.cpp"
        break;

    case YYSYMBOL__VarType: /* _VarType  */
#line 145 "frontend/Parser.y"
            { delete ((*yyvaluep).varType); }
#line 1981 "generated/Parser.cpp"
        break;

    case YYSYMBOL_VarList: /* VarList  */
#line 146 "frontend/Parser.y"
            { delete ((*yyvaluep).varList); }
#line 1987 "generated/Parser.cpp"
        break;

    case YYSYMBOL_VarInit: /* VarInit  */
#line 146 "frontend/Parser.y"
            { delete ((*yyvaluep).varInit); }
#line 1993 "generated/Parser.cpp"
        break;

    case YYSYMBOL_InitList: /* InitList  */
#line 148 "frontend/Parser.y"
            { delete ((*yyvaluep).initList); }
#line 1999 "generated/Parser.cpp"
        break;

    case YYSYMBOL_InitItem: /* InitItem  */
#line 148 "frontend/Parser.y"
            { delete ((*yyvaluep).initElement); }
#line 2005 "generated/Parser.cpp"
        break;

    case YYSYMBOL_ArrayBoundList: /* ArrayBoundList  */
#line 146 "frontend/Parser.y"
            { delete ((*yyvaluep).arrayBoundList); }
#line 2011 "generated/Parser.cpp"
        break;

    case YYSYMBOL_ParamList: /* ParamList  */
#line 146 "frontend/Parser.y"
            { delete ((*yyvaluep).paramList); }
#line 2017 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Param: /* Param  */
#line 146 "frontend/Parser.y"
            { delete ((*yyvaluep).param); }
#line 2023 "generated/Parser.cpp"
        break;

    case YYSYMBOL_BuiltinType: /* BuiltinType  */
#line 147 "frontend/Parser.y"
            { delete ((*yyvaluep).builtinType); }
#line 2029 "generated/Parser.cpp"
        break;

    case YYSYMBOL_FieldDecls: /* FieldDecls  */
#line 147 "frontend/Parser.y"
            { delete ((*yyvaluep).fieldDecls); }
#line 2035 "generated/Parser.cpp"
        break;

    case YYSYMBOL_FieldDecl: /* FieldDecl  */
#line 147 "frontend/Parser.y"
            { delete ((*yyvaluep).fieldDecl); }
#line 2041 "generated/Parser.cpp"
        break;

    case YYSYMBOL_MemberList: /* MemberList  */
#line 147 "frontend/Parser.y"
            { delete ((*yyvaluep).memberList); }
#line 2047 "generated/Parser.cpp"
        break;

    case YYSYMBOL_EnumList: /* EnumList  */
#line 152 "frontend/Parser.y"
            { delete ((*yyvaluep).enumList); }
#line 2053 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Enum: /* Enum  */
#line 152 "frontend/Parser.y"
            { delete ((*yyvaluep).enumeration); }
#line 2059 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Stmts: /* Stmts  */
#line 149 "frontend/Parser.y"
            { delete ((*yyvaluep).stmts); }
#line 2065 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Stmt: /* Stmt  */
#line 149 "frontend/Parser.y"
            { delete ((*yyvaluep).stmt); }
#line 2071 "generated/Parser.cpp"
        break;

    case YYSYMBOL_IfStmt: /* IfStmt  */
#line 149 "frontend/Parser.y"
            { delete ((*yyvaluep).ifStmt); }
#line 2077 "generated/Parser.cpp"
        break;

    case YYSYMBOL_SwitchStmt: /* SwitchStmt  */
#line 149 "frontend/Parser.y"
            { delete ((*yyvaluep).switchStmt); }
#line 2083 "generated/Parser.cpp"
        break;

    case YYSYMBOL_CaseStmtList: /* CaseStmtList  */
#line 149 "frontend/Parser.y"
            { delete ((*yyvaluep).caseStmtList); }
#line 2089 "generated/Parser.cpp"
        break;

    case YYSYMBOL_CaseStmt: /* CaseStmt  */
#line 150 "frontend/Parser.y"
            { delete ((*yyvaluep).caseStmt); }
#line 2095 "generated/Parser.cpp"
        break;

    case YYSYMBOL_ForStmt: /* ForStmt  */
#line 150 "frontend/Parser.y"
            { delete ((*yyvaluep).forStmt); }
#line 2101 "generated/Parser.cpp"
        break;

    case YYSYMBOL_DoStmt: /* DoStmt  */
#line 150 "frontend/Parser.y"
            { delete ((*yyvaluep).doStmt); }
#line 2107 "generated/Parser.cpp"
        break;

    case YYSYMBOL_WhileStmt: /* WhileStmt  */
#line 150 "frontend/Parser.y"
            { delete ((*yyvaluep).whileStmt); }
#line 2113 "generated/Parser.cpp"
        break;

    case YYSYMBOL_ContinueStmt: /* ContinueStmt  */
#line 151 "frontend/Parser.y"
            { delete ((*yyvaluep).continueStmt); }
#line 2119 "generated/Parser.cpp"
        break;

    case YYSYMBOL_BreakStmt: /* BreakStmt  */
#line 151 "frontend/Parser.y"
            { delete ((*yyvaluep).breakStmt); }
#line 2125 "generated/Parser.cpp"
        break;

    case YYSYMBOL_ReturnStmt: /* ReturnStmt  */
#line 151 "frontend/Parser.y"
            { delete ((*yyvaluep).returnStmt); }
#line 2131 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Block: /* Block  */
#line 145 "frontend/Parser.y"
            { delete ((*yyvaluep).block); }
#line 2137 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Expr: /* Expr  */
#line 148 "frontend/Parser.y"
            { delete ((*yyvaluep).expr); }
#line 2143 "generated/Parser.cpp"
        break;

    case YYSYMBOL_ExprList: /* ExprList  */
#line 148 "frontend/Parser.y"
            { delete ((*yyvaluep).exprList); }
#line 2149 "generated/Parser.cpp"
        break;

    case YYSYMBOL_Constant: /* Constant  */
#line 148 "frontend/Parser.y"
            { delete ((*yyvaluep).constant); }
#line 2155 "generated/Parser.cpp"
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
#line 2453 "generated/Parser.cpp"
    break;

  case 3: /* Decls: Decls Decl  */
#line 255 "frontend/Parser.y"
                                { (yyval.decls) = (yyvsp[-1].decls); (yyval.decls)->push_back((yyvsp[0].decl)); }
#line 2459 "generated/Parser.cpp"
    break;

  case 4: /* Decls: %empty  */
#line 256 "frontend/Parser.y"
                                { (yyval.decls) = new AST::Decls(); }
#line 2465 "generated/Parser.cpp"
    break;

  case 5: /* Decl: FuncDecl  */
#line 259 "frontend/Parser.y"
                                { (yyval.decl) = (yyvsp[0].funcDecl); }
#line 2471 "generated/Parser.cpp"
    break;

  case 6: /* Decl: VarDecl  */
#line 260 "frontend/Parser.y"
                                { (yyval.decl) = (yyvsp[0].varDecl); }
#line 2477 "generated/Parser.cpp"
    break;

  case 7: /* Decl: TypeDecl  */
#line 261 "frontend/Parser.y"
                                { (yyval.decl) = (yyvsp[0].typeDecl); }
#line 2483 "generated/Parser.cpp"
    break;

  case 8: /* Decl: TypedefDecl  */
#line 262 "frontend/Parser.y"
                                { (yyval.decl) = (yyvsp[0].typedefDecl); }
#line 2489 "generated/Parser.cpp"
    break;

  case 9: /* TypedefDecl: TYPEDEF VarType IDENTIFIER SEMICOLON  */
#line 268 "frontend/Parser.y"
                                { (yyval.typedefDecl) = new AST::TypedefDecl((yyvsp[-2].varType), *(yyvsp[-1].idVal)); }
#line 2495 "generated/Parser.cpp"
    break;

  case 10: /* TypedefDecl: TYPEDEF STRUCT IDENTIFIER LBRACE FieldDecls RBRACE IDENTIFIER SEMICOLON  */
#line 270 "frontend/Parser.y"
                                { (yyval.typedefDecl) = new AST::TypedefDecl(
                                      new AST::StructType((yyvsp[-3].fieldDecls), *(yyvsp[-5].idVal)), *(yyvsp[-1].idVal)); }
#line 2502 "generated/Parser.cpp"
    break;

  case 11: /* TypedefDecl: TYPEDEF UNION IDENTIFIER LBRACE FieldDecls RBRACE IDENTIFIER SEMICOLON  */
#line 273 "frontend/Parser.y"
                                { (yyval.typedefDecl) = new AST::TypedefDecl(
                                      new AST::UnionType((yyvsp[-3].fieldDecls), *(yyvsp[-5].idVal)), *(yyvsp[-1].idVal)); }
#line 2509 "generated/Parser.cpp"
    break;

  case 12: /* FuncDecl: STATIC VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES SEMICOLON  */
#line 278 "frontend/Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList));
                                  (yyval.funcDecl)->isStatic_ = true;
                                  (yyval.funcDecl)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 2517 "generated/Parser.cpp"
    break;

  case 13: /* FuncDecl: STATIC VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES FuncBody  */
#line 282 "frontend/Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList), (yyvsp[0].funcBody));
                                  (yyval.funcDecl)->isStatic_ = true;
                                  (yyval.funcDecl)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 2525 "generated/Parser.cpp"
    break;

  case 14: /* FuncDecl: VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES SEMICOLON  */
#line 286 "frontend/Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList));
                                  (yyval.funcDecl)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 2532 "generated/Parser.cpp"
    break;

  case 15: /* FuncDecl: VarType IDENTIFIER LPARENTHESES ParamList RPARENTHESES FuncBody  */
#line 289 "frontend/Parser.y"
                                { (yyval.funcDecl) = new AST::FuncDecl((yyvsp[-5].varType), *(yyvsp[-4].idVal), (yyvsp[-2].paramList), (yyvsp[0].funcBody));
                                  (yyval.funcDecl)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 2539 "generated/Parser.cpp"
    break;

  case 16: /* FuncBody: LBRACE Stmts RBRACE  */
#line 293 "frontend/Parser.y"
                                { (yyval.funcBody) = new AST::FuncBody((yyvsp[-1].stmts)); }
#line 2545 "generated/Parser.cpp"
    break;

  case 17: /* VarDecl: STATIC VarType VarList SEMICOLON  */
#line 297 "frontend/Parser.y"
                                { (yyval.varDecl) = new AST::VarDecl((yyvsp[-2].varType), (yyvsp[-1].varList)); (yyval.varDecl)->isStatic_ = true;
                                  (yyval.varDecl)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 2552 "generated/Parser.cpp"
    break;

  case 18: /* VarDecl: VarType VarList SEMICOLON  */
#line 300 "frontend/Parser.y"
                                { (yyval.varDecl) = new AST::VarDecl((yyvsp[-2].varType), (yyvsp[-1].varList));
                                  (yyval.varDecl)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 2559 "generated/Parser.cpp"
    break;

  case 19: /* TypeDecl: _VarType SEMICOLON  */
#line 304 "frontend/Parser.y"
                                { (yyval.typeDecl) = new AST::TypeDecl((yyvsp[-1].varType)); }
#line 2565 "generated/Parser.cpp"
    break;

  case 20: /* VarType: _VarType  */
#line 309 "frontend/Parser.y"
                                { (yyval.varType) = (yyvsp[0].varType); }
#line 2571 "generated/Parser.cpp"
    break;

  case 21: /* VarType: CONST _VarType  */
#line 310 "frontend/Parser.y"
                                { (yyval.varType) = (yyvsp[0].varType); (yyval.varType)->setConst(); }
#line 2577 "generated/Parser.cpp"
    break;

  case 22: /* _VarType: BuiltinType  */
#line 313 "frontend/Parser.y"
                                { (yyval.varType) = (yyvsp[0].builtinType); }
#line 2583 "generated/Parser.cpp"
    break;

  case 23: /* _VarType: STRUCT IDENTIFIER LBRACE FieldDecls RBRACE  */
#line 315 "frontend/Parser.y"
                                { (yyval.varType) = new AST::StructType((yyvsp[-1].fieldDecls), *(yyvsp[-3].idVal)); }
#line 2589 "generated/Parser.cpp"
    break;

  case 24: /* _VarType: STRUCT IDENTIFIER  */
#line 316 "frontend/Parser.y"
                                { (yyval.varType) = new AST::DefinedType(*(yyvsp[0].idVal)); }
#line 2595 "generated/Parser.cpp"
    break;

  case 25: /* _VarType: UNION IDENTIFIER LBRACE FieldDecls RBRACE  */
#line 318 "frontend/Parser.y"
                                { (yyval.varType) = new AST::UnionType((yyvsp[-1].fieldDecls), *(yyvsp[-3].idVal)); }
#line 2601 "generated/Parser.cpp"
    break;

  case 26: /* _VarType: UNION IDENTIFIER  */
#line 319 "frontend/Parser.y"
                                { (yyval.varType) = new AST::DefinedType(*(yyvsp[0].idVal)); }
#line 2607 "generated/Parser.cpp"
    break;

  case 27: /* _VarType: ENUM IDENTIFIER LBRACE EnumList RBRACE  */
#line 321 "frontend/Parser.y"
                                { (yyval.varType) = new AST::EnumType((yyvsp[-1].enumList), *(yyvsp[-3].idVal)); }
#line 2613 "generated/Parser.cpp"
    break;

  case 28: /* _VarType: ENUM IDENTIFIER  */
#line 322 "frontend/Parser.y"
                                { (yyval.varType) = new AST::DefinedType(*(yyvsp[0].idVal)); }
#line 2619 "generated/Parser.cpp"
    break;

  case 29: /* _VarType: _VarType ASTERISK  */
#line 323 "frontend/Parser.y"
                                { (yyval.varType) = new AST::PointerType((yyvsp[-1].varType)); }
#line 2625 "generated/Parser.cpp"
    break;

  case 30: /* _VarType: IDENTIFIER  */
#line 324 "frontend/Parser.y"
                                { (yyval.varType) = new AST::DefinedType(*(yyvsp[0].idVal)); }
#line 2631 "generated/Parser.cpp"
    break;

  case 31: /* VarList: VarList COMMA VarInit  */
#line 331 "frontend/Parser.y"
                                { (yyval.varList) = (yyvsp[-2].varList); (yyval.varList)->push_back((yyvsp[0].varInit)); }
#line 2637 "generated/Parser.cpp"
    break;

  case 32: /* VarList: VarInit  */
#line 332 "frontend/Parser.y"
                                { (yyval.varList) = new AST::VarList(); (yyval.varList)->push_back((yyvsp[0].varInit)); }
#line 2643 "generated/Parser.cpp"
    break;

  case 33: /* VarList: %empty  */
#line 333 "frontend/Parser.y"
                                { (yyval.varList) = new AST::VarList(); }
#line 2649 "generated/Parser.cpp"
    break;

  case 34: /* VarInit: IDENTIFIER ArrayBoundList  */
#line 339 "frontend/Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-1].idVal), *(yyvsp[0].arrayBoundList)); delete (yyvsp[0].arrayBoundList); }
#line 2655 "generated/Parser.cpp"
    break;

  case 35: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN Expr  */
#line 341 "frontend/Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-3].idVal), *(yyvsp[-2].arrayBoundList), (yyvsp[0].expr)); delete (yyvsp[-2].arrayBoundList); }
#line 2661 "generated/Parser.cpp"
    break;

  case 36: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN LBRACE InitList RBRACE  */
#line 343 "frontend/Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-5].idVal), *(yyvsp[-4].arrayBoundList), nullptr, (yyvsp[-1].initList));
                                  delete (yyvsp[-4].arrayBoundList); }
#line 2668 "generated/Parser.cpp"
    break;

  case 37: /* VarInit: IDENTIFIER ArrayBoundList ASSIGN LBRACE RBRACE  */
#line 346 "frontend/Parser.y"
                                { (yyval.varInit) = new AST::VarInit(*(yyvsp[-4].idVal), *(yyvsp[-3].arrayBoundList), nullptr,
                                                        new AST::InitList());
                                  delete (yyvsp[-3].arrayBoundList); }
#line 2676 "generated/Parser.cpp"
    break;

  case 38: /* InitList: InitList COMMA InitItem  */
#line 354 "frontend/Parser.y"
                                { (yyval.initList) = (yyvsp[-2].initList); (yyval.initList)->push_back((yyvsp[0].initElement)); }
#line 2682 "generated/Parser.cpp"
    break;

  case 39: /* InitList: InitItem  */
#line 356 "frontend/Parser.y"
                                { (yyval.initList) = new AST::InitList(); (yyval.initList)->push_back((yyvsp[0].initElement)); }
#line 2688 "generated/Parser.cpp"
    break;

  case 40: /* InitItem: Expr  */
#line 361 "frontend/Parser.y"
                                { (yyval.initElement) = new AST::InitElement((yyvsp[0].expr)); }
#line 2694 "generated/Parser.cpp"
    break;

  case 41: /* InitItem: LBRACE InitList RBRACE  */
#line 363 "frontend/Parser.y"
                                { (yyval.initElement) = new AST::InitElement((yyvsp[-1].initList)); }
#line 2700 "generated/Parser.cpp"
    break;

  case 42: /* ArrayBoundList: ArrayBoundList ArrayBound  */
#line 371 "frontend/Parser.y"
                                { (yyval.arrayBoundList) = (yyvsp[-1].arrayBoundList); (yyval.arrayBoundList)->push_back((yyvsp[0].sizeVal)); }
#line 2706 "generated/Parser.cpp"
    break;

  case 43: /* ArrayBoundList: ArrayBound  */
#line 373 "frontend/Parser.y"
                                { (yyval.arrayBoundList) = new std::vector<size_t>(); (yyval.arrayBoundList)->push_back((yyvsp[0].sizeVal)); }
#line 2712 "generated/Parser.cpp"
    break;

  case 44: /* ArrayBoundList: %empty  */
#line 374 "frontend/Parser.y"
                                { (yyval.arrayBoundList) = new std::vector<size_t>(); }
#line 2718 "generated/Parser.cpp"
    break;

  case 45: /* ArrayBound: LBRACKET INTEGER RBRACKET  */
#line 378 "frontend/Parser.y"
                                { (yyval.sizeVal) = static_cast<size_t>((yyvsp[-1].intVal)); }
#line 2724 "generated/Parser.cpp"
    break;

  case 46: /* ArrayBound: LBRACKET RBRACKET  */
#line 380 "frontend/Parser.y"
                                { (yyval.sizeVal) = AST::kInferredArrayBound; }
#line 2730 "generated/Parser.cpp"
    break;

  case 47: /* ParamList: ParamList COMMA Param  */
#line 386 "frontend/Parser.y"
                                { (yyval.paramList) = (yyvsp[-2].paramList); (yyval.paramList)->push_back((yyvsp[0].param)); }
#line 2736 "generated/Parser.cpp"
    break;

  case 48: /* ParamList: ParamList COMMA ELLIPSES  */
#line 388 "frontend/Parser.y"
                                { (yyval.paramList) = (yyvsp[-2].paramList); (yyval.paramList)->setVariant(); }
#line 2742 "generated/Parser.cpp"
    break;

  case 49: /* ParamList: Param  */
#line 389 "frontend/Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); (yyval.paramList)->push_back((yyvsp[0].param)); }
#line 2748 "generated/Parser.cpp"
    break;

  case 50: /* ParamList: ELLIPSES  */
#line 390 "frontend/Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); (yyval.paramList)->setVariant(); }
#line 2754 "generated/Parser.cpp"
    break;

  case 51: /* ParamList: %empty  */
#line 391 "frontend/Parser.y"
                                { (yyval.paramList) = new AST::ParamList(); }
#line 2760 "generated/Parser.cpp"
    break;

  case 52: /* Param: VarType IDENTIFIER  */
#line 394 "frontend/Parser.y"
                                { (yyval.param) = new AST::Param((yyvsp[-1].varType), *(yyvsp[0].idVal)); }
#line 2766 "generated/Parser.cpp"
    break;

  case 53: /* Param: VarType  */
#line 395 "frontend/Parser.y"
                                { (yyval.param) = new AST::Param((yyvsp[0].varType)); }
#line 2772 "generated/Parser.cpp"
    break;

  case 54: /* BuiltinType: CHAR  */
#line 399 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::CHAR, "char"); }
#line 2778 "generated/Parser.cpp"
    break;

  case 55: /* BuiltinType: SHORT  */
#line 400 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::SHORT, "short"); }
#line 2784 "generated/Parser.cpp"
    break;

  case 56: /* BuiltinType: INT  */
#line 401 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::INT, "int"); }
#line 2790 "generated/Parser.cpp"
    break;

  case 57: /* BuiltinType: LONG  */
#line 402 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::LONG, "long"); }
#line 2796 "generated/Parser.cpp"
    break;

  case 58: /* BuiltinType: UNSIGNED  */
#line 403 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::UINT, "uint"); }
#line 2802 "generated/Parser.cpp"
    break;

  case 59: /* BuiltinType: UNSIGNED CHAR  */
#line 404 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::UCHAR, "uchar"); }
#line 2808 "generated/Parser.cpp"
    break;

  case 60: /* BuiltinType: UNSIGNED SHORT  */
#line 405 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::USHORT, "ushort"); }
#line 2814 "generated/Parser.cpp"
    break;

  case 61: /* BuiltinType: UNSIGNED INT  */
#line 406 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::UINT, "uint"); }
#line 2820 "generated/Parser.cpp"
    break;

  case 62: /* BuiltinType: UNSIGNED LONG  */
#line 407 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::ULONG, "ulong"); }
#line 2826 "generated/Parser.cpp"
    break;

  case 63: /* BuiltinType: FLOAT  */
#line 408 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::FLOAT, "float"); }
#line 2832 "generated/Parser.cpp"
    break;

  case 64: /* BuiltinType: DOUBLE  */
#line 409 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::DOUBLE, "double"); }
#line 2838 "generated/Parser.cpp"
    break;

  case 65: /* BuiltinType: BOOL  */
#line 410 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::BOOL, "bool"); }
#line 2844 "generated/Parser.cpp"
    break;

  case 66: /* BuiltinType: VOID  */
#line 411 "frontend/Parser.y"
                                { (yyval.builtinType) = new AST::BuiltinType(AST::BuiltinTypeId::VOID, "void"); }
#line 2850 "generated/Parser.cpp"
    break;

  case 67: /* FieldDecls: FieldDecls FieldDecl  */
#line 417 "frontend/Parser.y"
                                { (yyval.fieldDecls) = (yyvsp[-1].fieldDecls); if ((yyvsp[0].fieldDecl) != nullptr) (yyval.fieldDecls)->push_back((yyvsp[0].fieldDecl)); }
#line 2856 "generated/Parser.cpp"
    break;

  case 68: /* FieldDecls: %empty  */
#line 418 "frontend/Parser.y"
                                { (yyval.fieldDecls) = new AST::FieldDecls(); }
#line 2862 "generated/Parser.cpp"
    break;

  case 69: /* FieldDecl: VarType MemberList SEMICOLON  */
#line 422 "frontend/Parser.y"
                                { (yyval.fieldDecl) = new AST::FieldDecl((yyvsp[-2].varType), (yyvsp[-1].memberList)); }
#line 2868 "generated/Parser.cpp"
    break;

  case 70: /* FieldDecl: SEMICOLON  */
#line 423 "frontend/Parser.y"
                                { (yyval.fieldDecl) = nullptr; }
#line 2874 "generated/Parser.cpp"
    break;

  case 71: /* MemberList: MemberList COMMA IDENTIFIER  */
#line 429 "frontend/Parser.y"
                                { (yyval.memberList) = (yyvsp[-2].memberList); (yyval.memberList)->push_back(*(yyvsp[0].idVal)); }
#line 2880 "generated/Parser.cpp"
    break;

  case 72: /* MemberList: IDENTIFIER  */
#line 430 "frontend/Parser.y"
                                { (yyval.memberList) = new AST::MemberList(); (yyval.memberList)->push_back(*(yyvsp[0].idVal)); }
#line 2886 "generated/Parser.cpp"
    break;

  case 73: /* MemberList: %empty  */
#line 431 "frontend/Parser.y"
                                { (yyval.memberList) = new AST::MemberList(); }
#line 2892 "generated/Parser.cpp"
    break;

  case 74: /* EnumList: EnumList COMMA Enum  */
#line 437 "frontend/Parser.y"
                                { (yyval.enumList) = (yyvsp[-2].enumList); (yyval.enumList)->push_back((yyvsp[0].enumeration)); }
#line 2898 "generated/Parser.cpp"
    break;

  case 75: /* EnumList: Enum  */
#line 438 "frontend/Parser.y"
                                { (yyval.enumList) = new AST::EnumList(); (yyval.enumList)->push_back((yyvsp[0].enumeration)); }
#line 2904 "generated/Parser.cpp"
    break;

  case 76: /* EnumList: %empty  */
#line 439 "frontend/Parser.y"
                                { (yyval.enumList) = new AST::EnumList(); }
#line 2910 "generated/Parser.cpp"
    break;

  case 77: /* Enum: IDENTIFIER  */
#line 442 "frontend/Parser.y"
                                { (yyval.enumeration) = new AST::Enum(*(yyvsp[0].idVal)); }
#line 2916 "generated/Parser.cpp"
    break;

  case 78: /* Enum: IDENTIFIER ASSIGN INTEGER  */
#line 444 "frontend/Parser.y"
                                { (yyval.enumeration) = new AST::Enum(*(yyvsp[-2].idVal), true, (yyvsp[0].intVal)); }
#line 2922 "generated/Parser.cpp"
    break;

  case 79: /* Enum: IDENTIFIER ASSIGN SUB INTEGER  */
#line 448 "frontend/Parser.y"
                                { (yyval.enumeration) = new AST::Enum(*(yyvsp[-3].idVal), true, -(yyvsp[0].intVal)); }
#line 2928 "generated/Parser.cpp"
    break;

  case 80: /* Stmts: Stmts Stmt  */
#line 457 "frontend/Parser.y"
                                { (yyval.stmts) = (yyvsp[-1].stmts); if ((yyvsp[0].stmt) != nullptr) (yyval.stmts)->push_back((yyvsp[0].stmt)); }
#line 2934 "generated/Parser.cpp"
    break;

  case 81: /* Stmts: %empty  */
#line 458 "frontend/Parser.y"
                                { (yyval.stmts) = new AST::Stmts(); }
#line 2940 "generated/Parser.cpp"
    break;

  case 82: /* Stmt: Expr SEMICOLON  */
#line 461 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[-1].expr); (yyval.stmt)->setLoc((yylsp[-1]).first_line, (yylsp[-1]).first_column); }
#line 2946 "generated/Parser.cpp"
    break;

  case 83: /* Stmt: IfStmt  */
#line 462 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].ifStmt); }
#line 2952 "generated/Parser.cpp"
    break;

  case 84: /* Stmt: SwitchStmt  */
#line 463 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].switchStmt); }
#line 2958 "generated/Parser.cpp"
    break;

  case 85: /* Stmt: ForStmt  */
#line 464 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].forStmt); }
#line 2964 "generated/Parser.cpp"
    break;

  case 86: /* Stmt: DoStmt  */
#line 465 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].doStmt); }
#line 2970 "generated/Parser.cpp"
    break;

  case 87: /* Stmt: WhileStmt  */
#line 466 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].whileStmt); }
#line 2976 "generated/Parser.cpp"
    break;

  case 88: /* Stmt: ContinueStmt  */
#line 467 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].continueStmt); }
#line 2982 "generated/Parser.cpp"
    break;

  case 89: /* Stmt: BreakStmt  */
#line 468 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].breakStmt); }
#line 2988 "generated/Parser.cpp"
    break;

  case 90: /* Stmt: ReturnStmt  */
#line 469 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].returnStmt); }
#line 2994 "generated/Parser.cpp"
    break;

  case 91: /* Stmt: Block  */
#line 470 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].block); }
#line 3000 "generated/Parser.cpp"
    break;

  case 92: /* Stmt: TypeDecl  */
#line 471 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].typeDecl); }
#line 3006 "generated/Parser.cpp"
    break;

  case 93: /* Stmt: VarDecl  */
#line 472 "frontend/Parser.y"
                                { (yyval.stmt) = (yyvsp[0].varDecl); }
#line 3012 "generated/Parser.cpp"
    break;

  case 94: /* Stmt: SEMICOLON  */
#line 473 "frontend/Parser.y"
                                { (yyval.stmt) = nullptr; }
#line 3018 "generated/Parser.cpp"
    break;

  case 95: /* IfStmt: IF LPARENTHESES Expr RPARENTHESES Stmt ELSE Stmt  */
#line 477 "frontend/Parser.y"
                                { (yyval.ifStmt) = new AST::IfStmt((yyvsp[-4].expr), (yyvsp[-2].stmt), (yyvsp[0].stmt));
                                  (yyval.ifStmt)->setLoc((yylsp[-6]).first_line, (yylsp[-6]).first_column); }
#line 3025 "generated/Parser.cpp"
    break;

  case 96: /* IfStmt: IF LPARENTHESES Expr RPARENTHESES Stmt  */
#line 480 "frontend/Parser.y"
                                { (yyval.ifStmt) = new AST::IfStmt((yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.ifStmt)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 3032 "generated/Parser.cpp"
    break;

  case 97: /* SwitchStmt: SWITCH LPARENTHESES Expr RPARENTHESES LBRACE CaseStmtList RBRACE  */
#line 487 "frontend/Parser.y"
                                { (yyval.switchStmt) = new AST::SwitchStmt((yyvsp[-4].expr), (yyvsp[-1].caseStmtList));
                                  (yyval.switchStmt)->setLoc((yylsp[-6]).first_line, (yylsp[-6]).first_column); }
#line 3039 "generated/Parser.cpp"
    break;

  case 98: /* CaseStmtList: CaseStmtList CaseStmt  */
#line 493 "frontend/Parser.y"
                                { (yyval.caseStmtList) = (yyvsp[-1].caseStmtList); (yyval.caseStmtList)->push_back((yyvsp[0].caseStmt)); }
#line 3045 "generated/Parser.cpp"
    break;

  case 99: /* CaseStmtList: %empty  */
#line 494 "frontend/Parser.y"
                                { (yyval.caseStmtList) = new AST::CaseStmtList(); }
#line 3051 "generated/Parser.cpp"
    break;

  case 100: /* CaseStmt: CASE Expr COLON Stmts  */
#line 498 "frontend/Parser.y"
                                { (yyval.caseStmt) = new AST::CaseStmt((yyvsp[-2].expr), (yyvsp[0].stmts));
                                  (yyval.caseStmt)->setLoc((yylsp[-3]).first_line, (yylsp[-3]).first_column); }
#line 3058 "generated/Parser.cpp"
    break;

  case 101: /* CaseStmt: DEFAULT COLON Stmts  */
#line 501 "frontend/Parser.y"
                                { (yyval.caseStmt) = new AST::CaseStmt(nullptr, (yyvsp[0].stmts));
                                  (yyval.caseStmt)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 3065 "generated/Parser.cpp"
    break;

  case 102: /* ForStmt: FOR LPARENTHESES Expr SEMICOLON Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 506 "frontend/Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt((yyvsp[-6].expr), (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.forStmt)->setLoc((yylsp[-8]).first_line, (yylsp[-8]).first_column); }
#line 3072 "generated/Parser.cpp"
    break;

  case 103: /* ForStmt: FOR LPARENTHESES SEMICOLON Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 509 "frontend/Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt(nullptr, (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.forStmt)->setLoc((yylsp[-7]).first_line, (yylsp[-7]).first_column); }
#line 3079 "generated/Parser.cpp"
    break;

  case 104: /* ForStmt: FOR LPARENTHESES VarDecl Expr SEMICOLON Expr RPARENTHESES Stmt  */
#line 512 "frontend/Parser.y"
                                { (yyval.forStmt) = new AST::ForStmt((yyvsp[-5].varDecl), (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.forStmt)->setLoc((yylsp[-7]).first_line, (yylsp[-7]).first_column); }
#line 3086 "generated/Parser.cpp"
    break;

  case 105: /* DoStmt: DO Stmt WHILE LPARENTHESES Expr RPARENTHESES SEMICOLON  */
#line 517 "frontend/Parser.y"
                                { (yyval.doStmt) = new AST::DoStmt((yyvsp[-5].stmt), (yyvsp[-2].expr));
                                  (yyval.doStmt)->setLoc((yylsp[-6]).first_line, (yylsp[-6]).first_column); }
#line 3093 "generated/Parser.cpp"
    break;

  case 106: /* WhileStmt: WHILE LPARENTHESES Expr RPARENTHESES Stmt  */
#line 522 "frontend/Parser.y"
                                { (yyval.whileStmt) = new AST::WhileStmt((yyvsp[-2].expr), (yyvsp[0].stmt));
                                  (yyval.whileStmt)->setLoc((yylsp[-4]).first_line, (yylsp[-4]).first_column); }
#line 3100 "generated/Parser.cpp"
    break;

  case 107: /* ContinueStmt: CONTINUE SEMICOLON  */
#line 527 "frontend/Parser.y"
                                { (yyval.continueStmt) = new AST::ContinueStmt();
                                  (yyval.continueStmt)->setLoc((yylsp[-1]).first_line, (yylsp[-1]).first_column); }
#line 3107 "generated/Parser.cpp"
    break;

  case 108: /* BreakStmt: BREAK SEMICOLON  */
#line 531 "frontend/Parser.y"
                                { (yyval.breakStmt) = new AST::BreakStmt();
                                  (yyval.breakStmt)->setLoc((yylsp[-1]).first_line, (yylsp[-1]).first_column); }
#line 3114 "generated/Parser.cpp"
    break;

  case 109: /* ReturnStmt: RETURN SEMICOLON  */
#line 535 "frontend/Parser.y"
                                { (yyval.returnStmt) = new AST::ReturnStmt();
                                  (yyval.returnStmt)->setLoc((yylsp[-1]).first_line, (yylsp[-1]).first_column); }
#line 3121 "generated/Parser.cpp"
    break;

  case 110: /* ReturnStmt: RETURN Expr SEMICOLON  */
#line 538 "frontend/Parser.y"
                                { (yyval.returnStmt) = new AST::ReturnStmt((yyvsp[-1].expr));
                                  (yyval.returnStmt)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 3128 "generated/Parser.cpp"
    break;

  case 111: /* Block: LBRACE Stmts RBRACE  */
#line 542 "frontend/Parser.y"
                                { (yyval.block) = new AST::Block((yyvsp[-1].stmts));
                                  (yyval.block)->setLoc((yylsp[-2]).first_line, (yylsp[-2]).first_column); }
#line 3135 "generated/Parser.cpp"
    break;

  case 112: /* Expr: IDENTIFIER  */
#line 557 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Variable(*(yyvsp[0].idVal)); }
#line 3141 "generated/Parser.cpp"
    break;

  case 113: /* Expr: Constant  */
#line 558 "frontend/Parser.y"
                                { (yyval.expr) = (yyvsp[0].constant); }
#line 3147 "generated/Parser.cpp"
    break;

  case 114: /* Expr: LPARENTHESES Expr RPARENTHESES  */
#line 560 "frontend/Parser.y"
                                { (yyval.expr) = (yyvsp[-1].expr); }
#line 3153 "generated/Parser.cpp"
    break;

  case 115: /* Expr: Expr COMMA Expr  */
#line 561 "frontend/Parser.y"
                                { (yyval.expr) = new AST::CommaExpr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3159 "generated/Parser.cpp"
    break;

  case 116: /* Expr: IDENTIFIER LPARENTHESES ExprList RPARENTHESES  */
#line 563 "frontend/Parser.y"
                                { (yyval.expr) = new AST::FuncCall(*(yyvsp[-3].idVal), (yyvsp[-1].exprList)); }
#line 3165 "generated/Parser.cpp"
    break;

  case 117: /* Expr: Expr DOT IDENTIFIER  */
#line 565 "frontend/Parser.y"
                                { (yyval.expr) = new AST::StructRef((yyvsp[-2].expr), *(yyvsp[0].idVal)); }
#line 3171 "generated/Parser.cpp"
    break;

  case 118: /* Expr: Expr ARROW IDENTIFIER  */
#line 567 "frontend/Parser.y"
                                { (yyval.expr) = new AST::StructDeref((yyvsp[-2].expr), *(yyvsp[0].idVal)); }
#line 3177 "generated/Parser.cpp"
    break;

  case 119: /* Expr: Expr LBRACKET Expr RBRACKET  */
#line 569 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Subscript((yyvsp[-3].expr), (yyvsp[-1].expr)); }
#line 3183 "generated/Parser.cpp"
    break;

  case 120: /* Expr: LPARENTHESES VarType RPARENTHESES Expr  */
#line 571 "frontend/Parser.y"
                                { (yyval.expr) = new AST::TypeCast((yyvsp[-2].varType), (yyvsp[0].expr)); }
#line 3189 "generated/Parser.cpp"
    break;

  case 121: /* Expr: SIZEOF LPARENTHESES VarType RPARENTHESES  */
#line 573 "frontend/Parser.y"
                                { (yyval.expr) = new AST::SizeOf((yyvsp[-1].varType)); }
#line 3195 "generated/Parser.cpp"
    break;

  case 122: /* Expr: SIZEOF LPARENTHESES Expr RPARENTHESES  */
#line 575 "frontend/Parser.y"
                                { (yyval.expr) = new AST::SizeOf((yyvsp[-1].expr)); }
#line 3201 "generated/Parser.cpp"
    break;

  case 123: /* Expr: SIZEOF LPARENTHESES IDENTIFIER RPARENTHESES  */
#line 577 "frontend/Parser.y"
                                { (yyval.expr) = new AST::SizeOf(*(yyvsp[-1].idVal)); }
#line 3207 "generated/Parser.cpp"
    break;

  case 124: /* Expr: ADD Expr  */
#line 579 "frontend/Parser.y"
                                { (yyval.expr) = new AST::UnaryPlus((yyvsp[0].expr)); }
#line 3213 "generated/Parser.cpp"
    break;

  case 125: /* Expr: SUB Expr  */
#line 581 "frontend/Parser.y"
                                { (yyval.expr) = new AST::UnaryMinus((yyvsp[0].expr)); }
#line 3219 "generated/Parser.cpp"
    break;

  case 126: /* Expr: ASTERISK Expr  */
#line 583 "frontend/Parser.y"
                                { (yyval.expr) = new AST::PointerDeref((yyvsp[0].expr)); }
#line 3225 "generated/Parser.cpp"
    break;

  case 127: /* Expr: AMPERSAND Expr  */
#line 585 "frontend/Parser.y"
                                { (yyval.expr) = new AST::AddressOf((yyvsp[0].expr)); }
#line 3231 "generated/Parser.cpp"
    break;

  case 128: /* Expr: Expr ASSIGN Expr  */
#line 586 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Assign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3237 "generated/Parser.cpp"
    break;

  case 129: /* Expr: Expr ADD Expr  */
#line 588 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Add((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3243 "generated/Parser.cpp"
    break;

  case 130: /* Expr: Expr SUB Expr  */
#line 590 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Sub((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3249 "generated/Parser.cpp"
    break;

  case 131: /* Expr: Expr ASTERISK Expr  */
#line 592 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Mul((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3255 "generated/Parser.cpp"
    break;

  case 132: /* Expr: Expr DIV Expr  */
#line 593 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Div((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3261 "generated/Parser.cpp"
    break;

  case 133: /* Expr: Expr MOD Expr  */
#line 594 "frontend/Parser.y"
                                { (yyval.expr) = new AST::Mod((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3267 "generated/Parser.cpp"
    break;

  case 134: /* Expr: Expr DADD  */
#line 596 "frontend/Parser.y"
                                { (yyval.expr) = new AST::PostfixInc((yyvsp[-1].expr)); }
#line 3273 "generated/Parser.cpp"
    break;

  case 135: /* Expr: Expr DSUB  */
#line 598 "frontend/Parser.y"
                                { (yyval.expr) = new AST::PostfixDec((yyvsp[-1].expr)); }
#line 3279 "generated/Parser.cpp"
    break;

  case 136: /* Expr: DADD Expr  */
#line 600 "frontend/Parser.y"
                                { (yyval.expr) = new AST::PrefixInc((yyvsp[0].expr)); }
#line 3285 "generated/Parser.cpp"
    break;

  case 137: /* Expr: DSUB Expr  */
#line 602 "frontend/Parser.y"
                                { (yyval.expr) = new AST::PrefixDec((yyvsp[0].expr)); }
#line 3291 "generated/Parser.cpp"
    break;

  case 138: /* Expr: Expr ADDEQ Expr  */
#line 603 "frontend/Parser.y"
                                { (yyval.expr) = new AST::AddAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3297 "generated/Parser.cpp"
    break;

  case 139: /* Expr: Expr SUBEQ Expr  */
#line 604 "frontend/Parser.y"
                                { (yyval.expr) = new AST::SubAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3303 "generated/Parser.cpp"
    break;

  case 140: /* Expr: Expr MULEQ Expr  */
#line 605 "frontend/Parser.y"
                                { (yyval.expr) = new AST::MulAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3309 "generated/Parser.cpp"
    break;

  case 141: /* Expr: Expr DIVEQ Expr  */
#line 606 "frontend/Parser.y"
                                { (yyval.expr) = new AST::DivAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3315 "generated/Parser.cpp"
    break;

  case 142: /* Expr: Expr MODEQ Expr  */
#line 607 "frontend/Parser.y"
                                { (yyval.expr) = new AST::ModAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3321 "generated/Parser.cpp"
    break;

  case 143: /* Expr: Expr AMPERSAND Expr  */
#line 609 "frontend/Parser.y"
                                { (yyval.expr) = new AST::BitwiseAnd((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3327 "generated/Parser.cpp"
    break;

  case 144: /* Expr: Expr BOR Expr  */
#line 610 "frontend/Parser.y"
                                { (yyval.expr) = new AST::BitwiseOr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3333 "generated/Parser.cpp"
    break;

  case 145: /* Expr: Expr BXOR Expr  */
#line 611 "frontend/Parser.y"
                                { (yyval.expr) = new AST::BitwiseXor((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3339 "generated/Parser.cpp"
    break;

  case 146: /* Expr: BNOT Expr  */
#line 612 "frontend/Parser.y"
                                { (yyval.expr) = new AST::BitwiseNot((yyvsp[0].expr)); }
#line 3345 "generated/Parser.cpp"
    break;

  case 147: /* Expr: Expr BANDEQ Expr  */
#line 613 "frontend/Parser.y"
                                { (yyval.expr) = new AST::BitwiseAndAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3351 "generated/Parser.cpp"
    break;

  case 148: /* Expr: Expr BOREQ Expr  */
#line 614 "frontend/Parser.y"
                                { (yyval.expr) = new AST::BitwiseOrAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3357 "generated/Parser.cpp"
    break;

  case 149: /* Expr: Expr BXOREQ Expr  */
#line 615 "frontend/Parser.y"
                                { (yyval.expr) = new AST::BitwiseXorAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3363 "generated/Parser.cpp"
    break;

  case 150: /* Expr: Expr SHL Expr  */
#line 616 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LeftShift((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3369 "generated/Parser.cpp"
    break;

  case 151: /* Expr: Expr SHR Expr  */
#line 617 "frontend/Parser.y"
                                { (yyval.expr) = new AST::RightShift((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3375 "generated/Parser.cpp"
    break;

  case 152: /* Expr: Expr SHLEQ Expr  */
#line 618 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LeftShiftAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3381 "generated/Parser.cpp"
    break;

  case 153: /* Expr: Expr SHREQ Expr  */
#line 619 "frontend/Parser.y"
                                { (yyval.expr) = new AST::RightShiftAssign((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3387 "generated/Parser.cpp"
    break;

  case 154: /* Expr: Expr AND Expr  */
#line 620 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicAnd((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3393 "generated/Parser.cpp"
    break;

  case 155: /* Expr: Expr OR Expr  */
#line 621 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicOr((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3399 "generated/Parser.cpp"
    break;

  case 156: /* Expr: NOT Expr  */
#line 622 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicNot((yyvsp[0].expr)); }
#line 3405 "generated/Parser.cpp"
    break;

  case 157: /* Expr: Expr EQ Expr  */
#line 623 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3411 "generated/Parser.cpp"
    break;

  case 158: /* Expr: Expr NEQ Expr  */
#line 624 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicNotEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3417 "generated/Parser.cpp"
    break;

  case 159: /* Expr: Expr LT Expr  */
#line 625 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicLessThan((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3423 "generated/Parser.cpp"
    break;

  case 160: /* Expr: Expr LE Expr  */
#line 626 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicLessEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3429 "generated/Parser.cpp"
    break;

  case 161: /* Expr: Expr GT Expr  */
#line 627 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicGreaterThan((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3435 "generated/Parser.cpp"
    break;

  case 162: /* Expr: Expr GE Expr  */
#line 628 "frontend/Parser.y"
                                { (yyval.expr) = new AST::LogicGreaterEq((yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3441 "generated/Parser.cpp"
    break;

  case 163: /* Expr: Expr QUESTION Expr COLON Expr  */
#line 630 "frontend/Parser.y"
                                { (yyval.expr) = new AST::TernaryCondition((yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].expr)); }
#line 3447 "generated/Parser.cpp"
    break;

  case 164: /* ExprList: ExprList COMMA Expr  */
#line 634 "frontend/Parser.y"
                                { (yyval.exprList) = (yyvsp[-2].exprList); (yyval.exprList)->push_back((yyvsp[0].expr)); }
#line 3453 "generated/Parser.cpp"
    break;

  case 165: /* ExprList: Expr  */
#line 635 "frontend/Parser.y"
                                { (yyval.exprList) = new AST::ExprList(); (yyval.exprList)->push_back((yyvsp[0].expr)); }
#line 3459 "generated/Parser.cpp"
    break;

  case 166: /* ExprList: %empty  */
#line 636 "frontend/Parser.y"
                                { (yyval.exprList) = new AST::ExprList(); }
#line 3465 "generated/Parser.cpp"
    break;

  case 167: /* Constant: CHARACTER  */
#line 639 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].charVal)); }
#line 3471 "generated/Parser.cpp"
    break;

  case 168: /* Constant: INTEGER  */
#line 640 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].intVal)); }
#line 3477 "generated/Parser.cpp"
    break;

  case 169: /* Constant: UINTEGER  */
#line 641 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].uintVal)); }
#line 3483 "generated/Parser.cpp"
    break;

  case 170: /* Constant: LONGVAL  */
#line 642 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].longVal)); }
#line 3489 "generated/Parser.cpp"
    break;

  case 171: /* Constant: ULONGVAL  */
#line 643 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].ulongVal)); }
#line 3495 "generated/Parser.cpp"
    break;

  case 172: /* Constant: FLOATVAL  */
#line 644 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].floatVal)); }
#line 3501 "generated/Parser.cpp"
    break;

  case 173: /* Constant: DOUBLEVAL  */
#line 645 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant((yyvsp[0].doubleVal)); }
#line 3507 "generated/Parser.cpp"
    break;

  case 174: /* Constant: STRING  */
#line 646 "frontend/Parser.y"
                                { (yyval.constant) = new AST::ConstStr(*(yyvsp[0].strVal)); }
#line 3513 "generated/Parser.cpp"
    break;

  case 175: /* Constant: TRUE  */
#line 647 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant(true); }
#line 3519 "generated/Parser.cpp"
    break;

  case 176: /* Constant: FALSE  */
#line 648 "frontend/Parser.y"
                                { (yyval.constant) = new AST::Constant(false); }
#line 3525 "generated/Parser.cpp"
    break;


#line 3529 "generated/Parser.cpp"

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

#line 651 "frontend/Parser.y"


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
