#include "main.h"
extern int main()
{
	start();
	return yyparse();
}

int start()
{
	printf (">> ");
	return 0;
}
