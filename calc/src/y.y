%{
#include "main.h"
//#define YYERROR_VERBOSE
extern FILE *stderr;
double answer = 0;
int flag = 1;
%}
%defines
%start input
%token <dval>  NUM 
%token QUIT ERR OPER_ERR ANS FIRST_ERR END_ERR
%left '+' '-'
%left '*' '/'
%type <dval> expr
%union {
	double dval;
}
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
	{ yyerror ("first is not \"-\""); }
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
	{
		if ($3){
			$$ = $1/$3; 
		} else { 
			yyerror ("div on 0\n");
			flag = 0;
		}
	}
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
extern int yyerror (const char *s)
{
	fprintf (stderr, "ERROR: %s\n", s);
	return 0;
}
