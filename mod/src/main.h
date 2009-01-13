#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

extern int yylex(void);
extern int yyparse(void);
extern int yyerror (const char*);
