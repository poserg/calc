calc : y.tab.c lex.yy.c 
	cc -O y.tab.c -o calc

y.tab.c : y.y
	bison y.y

lex.yy.c : source.l
	flex source.l

yout : y.y
	bison -v y.y

clear :
	rm -f *.c *.h *output calc
