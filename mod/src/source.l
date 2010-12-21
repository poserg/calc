%{
#include "main.h"
%}

DIGIT		[0-9]+
NUM		{DIGIT}?\.?{DIGIT}?
SPACE		[' '\t]
QUIT		^{SPACE}*[Qq][Uu][Ii][Tt]$
ANS		[Aa][Nn][Ss]
SIN             [Ss][Ii][Nn]
COS             [Cc][Oo][Ss]
TAN             [Tt][Aa][Nn]
EXP             [Ee][Xx][Pp]
ASIN            [Aa]{SIN}
ACOS            [Aa]{COS}
ATAN            [Aa]{TAN}
LETTER 		[A-z]
OPERATOR 	[-\+\*\/\^]

%%
{NUM} {
	yylval.dval  = atof (yytext);
	return NUM;
}

{ANS} {
	return ANS;
}

{OPERATOR}{OPERATOR}+ {
	return OPER_ERR;
}

^{NUM}?{OPERATOR}{SPACE}*$ {
	return END_ERR;
}

^{SPACE}*[\+\*\/]{NUM}$ {
	return FIRST_ERR;
}

\+ {
	return '+';
}

- {
	return '-';
}

\* {
	return '*';
}

\/ {
	return '/';
}

\^ {
        return '^';
}

\( {
	return '(';
}

\) {
	return ')';
}

{QUIT} {
	return QUIT;
}

{SIN} {
    return SIN;
}

{COS} {
    return COS;
}

{TAN} {
    return TAN;
}

{EXP} {
    return EXP;
}

{ASIN} {
    return ASIN;
}

{ACOS} {
    return ACOS;
}

{ATAN} {
    return ATAN;
}

\n {
	return '\n';
}

.|\n

%%
int yywrap(){
	return 1;
}

