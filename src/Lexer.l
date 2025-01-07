 /* Definition Section */

%{
#include "Parser.hpp"

#include <iostream>
#include <string>

#include <stdio.h>

 /* Convert escape sequence begin with \\ to character */
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
        character = c - '0';
    default:
        character = c;
        break;
    }
    return character;
}
%}

%option noyywrap
%option outfile = "Lexer.cpp"

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

"sizeof"            { return SIZEOF; }

 /** Identifier **/
[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.idVal = new std::string(yytext, yyleng);
    return IDENTIFIER;
}

 /** Integer Number **/
[+-]?([1-9][0-9]*|0) {
    int val;
    sscanf(yytext, "%d", &val);
    yylval.intVal = val;
    return INTEGER;
}

 /** Hex Integer Number **/
[+-]0x[0-9a-fA-F]+ {
    int val;
    sscanf(yytext, "%i", &val);
    yylval.intVal = val;
    return INTEGER;
}

 /** Unsigned Integer Number **/
\+?([1-9][0-9]*|0)(u|U) {
    unsigned int val;
    sscanf(yytext, "%u", &val);
    yylval.uintVal = val;
    return UINTEGER;
}

 /** Hex Unsigned Integer Number **/
0x[0-9a-fA-F]+ {
    int val;
    sscanf(yytext, "%x", &val);
    yylval.uintVal = val;
    return UINTEGER;
}

 /** Long Number **/
[+-]?([1-9][0-9]*|0)(l|L) {
    long val;
    sscanf(yytext, "%ld", &val);
    yylval.longVal = val;
    return LONGVAL;
}

 /** Unsigned Long Number **/
\+?([1-9][0-9]*|0)(ul|UL) {
    unsigned long val;
    sscanf(yytext, "%ld", &val);
    yylval.ulongVal = val;
    return ULONGVAL;
}

 /** Float Number **/
([1-9][0-9]*|0)\.[0-9]*(f|F) {
    float val;
    sscanf(yytext, "%f", &val);
    yylval.floatVal = val;
    return FLOATVAL;
}

 /** Double Number **/
([1-9][0-9]*|0)+\.[0-9]* {
    double val;
    sscanf(yytext, "%lf", &val);
    yylval.doubleVal = val;
    return DOUBLEVAL;
}

 /** Characters to ignore **/
[ \t\n]*            { ; }
\/\*\.*\*\/         { ; }
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

 /** String **/
\".*\" {
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