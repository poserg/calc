#include "y.c"
int main()
{
	start();
	return yyparse();
}

int yyerror (const char *s)
{
	fprintf (stderr, "ERROR: %s\n", s);
	return 0;
}

int start()
{
	printf (">> ");
	return 0;
}
