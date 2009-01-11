PROGRAM_NAME := calc
SOURCE_DIRS := src bin

SOURCE_DIRS := $(addprefix ../, $(SOURCE_DIRS))

$(PROGRAM_NAME) : y.tab.o
	cc $^ -o $@

VPATH = $(SOURCE_DIRS)

%.o : %.c 
	cc -c -MD $<

y.tab.c : y.y
	bison $<

lex.yy.c : source.l
	flex $<

include $(wildcard *.d)

yout : y.y
	bison -v $< 

.PHONY : clear

clear :
	rm -f *.*.c *.d *.o $(PROGRAM_NAME) *.output
