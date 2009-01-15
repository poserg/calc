PROGRAM_NAME = ../$(BIN_DIR)/calc
HOME_DIRS := src
SOURCE_DIRS := src dbuild
BIN_DIR := bin
DDIR = dbuild
SOURCE := y.y source.l main.c
CFLAGS = -MMD $(addprefix -I, $(SOURCE_DIRS))

SOURCE_DIRS := $(addprefix ../, $(SOURCE_DIRS))
SOURCE := $(addprefix ../$(HOME_DIRS)/, $(SOURCE))
OBJECTS := $(notdir $(addsuffix .o, $(basename $(SOURCE))))

$(PROGRAM_NAME) : $(OBJECTS)
	$(CC) $^ -o $@ 

VPATH = $(SOURCE_DIRS)

.SECONDARY : $(OBJECTS:.o=.c)

.PHONY : clean all

clean :
	rm -f *.d $(OBJECTS) source.c y.c y.tab.h $(PROGRAM_NAME) *.output

-include $(wildcard *.d)
