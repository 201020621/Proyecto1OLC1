package Proyecto1;
import static Proyecto1.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
potencia |
inicio |
fin |
ingresar |
modulo |
Numero |
Entero |
Cadena |
Boolean |
Caracter |
si |
de_lo_contrario |
fin_si |
para |
fin_para |
repetir |
hasta_que |
retornar |
metodo |
fin_metodo |
funcion |
fin_funcion |
ejecutar |
imprimir |
imprimir_nl |
mientras |
fin_mientras {lexeme=yytext(); return PalabrasReservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"/*".* {/*Ignore*/}
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
"(" {return Par_izq;}
")" {return Par_der;}
"->" {return Apuntador;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Digito;}
 . {return ERROR;}
