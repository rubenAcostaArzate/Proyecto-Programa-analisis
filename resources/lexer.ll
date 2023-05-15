%{
#include <iostream>
#include <string>
using namespace std;

#include "Lexer.hpp"

#undef YY_DECL
#define YY_DECL int Lexer::yylex()

%}

%option c++
%option outfile="Lexer.cpp"
%option yyclass="Lexer"

id  [a-zA-Z]+
espacio [ \t\v\r]

%%

\n          { line++; }

.           { /*Mandar llamar a una función de error que diga la línea y el número de caracter de la línea donde ocurrio el error*/}

%%
/*Sección de código de usuario*/
int yyFlexLexer::yywrap(){
    return 1;
}

int Lexer::getLine(){
    return line;
}
