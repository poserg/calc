#include "main.h"
int main()
{
	start();
	return yyparse();
}

int start()
{
	printf (">> ");
	return 0;
}
