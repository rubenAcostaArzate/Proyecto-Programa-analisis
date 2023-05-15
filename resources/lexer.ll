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

lit_entera ([0-9](_)?)*[0-9]
lit_flotante ([0−9](_?[0−9])*)?.[0−9]*((e∣E)(+∣−)?[0−9](_?[0−9])*)?
runas   ’([a-zA-Zá-źA-Źä-üÄ-ÜñÑ] | \[abfnrtv \’ "])’
cadenas "([a-zA-Zá-źA-Źä-üÄ-ÜñÑ] | \[abfnrtv \’ "])*"
espacio [ \t\v\r]
comentarios (//[∧/n]∗∣/ ∗ ([∧∗]∣ ∗ ∗∗[∧/∗])∗ ∗ /)

Proto proto
PyC ;
Coma ,
PI (
PD )
Llave_iz  {
Llave_der }
Variable var 
Constat constate
F23 dec32
_64  dec64
Logico logico 
Funcion funcion
Seno sin
Imprimir imprimir 
Leer leer
Incremento ++
Decremento -
Suma_asig +=
Resta_asig -=
Producto_asig *=
Division_asig /=
Modulo_asig %=
If si
Else sino
Switch segun 
Case caso
Default predeterminado
For para
Return devolver 
Stop detener
Break continuar
Punto .
Or ||
And &&
Igualdad ==
DIferencia !=
Menor_que <
Menor_igual <=
Mayor_que >
Mayor_igual >=
Asignacion =
Suma +
Producto *
Division /
Modulo %
Negacion !
Ampersand &
True verdadero
False falso




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
