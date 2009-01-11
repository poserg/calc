PROGRAM_NAME := calc
SOURCE_DIRS := src

SOURCE_DIRS := $(addprefix ../, $(SOURCE_DIRS))

$(PROGRAM_NAME) : y.tab.c lex.yy.c 
	cc -O $< -o $@

VPATH := $(SOURCE_DIRS)

y.tab.c : y.y
	bison $^

lex.yy.c : source.l
	flex $^

yout : y.y
	bison -v $^ 

.PHONY : clear

clear :
	rm -f *.c $(PROGRAM_NAME) *.output
