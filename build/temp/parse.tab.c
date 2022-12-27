/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     RMO = 258,
     LMO = 259,
     MEQ = 260,
     LEQ = 261,
     INTEGER = 262,
     STRING = 263,
     VAR = 264,
     PATH = 265,
     PREFIXES_VAR = 266,
     IF = 267,
     WHILE = 268,
     EOL = 269
   };
#endif
/* Tokens.  */
#define RMO 258
#define LMO 259
#define MEQ 260
#define LEQ 261
#define INTEGER 262
#define STRING 263
#define VAR 264
#define PATH 265
#define PREFIXES_VAR 266
#define IF 267
#define WHILE 268
#define EOL 269




/* Copy the first part of user declarations.  */
#line 1 "parse.y"

    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "define.c"
    #include "asmapper.c"
    #include "code.cpp"
    #include "asmapper.h"
    #include "asmapper.cpp"

    extern FILE* yyin;
    FILE *out_asm;
    extern int yylex();
    extern int yylineno;

    Code* c = new Code();
    AsmMapper* am = AsmMapper::GetInstance(c);

    void yyerror(char *s){
        fprintf(stderr, "[error]line %d: %s\n", yylineno, s);
    }

    int open(int argc, char **argv){
        if(argc > 1){
            if(!(yyin = fopen(argv[1], "r"))){
                printf("[error] infile open failed\n");
                return 0;
            }
            else {
                if(!(out_asm = fopen(argv[2], "w"))){
                    printf("[error] outfile open failed\n");
                    return 0;
                }
            }
        }
        else{
            yyin = stdin;
        }
        return 1;
    }


/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 42 "parse.y"
{
    int i;
    char* s;
    char c;
    double f;
}
/* Line 193 of yacc.c.  */
#line 173 "parse.tab.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 186 "parse.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

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
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
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
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  37
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   304

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  34
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  24
/* YYNRULES -- Number of rules.  */
#define YYNRULES  70
/* YYNRULES -- Number of states.  */
#define YYNSTATES  168

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   269

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     6,     2,     2,    32,     2,
      24,    25,    13,    11,    29,    12,    30,    14,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    26,    23,
       3,     5,     4,     2,    33,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,    31,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    27,     2,    28,     2,     2,     2,     2,
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
       2,     2,     2,     2,     2,     2,     1,     2,     7,     8,
       9,    10,    15,    16,    17,    18,    19,    20,    21,    22
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     4,     8,    10,    12,    14,    18,    20,
      22,    24,    28,    32,    36,    37,    44,    48,    50,    51,
      52,    60,    63,    67,    71,    73,    77,    81,    83,    87,
      89,    94,    99,   104,   113,   122,   132,   142,   147,   150,
     151,   152,   161,   162,   163,   171,   173,   177,   182,   186,
     190,   194,   198,   202,   206,   210,   214,   218,   220,   224,
     228,   230,   232,   234,   237,   240,   246,   252,   259,   266,
     269
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      35,     0,    -1,    -1,    36,    23,    35,    -1,    37,    -1,
      49,    -1,    55,    -1,    24,    35,    25,    -1,    38,    -1,
      39,    -1,    42,    -1,    17,    26,    55,    -1,    17,    26,
      18,    -1,    17,    26,    16,    -1,    -1,    17,    26,    27,
      40,    41,    28,    -1,    41,    29,    15,    -1,    15,    -1,
      -1,    -1,    17,    44,    26,    43,    24,    35,    25,    -1,
      24,    25,    -1,    24,    45,    25,    -1,    24,    47,    25,
      -1,    46,    -1,    46,    29,    45,    -1,    17,    26,    15,
      -1,    48,    -1,    48,    29,    47,    -1,    55,    -1,    30,
       3,     5,    55,    -1,    17,     3,     5,    55,    -1,    19,
       3,     5,    55,    -1,    17,    31,    24,    55,    25,     3,
       5,    55,    -1,    19,    31,    24,    55,    25,     3,     5,
      55,    -1,    32,    17,    31,    24,    55,    25,     3,     5,
      55,    -1,    32,    19,    31,    24,    55,    25,     3,     5,
      55,    -1,    52,    29,    36,    25,    -1,    52,    25,    -1,
      -1,    -1,    21,    50,    24,    55,    29,    51,    36,    25,
      -1,    -1,    -1,    20,    53,    24,    55,    54,    29,    36,
      -1,    56,    -1,    55,    11,    56,    -1,    55,    30,    11,
      56,    -1,    55,    12,    56,    -1,    55,     3,    56,    -1,
      55,     4,    56,    -1,    55,    10,    56,    -1,    55,     9,
      56,    -1,    55,     8,    56,    -1,    55,     7,    56,    -1,
      55,     5,    56,    -1,    55,     6,    56,    -1,    57,    -1,
      56,    13,    57,    -1,    56,    14,    57,    -1,    15,    -1,
      17,    -1,    19,    -1,    33,    17,    -1,    33,    19,    -1,
      17,    31,    24,    55,    25,    -1,    19,    31,    24,    55,
      25,    -1,    32,    17,    31,    24,    55,    25,    -1,    32,
      19,    31,    24,    55,    25,    -1,    17,    44,    -1,    19,
      44,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    57,    57,    58,    61,    62,    63,    64,    67,    68,
      69,    72,    73,    74,    77,    77,    80,    81,    82,    85,
      85,    87,    88,    89,    92,    93,    96,    99,   100,   102,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     114,   114,   117,   117,   117,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   134,   135,   136,
     139,   140,   141,   142,   143,   144,   145,   146,   147,   148,
     149
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "'<'", "'>'", "'='", "'#'", "RMO", "LMO",
  "MEQ", "LEQ", "'+'", "'-'", "'*'", "'/'", "INTEGER", "STRING", "VAR",
  "PATH", "PREFIXES_VAR", "IF", "WHILE", "EOL", "';'", "'('", "')'", "':'",
  "'{'", "'}'", "','", "'.'", "'\\\\'", "'&'", "'@'", "$accept", "stmts",
  "stmt", "def", "def_var", "def_arr", "@1", "items", "def_fun", "@2",
  "params", "params_def", "param_def", "params_exec", "param_exec", "exec",
  "@3", "@4", "if_head", "@5", "@6", "exp", "factor", "term", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,    60,    62,    61,    35,   258,   259,   260,
     261,    43,    45,    42,    47,   262,   263,   264,   265,   266,
     267,   268,   269,    59,    40,    41,    58,   123,   125,    44,
      46,    92,    38,    64
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    34,    35,    35,    36,    36,    36,    36,    37,    37,
      37,    38,    38,    38,    40,    39,    41,    41,    41,    43,
      42,    44,    44,    44,    45,    45,    46,    47,    47,    48,
      49,    49,    49,    49,    49,    49,    49,    49,    49,    50,
      51,    49,    53,    54,    52,    55,    55,    55,    55,    55,
      55,    55,    55,    55,    55,    55,    55,    56,    56,    56,
      57,    57,    57,    57,    57,    57,    57,    57,    57,    57,
      57
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     0,     3,     1,     1,     1,     3,     1,     1,
       1,     3,     3,     3,     0,     6,     3,     1,     0,     0,
       7,     2,     3,     3,     1,     3,     3,     1,     3,     1,
       4,     4,     4,     8,     8,     9,     9,     4,     2,     0,
       0,     8,     0,     0,     7,     1,     3,     4,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     1,     3,     3,
       1,     1,     1,     2,     2,     5,     5,     6,     6,     2,
       2
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       2,    60,    61,    62,    42,    39,     2,     0,     0,     0,
       0,     0,     4,     8,     9,    10,     5,     0,     6,    45,
      57,     0,     0,     0,     0,    69,     0,     0,    70,     0,
       0,     0,     0,     0,     0,    63,    64,     1,     2,    38,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    61,    62,    21,     0,     0,
      24,     0,    27,    29,    13,    61,    12,    14,    11,     0,
      19,     0,     0,     0,     0,     7,     0,     0,     0,     3,
       0,    49,    50,    55,    56,    54,    53,    52,    51,    46,
      48,     0,    58,    59,    31,     0,     0,    69,     0,     0,
       0,    22,     0,    23,     0,    18,     0,     0,    32,     0,
      43,     0,    30,     0,     0,    37,    47,    26,     0,     0,
       0,     0,     0,    25,    28,    17,     0,    65,     2,    66,
       0,    40,     0,     0,     0,     0,     0,     0,    15,     0,
       0,     0,     0,     0,     0,    67,    68,    65,    66,     0,
       0,    16,     0,    20,     0,    44,     0,     0,     0,    67,
      68,    33,    34,    41,     0,     0,    35,    36
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,   105,   126,    15,   107,
      28,    59,    60,    61,    62,    16,    30,   144,    17,    29,
     130,    18,    19,    20
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -38
static const yytype_int16 yypact[] =
{
     101,   -38,    12,    13,   -38,   -38,   101,    26,    14,    45,
      39,    -6,   -38,   -38,   -38,   -38,   -38,    31,   265,    75,
     -38,    37,    68,   271,    42,    72,    89,    78,   -38,    79,
      80,    74,   100,    77,    81,   -38,   -38,   -38,   101,   -38,
     101,    46,    46,    46,    46,    46,    46,    46,    46,    46,
      46,    98,    46,    46,    46,     4,    17,   -38,    67,    85,
      82,    88,    90,   265,   -38,    22,   -38,   -38,   265,    46,
     -38,    46,    46,    46,    46,   -38,    46,    93,    99,   -38,
     102,    75,    75,    75,    75,    75,    75,    75,    75,    75,
      75,    46,   -38,   -38,   265,   111,   104,   -38,   105,   106,
     107,   -38,   118,   -38,    46,   121,    15,   115,   265,    65,
     265,   141,   265,    46,    46,   -38,    75,   -38,    46,    46,
     116,   117,   138,   -38,   -38,   -38,    30,   162,   101,   163,
     139,   -38,   151,   179,   189,   217,    46,    46,   -38,   152,
     164,   147,   168,   101,   101,   171,   172,   -38,   -38,   227,
     255,   -38,    46,   -38,    46,   -38,   153,   174,   175,   -38,
     -38,   265,   265,   -38,    46,    46,   265,   265
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -38,    -4,   -37,   -38,   -38,   -38,   -38,   -38,   -38,   -38,
       2,   103,   -38,    73,   -38,   -38,   -38,   -38,   -38,   -38,
     -38,   -22,   -36,    28
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
      63,    68,    31,    80,    25,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    21,    26,    38,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    22,    32,
      95,    33,    94,    34,    79,    96,    22,    22,    23,    37,
     127,    22,    54,    24,    27,    51,    22,   106,    98,   108,
     109,   110,   111,    96,   112,   116,    39,    97,   138,   139,
      40,     1,    35,    65,    36,    56,    69,    97,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    58,     9,
      92,    93,    63,     1,    99,    55,   100,    56,    52,    53,
     129,   132,   133,    57,    71,    51,   134,   135,    70,    75,
      58,     9,    72,    73,    74,    76,   155,   156,    77,    91,
     101,   102,    78,   103,   149,   150,     1,   113,     2,   104,
       3,     4,     5,   114,   141,     6,   117,   115,   118,   119,
     161,     7,   162,     8,     9,   122,   125,   120,   121,   128,
     136,   137,   166,   167,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    95,   140,   142,   151,   143,   152,
     131,    51,   153,   154,   157,   158,   145,   124,   163,   164,
     165,    51,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,     0,     0,   146,   123,     0,     0,     0,    51,
       0,     0,     0,     0,   147,     0,     0,     0,     0,    51,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
       0,     0,   148,     0,     0,     0,     0,    51,     0,     0,
       0,     0,   159,     0,     0,     0,     0,    51,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,     0,     0,
     160,     0,     0,     0,     0,    51,     1,    64,    65,    66,
      56,     0,     0,     0,     0,    51,     0,     0,    67,     0,
       0,     0,     0,    58,     9
};

static const yytype_int16 yycheck[] =
{
      22,    23,     6,    40,     2,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,     3,     3,    23,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    24,     3,
      26,    17,    54,    19,    38,    31,    24,    24,    26,     0,
      25,    24,     5,    31,    31,    30,    24,    69,    31,    71,
      72,    73,    74,    31,    76,    91,    25,    55,    28,    29,
      29,    15,    17,    17,    19,    19,    24,    65,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    32,    33,
      52,    53,   104,    15,    17,    17,    19,    19,    13,    14,
      25,   113,   114,    25,     5,    30,   118,   119,    26,    25,
      32,    33,    24,    24,    24,     5,   143,   144,    31,    11,
      25,    29,    31,    25,   136,   137,    15,    24,    17,    29,
      19,    20,    21,    24,   128,    24,    15,    25,    24,    24,
     152,    30,   154,    32,    33,    17,    15,    31,    31,    24,
      24,    24,   164,   165,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    26,     3,     3,    15,    29,     5,
      29,    30,    25,     5,     3,     3,    25,   104,    25,     5,
       5,    30,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    -1,    -1,    25,   102,    -1,    -1,    -1,    30,
      -1,    -1,    -1,    -1,    25,    -1,    -1,    -1,    -1,    30,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      -1,    -1,    25,    -1,    -1,    -1,    -1,    30,    -1,    -1,
      -1,    -1,    25,    -1,    -1,    -1,    -1,    30,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    -1,    -1,
      25,    -1,    -1,    -1,    -1,    30,    15,    16,    17,    18,
      19,    -1,    -1,    -1,    -1,    30,    -1,    -1,    27,    -1,
      -1,    -1,    -1,    32,    33
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    15,    17,    19,    20,    21,    24,    30,    32,    33,
      35,    36,    37,    38,    39,    42,    49,    52,    55,    56,
      57,     3,    24,    26,    31,    44,     3,    31,    44,    53,
      50,    35,     3,    17,    19,    17,    19,     0,    23,    25,
      29,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    30,    13,    14,     5,    17,    19,    25,    32,    45,
      46,    47,    48,    55,    16,    17,    18,    27,    55,    24,
      26,     5,    24,    24,    24,    25,     5,    31,    31,    35,
      36,    56,    56,    56,    56,    56,    56,    56,    56,    56,
      56,    11,    57,    57,    55,    26,    31,    44,    31,    17,
      19,    25,    29,    25,    29,    40,    55,    43,    55,    55,
      55,    55,    55,    24,    24,    25,    56,    15,    24,    24,
      31,    31,    17,    45,    47,    15,    41,    25,    24,    25,
      54,    29,    55,    55,    55,    55,    24,    24,    28,    29,
       3,    35,     3,    29,    51,    25,    25,    25,    25,    55,
      55,    15,     5,    25,     5,    36,    36,     3,     3,    25,
      25,    55,    55,    25,     5,     5,    55,    55
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
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



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
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
	    /* Fall through.  */
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

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
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
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

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
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 57 "parse.y"
    {;}
    break;

  case 3:
#line 58 "parse.y"
    {/*printf("[line]%d:\n", yylineno);*/;}
    break;

  case 11:
#line 72 "parse.y"
    {am_def_var((yyvsp[(1) - (3)].s)); am->defVarWithNumber((yyvsp[(1) - (3)].s), "0");;}
    break;

  case 12:
#line 73 "parse.y"
    {;}
    break;

  case 13:
#line 74 "parse.y"
    {am_def_str((yyvsp[(1) - (3)].s), (yyvsp[(3) - (3)].s)); am->defVarWithNumber((yyvsp[(1) - (3)].s), (yyvsp[(3) - (3)].s));;}
    break;

  case 14:
#line 77 "parse.y"
    {am_def_arr_start((yyvsp[(1) - (3)].s)); am->defArrayStart((yyvsp[(1) - (3)].s));;}
    break;

  case 15:
#line 77 "parse.y"
    {am_def_arr_end((yyvsp[(1) - (6)].s)); am->defArrayEnd((yyvsp[(1) - (6)].s));;}
    break;

  case 16:
#line 80 "parse.y"
    {am_def_arr_item((yyvsp[(3) - (3)].s)); am->defArrayItem((yyvsp[(3) - (3)].s));;}
    break;

  case 17:
#line 81 "parse.y"
    {am_def_arr_item((yyvsp[(1) - (1)].s));;}
    break;

  case 19:
#line 85 "parse.y"
    {am_def_fun_head((yyvsp[(1) - (3)].s)); am->defFunctionStart((yyvsp[(1) - (3)].s));;}
    break;

  case 20:
#line 85 "parse.y"
    {am_def_fun_end((yyvsp[(1) - (7)].s)); am->defFunctionEnd((yyvsp[(1) - (7)].s));;}
    break;

  case 26:
#line 96 "parse.y"
    {am_def_param((yyvsp[(1) - (3)].s)); am->defParam((yyvsp[(1) - (3)].s));;}
    break;

  case 30:
#line 105 "parse.y"
    {am_return(); am->defReturn();;}
    break;

  case 31:
#line 106 "parse.y"
    {am_assign_var((yyvsp[(1) - (4)].s)); am->assginVar((yyvsp[(1) - (4)].s));;}
    break;

  case 32:
#line 107 "parse.y"
    {am_assign_prefixesVar((yyvsp[(1) - (4)].s)); am->assginPrefixesVar((yyvsp[(1) - (4)].s));;}
    break;

  case 33:
#line 108 "parse.y"
    {am_assign_arr((yyvsp[(1) - (8)].s)); am->assginArray((yyvsp[(1) - (8)].s));;}
    break;

  case 34:
#line 109 "parse.y"
    {am_assign_prefixesArr((yyvsp[(1) - (8)].s)); am->assginPrefixesArray((yyvsp[(1) - (8)].s));;}
    break;

  case 35:
#line 110 "parse.y"
    {am_assign_arl((yyvsp[(2) - (9)].s));;}
    break;

  case 36:
#line 111 "parse.y"
    {am_assign_prefixesArl((yyvsp[(2) - (9)].s));;}
    break;

  case 37:
#line 112 "parse.y"
    {am_if_end(); am->ifEnd();;}
    break;

  case 38:
#line 113 "parse.y"
    {am_if_end();;}
    break;

  case 39:
#line 114 "parse.y"
    {am_while_head();;}
    break;

  case 40:
#line 114 "parse.y"
    {am_while_mid();;}
    break;

  case 41:
#line 114 "parse.y"
    {am_while_end();;}
    break;

  case 42:
#line 117 "parse.y"
    {am_if_head();;}
    break;

  case 43:
#line 117 "parse.y"
    {am_if_then();;}
    break;

  case 44:
#line 117 "parse.y"
    {am_if_else();;}
    break;

  case 46:
#line 121 "parse.y"
    {am_exp_add();;}
    break;

  case 47:
#line 122 "parse.y"
    {am_exp_fadd();;}
    break;

  case 48:
#line 123 "parse.y"
    {am_exp_sub();;}
    break;

  case 49:
#line 124 "parse.y"
    {am_exp_les();;}
    break;

  case 50:
#line 125 "parse.y"
    {am_exp_mor();;}
    break;

  case 51:
#line 126 "parse.y"
    {am_exp_leq();;}
    break;

  case 52:
#line 127 "parse.y"
    {am_exp_meq();;}
    break;

  case 53:
#line 128 "parse.y"
    {am_exp_lmo();;}
    break;

  case 54:
#line 129 "parse.y"
    {am_exp_rmo();;}
    break;

  case 55:
#line 130 "parse.y"
    {am_exp_equ();;}
    break;

  case 56:
#line 131 "parse.y"
    {am_exp_neq();;}
    break;

  case 58:
#line 135 "parse.y"
    {am_exp_mul();;}
    break;

  case 59:
#line 136 "parse.y"
    {am_exp_div();;}
    break;

  case 60:
#line 139 "parse.y"
    {am_exp_val((yyvsp[(1) - (1)].s));;}
    break;

  case 61:
#line 140 "parse.y"
    {am_exp_var((yyvsp[(1) - (1)].s));;}
    break;

  case 62:
#line 141 "parse.y"
    {am_exp_prefixesVar((yyvsp[(1) - (1)].s));;}
    break;

  case 63:
#line 142 "parse.y"
    {am_exp_addr((yyvsp[(2) - (2)].s));;}
    break;

  case 64:
#line 143 "parse.y"
    {am_exp_prefixesAddr((yyvsp[(2) - (2)].s));;}
    break;

  case 65:
#line 144 "parse.y"
    {am_exp_arr((yyvsp[(1) - (5)].s));;}
    break;

  case 66:
#line 145 "parse.y"
    {am_exp_chainArr((yyvsp[(1) - (5)].s));;}
    break;

  case 67:
#line 146 "parse.y"
    {am_exp_addl((yyvsp[(2) - (6)].s));;}
    break;

  case 68:
#line 147 "parse.y"
    {am_exp_prefixesAddl((yyvsp[(2) - (6)].s));;}
    break;

  case 69:
#line 148 "parse.y"
    {am_exec_func((yyvsp[(1) - (2)].s));;}
    break;

  case 70:
#line 149 "parse.y"
    {am_exec_prefixesFunc((yyvsp[(1) - (2)].s));;}
    break;


/* Line 1267 of yacc.c.  */
#line 1796 "parse.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
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
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
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
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 151 "parse.y"

int main(int argc, char **argv){
    if(!open(argc, argv)) return 1;
    prefixes_push(argv[1]);
    yylineno = 1;
    yyparse();
    c->print();
    // code_cut("push eax\npop eax\n");
    // code_cut("push ebp\npop ebp\n");
    fwrite(code, strlen(code), 1, out_asm);
    fclose(out_asm);
    return 0;
}

