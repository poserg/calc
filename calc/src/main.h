#ifndef MAIN_H
#define MAIN_H

#include <stdio.h>
#include <stdlib.h>
#include "y.h"

extern int yylex(void);
extern int yyparse(void);
extern int yyerror (const char*);

#endif
