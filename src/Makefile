PROGRAM_NAME := calc
SOURCE_DIRS := src bin

SOURCE_DIRS := $(addprefix ../, $(SOURCE_DIRS))
SOURCE := $(addsuffix /$(SOURCE), $(SORCE_DIRS))

$(PROGRAM_NAME) : $(patsubst %.c, %.o, $(wildcard *.c)) 
	gcc $^ -o $@

VPATH = $(SOURCE_DIRS)

%.c : %.y
	bison -d -o $@ $<

%.c : %.l
	flex -o $@ $<

%.o : %.c 
	gcc -c -MMD $(addprefix -I, $(SOURCE_DIRS)) $<

include $(wildcard *.d)

.PHONY : clear yout

yout : y.y
	bison -v $< 

clear :
	rm -f *.d *.o source.c y.c $(PROGRAM_NAME) *.output
