PROGRAM_NAME := calc
SOURCE_DIRS := src bin
SOURCE := *.y *.l *.c

SOURCE_DIRS := $(addprefix ../, $(SOURCE_DIRS))
SOURCE := $(foreach DIR, $(SOURCE_DIRS), $(addprefix $(DIR)/, $(SOURCE)))
OBJECTS := $(addsuffix .o, $(basename $(wildcard $(SOURCE)))) 

$(PROGRAM_NAME) : $(notdir $(OBJECTS) )
	gcc $^ -o $@

VPATH = $(SOURCE_DIRS)

%.c : %.y
	bison -d -o $@ $<

%.c : %.l
	flex -o $@ $<

%.o : %.c 
	gcc -c -MMD $(addprefix -I, $(SOURCE_DIRS)) $<

include $(wildcard *.d)

.PHONY : clean yout

yout : y.y
	bison -v $< 

clean :
	rm -f *.d *.o source.c y.c y.h $(PROGRAM_NAME) *.output
