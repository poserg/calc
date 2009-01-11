%{
#include <stdlib.h>
extern double yylval;
%}

DIGIT		[0-9]+
NUM		{DIGIT}?\.?{DIGIT}?
SPACE		[' '\t]
QUIT		^{SPACE}*[Qq][Uu][Ii][Tt]$
ANS		[Aa][Nn][Ss]
LETTER 		[A-z]
OPERATOR 	[-\+\*\/]

%%
{NUM} {
	yylval = atof (yytext);
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

\( {
	return '(';
}

\) {
	return ')';
}

{QUIT} {
	return QUIT;
}

\n {
	return '\n';
}

{NUM}*{OPERATOR}?{LETTER}+{OPERATOR}? {
	return ERR;
}

.|\n

%%
int yywrap(){
	return 1;
}

