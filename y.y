%{
#include <stdio.h>
#include "lex.yy.c"
#define YYSTYPE double
//#define YYERROR_VERBOSE
double answer = 0;
int flag = 1;
%}
%start input
%token NUM QUIT ERR OPER_ERR ANS FIRST_ERR END_ERR
%left '+' '-'
%left '*' '/'
%%
input	: /*	*/
	| input '\n'
	{ 
		printf ("\n");
		start(); 
	}
	| input ERR
	{ yyerror ("not expression or not \"quit\""); }
	| input OPER_ERR 
	{ yyerror ("operator > 1!"); }
	| input FIRST_ERR
	{ yyerror ("only \"-\" was first"); }
	| input END_ERR  
	{ yyerror ("end - not operator"); }
	| input expr '\n'
	{
		if (flag) {
			answer = $2;
			printf ("\tans = %.4f\n", $2);
		}
		start();
		flag = 1;
	}
	| input QUIT
	{ YYACCEPT; }
	| input error
	{ 
		yyerror ("GLOBAL ERROR"); 
		flag = 0;
	}
	;

expr	: expr '+' expr
	{ $$ = $1+$3; }
	| expr '-' expr
	{ $$ = $1 - $3; }
	| expr '*' expr
	{ $$ = $1*$3; }
	| expr '/' expr
	{ $$ = $1/$3; }
	| '-' expr %prec '*'
	{ $$ = -$2;}
	| '(' expr ')'
	{ $$ = $2; }
	| expr '(' expr ')'
	{ $$ = $1*$3; }
	| '(' expr ')' expr
	{ $$ = $2*$4; }
	| expr '(' expr ')' expr
	{ $$ = $1*$3*$5; }
	| ANS
	{ $$ = answer; }
	| NUM
	;
%%
int main()
{
	start();
	return yyparse();
}

int yyerror (const char *s)
{
	printf ("ERROR: %s\n", s);
	return 0;
}

int start(){
	printf (">> ");
	return 0;
}
