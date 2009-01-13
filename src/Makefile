PROGRAM_NAME := calc
HOME_DIRS := src
SOURCE_DIRS := src bin
SOURCE := *.y *.l *.c
CFLAGS = -MMD $(addprefix -I, $(SOURCE_DIRS))

SOURCE_DIRS := $(addprefix ../, $(SOURCE_DIRS))
SOURCE := $(addprefix ../$(HOME_DIRS)/, $(SOURCE))
OBJECTS := $(addsuffix .o, $(basename $(wildcard $(SOURCE))))

$(PROGRAM_NAME) : $(notdir $(OBJECTS))
	$(CC) $^ -o $@

VPATH = $(SOURCE_DIRS)

.PHONY : clean all

clean :
	rm -f *.d $(OBJECTS) source.c y.c y.tab.h $(PROGRAM_NAME) *.output

-include $(wildcard *.d)
