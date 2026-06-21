 /* Definition Section */

%{
#include "Parser.hpp"

#include <cerrno>
#include <climits>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <limits>
#include <string>

#include <stdio.h>

void yyerror(const char* s);

static int yycolumn = 1;

// Bison %locations reads yylloc per token; yylineno alone does not populate it.
#define YY_USER_ACTION                          \
  yylloc.first_line = yylloc.last_line = yylineno; \
  yylloc.first_column = yycolumn;               \
  yylloc.last_column = yycolumn + yyleng - 1;   \
  yycolumn += yyleng;

 /* Map the character after '\\' in a char/string escape to its value. */
char escapeDecode(char c) {
    char character;
    switch (c) {
    case 'r':
        character = '\r';
        break;
    case 'n':
        character = '\n';
        break;
    case 't':
        character = '\t';
        break;
    case '\\':
        character = '\\';
        break;
    case '\'':
        character = '\'';
        break;
    case '\"':
        character = '\"';
        break;
    case '0':
        character = '\0';
        break;
    default:
        character = c;
        break;
    }
    return character;
}

// strto* + errno reject overflow and partial parses; sscanf could not.
static bool parseEndMatches(const char* end, const char* text, size_t len) {
    return static_cast<size_t>(end - text) == len;
}

static bool parseSignedLong(const char* text, size_t len, long& out) {
    errno = 0;
    char* end = nullptr;
    const long val = strtol(text, &end, 0);
    if (errno != 0 || !parseEndMatches(end, text, len)) {
        yyerror("invalid integer literal");
        return false;
    }
    out = val;
    return true;
}

static bool parseIntLiteral(const char* text, size_t len, int& out) {
    long val = 0;
    if (!parseSignedLong(text, len, val)) {
        return false;
    }
    if (val < INT_MIN || val > INT_MAX) {
        yyerror("integer literal out of range");
        return false;
    }
    out = static_cast<int>(val);
    return true;
}

static bool parseUnsignedSuffixLiteral(const char* text, size_t len,
                                       unsigned long& out, const char* suffix) {
    const size_t suffixLen = strlen(suffix);
    if (len <= suffixLen ||
        strncmp(text + len - suffixLen, suffix, suffixLen) != 0) {
        return false;
    }

    errno = 0;
    char* end = nullptr;
    const unsigned long val = strtoul(text, &end, 0);
    if (errno != 0 || end != text + len - suffixLen) {
        yyerror("invalid unsigned integer literal");
        return false;
    }
    out = val;
    return true;
}

static bool parsePlainUnsignedLong(const char* text, size_t len, unsigned long& out) {
    errno = 0;
    char* end = nullptr;
    const unsigned long val = strtoul(text, &end, 0);
    if (errno != 0 || !parseEndMatches(end, text, len)) {
        yyerror("invalid unsigned integer literal");
        return false;
    }
    out = val;
    return true;
}

static bool parseUnsignedIntLiteral(const char* text, size_t len, unsigned int& out) {
    unsigned long val = 0;
    if (!parseUnsignedSuffixLiteral(text, len, val, "u") &&
        !parseUnsignedSuffixLiteral(text, len, val, "U") &&
        !parsePlainUnsignedLong(text, len, val)) {
        return false;
    }
    if (val > UINT_MAX) {
        yyerror("unsigned integer literal out of range");
        return false;
    }
    out = static_cast<unsigned int>(val);
    return true;
}

static bool parseLongLiteral(const char* text, size_t len, long& out) {
    if (len == 0 || (text[len - 1] != 'l' && text[len - 1] != 'L')) {
        yyerror("invalid long integer literal");
        return false;
    }
    errno = 0;
    char* end = nullptr;
    const long val = strtol(text, &end, 0);
    if (errno != 0 || end != text + len - 1) {
        yyerror("invalid long integer literal");
        return false;
    }
    out = val;
    return true;
}

static bool parseUnsignedLongLiteral(const char* text, size_t len,
                                     unsigned long& out) {
    if (parseUnsignedSuffixLiteral(text, len, out, "ul") ||
        parseUnsignedSuffixLiteral(text, len, out, "UL") ||
        parseUnsignedSuffixLiteral(text, len, out, "Ul") ||
        parseUnsignedSuffixLiteral(text, len, out, "uL")) {
        return true;
    }
    yyerror("invalid unsigned long integer literal");
    return false;
}

static bool parseFloatLiteral(const char* text, size_t len, float& out) {
    if (len == 0 || (text[len - 1] != 'f' && text[len - 1] != 'F')) {
        yyerror("invalid float literal");
        return false;
    }
    errno = 0;
    char* end = nullptr;
    const float val = strtof(text, &end);
    if (errno != 0 || end != text + len - 1) {
        yyerror("invalid float literal");
        return false;
    }
    out = val;
    return true;
}

static bool parseDoubleLiteral(const char* text, size_t len, double& out) {
    errno = 0;
    char* end = nullptr;
    const double val = strtod(text, &end);
    if (errno != 0 || !parseEndMatches(end, text, len)) {
        yyerror("invalid floating literal");
        return false;
    }
    out = val;
    return true;
}

// Unsuffixed hex: pick the narrowest lcc token that fits (C integer promotion).
static int returnLexHexConstant(const char* text, size_t len) {
    if (len > 0 && text[0] == '-') {
        long signedVal = 0;
        if (!parseSignedLong(text, len, signedVal)) {
            yylval.longVal = 0;
            return LONGVAL;
        }
        if (signedVal >= INT_MIN && signedVal <= INT_MAX) {
            yylval.intVal = static_cast<int>(signedVal);
            return INTEGER;
        }
        if (signedVal >= LONG_MIN && signedVal <= LONG_MAX) {
            yylval.longVal = signedVal;
            return LONGVAL;
        }
        yyerror("integer literal out of range");
        yylval.longVal = 0;
        return LONGVAL;
    }

    unsigned long val = 0;
    if (!parsePlainUnsignedLong(text, len, val)) {
        yylval.ulongVal = 0;
        return ULONGVAL;
    }

    if (val <= static_cast<unsigned long>(INT_MAX)) {
        yylval.intVal = static_cast<int>(val);
        return INTEGER;
    }
    if (val <= UINT_MAX) {
        yylval.uintVal = static_cast<unsigned int>(val);
        return UINTEGER;
    }
    if (val <= static_cast<unsigned long>(LONG_MAX)) {
        yylval.longVal = static_cast<long>(val);
        return LONGVAL;
    }
    if (val <= ULONG_MAX) {
        yylval.ulongVal = val;
        return ULONGVAL;
    }

    yyerror("integer literal out of range");
    yylval.ulongVal = 0;
    return ULONGVAL;
}
%}

%option noyywrap
%option yylineno
%option outfile="Lexer.cpp"

%x COMMENT

%%

 /* Rules Section */

 /** Punctuations **/
","                 { return COMMA; }
":"                 { return COLON; }
";"                 { return SEMICOLON; }
"?"                 { return QUESTION; }
"..."               { return ELLIPSES; }

 /** Pointer and Address Relevant **/
"."                 { return DOT; }
"*"                 { return ASTERISK; }
"&"                 { return AMPERSAND; }
"->"                { return ARROW; }

 /** Brackets **/
"("                 { return LPARENTHESES; }
")"                 { return RPARENTHESES; }
"["                 { return LBRACKET; }
"]"                 { return RBRACKET; }
"{"                 { return LBRACE; }
"}"                 { return RBRACE; }

 /** Arithmetic Operations **/

"="                 { return ASSIGN; }

"+"                 { return ADD; }
"-"                 { return SUB; }
"/"                 { return DIV; }
"%"                 { return MOD; }

"++"                { return DADD; }
"--"                { return DSUB; }

"+="                { return ADDEQ; }
"-="                { return SUBEQ; }
"*="                { return MULEQ; }
"/="                { return DIVEQ; }
"%="                { return MODEQ; }

 /** Bitwise Operations **/

"|"                 { return BOR; }
"^"                 { return BXOR; }
"~"                 { return BNOT; }

"&="                { return BANDEQ; }
"|="                { return BOREQ; }
"^="                { return BXOREQ; }

 /** Bit Shift Operations **/

"<<"                { return SHL; }
">>"                { return SHR; }

"<<="               { return SHLEQ; }
">>="               { return SHREQ; }

 /** Logic Operations **/

"&&"                { return AND; }
"||"                { return OR; }
"!"                 { return NOT; }

 /** Relational Operators **/

"=="                { return EQ; }
"!="                { return NEQ; }
"<"                 { return LT; }
"<="                { return LE; }
">"                 { return GT; }
">="                { return GE; }

 /** C keywords **/

"char"              { return CHAR; }
"short"             { return SHORT; }
"int"               { return INT; }
"long"              { return LONG; }

"unsigned"          { return UNSIGNED; }
"const"             { return CONST; }
"static"            { return STATIC; }
"void"              { return VOID; }

"float"             { return FLOAT; }
"double"            { return DOUBLE; }

"bool"              { return BOOL; }
"true"              { return TRUE; }
"false"             { return FALSE; }

"if"                { return IF; }
"else"              { return ELSE; }

"switch"            { return SWITCH; }
"case"              { return CASE; }
"default"           { return DEFAULT; }

"for"               { return FOR; }
"do"                { return DO; }
"while"             { return WHILE; }

"continue"          { return CONTINUE; }
"break"             { return BREAK; }
"return"            { return RETURN; }

"struct"            { return STRUCT; }
"union"             { return UNION; }
"enum"              { return ENUM; }
"typedef"           { return TYPEDEF; }

"sizeof"            { return SIZEOF; }

 /** Identifier **/
[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.idVal = new std::string(yytext, yyleng);
    return IDENTIFIER;
}

 /** Integer Number **/
[+-]?([1-9][0-9]*|0) {
    if (!parseIntLiteral(yytext, yyleng, yylval.intVal)) {
        yylval.intVal = 0;
    }
    return INTEGER;
}

 /** Hex Integer Number (unsuffixed; width from value) **/
[+-]?0x[0-9a-fA-F]+ {
    return returnLexHexConstant(yytext, yyleng);
}

 /** Hex unsigned long **/
0x[0-9a-fA-F]+(ul|UL|Ul|uL) {
    if (!parseUnsignedLongLiteral(yytext, yyleng, yylval.ulongVal)) {
        yylval.ulongVal = 0;
    }
    return ULONGVAL;
}

 /** Hex unsigned int **/
0x[0-9a-fA-F]+[uU] {
    if (!parseUnsignedIntLiteral(yytext, yyleng, yylval.uintVal)) {
        yylval.uintVal = 0;
    }
    return UINTEGER;
}

 /** Hex long **/
[+-]?0x[0-9a-fA-F]+[lL] {
    if (!parseLongLiteral(yytext, yyleng, yylval.longVal)) {
        yylval.longVal = 0;
    }
    return LONGVAL;
}

 /** Unsigned Integer Number **/
\+?([1-9][0-9]*|0)(u|U) {
    if (!parseUnsignedIntLiteral(yytext, yyleng, yylval.uintVal)) {
        yylval.uintVal = 0;
    }
    return UINTEGER;
}

 /** Long Number **/
[+-]?([1-9][0-9]*|0)(l|L) {
    if (!parseLongLiteral(yytext, yyleng, yylval.longVal)) {
        yylval.longVal = 0;
    }
    return LONGVAL;
}

 /** Unsigned Long Number **/
\+?([1-9][0-9]*|0)(ul|UL|Ul|uL) {
    if (!parseUnsignedLongLiteral(yytext, yyleng, yylval.ulongVal)) {
        yylval.ulongVal = 0;
    }
    return ULONGVAL;
}

 /** Float Number **/
([1-9][0-9]*|0)\.[0-9]*(f|F) {
    if (!parseFloatLiteral(yytext, yyleng, yylval.floatVal)) {
        yylval.floatVal = 0.0f;
    }
    return FLOATVAL;
}

 /** Double Number **/
([1-9][0-9]*|0)+\.[0-9]* {
    if (!parseDoubleLiteral(yytext, yyleng, yylval.doubleVal)) {
        yylval.doubleVal = 0.0;
    }
    return DOUBLEVAL;
}

 /** Characters to ignore **/
[ \t]+              { ; }
\r?\n               { yycolumn = 1; }
"/*"                { BEGIN(COMMENT); }  /* multi-line; start condition, not one-line rule */
<COMMENT>"*/"       { BEGIN(INITIAL); }
<COMMENT>\r?\n      { yycolumn = 1; }
<COMMENT>.          { ; }
<COMMENT><<EOF>>    { BEGIN(INITIAL); }
\/\/.*              { ; }

 /** Character **/

\'\\.\' {
    yylval.charVal = escapeDecode(yytext[2]);
    return CHARACTER;
}

\'[^\\']\' {
    yylval.charVal = yytext[1];
    return CHARACTER;
}

 /** String (non-greedy: stops at unescaped closing quote) **/
\"([^\"\\]|\\.)*\" {
    yylval.strVal = new std::string;
    for (int i = 1; i < yyleng - 1; ++i) {
        if (yytext[i] == '\\') {
            yylval.strVal->push_back(escapeDecode(yytext[++i]));
        } else {
            yylval.strVal->push_back(yytext[i]);
        }
    }
    return STRING;
}

%%

 /* Subroutines Section */