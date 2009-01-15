PROGRAM_NAME = calc
SOURCE_DIRS = src
BIN_DIR = bin
DDIR = dbuild
SRC := y.y source.l main.c
CFLAGS = -MMD $(addprefix -I, $(SOURCE_DIRS))

#OBJECTS := $(addprefix $(DDIR)/, $(addsuffix .o, $(basename $(SOURCE))))
SRC := $(addprefix $(SOURCE_DIRS)/, $(SRC))
OBJ := $(addprefix $(DDIR)/, $(notdir $(addsuffix .o, $(basename $(SRC)))))
PROGRAM_NAME := $(BIN_DIR)/$(PROGRAM_NAME)

all : $(PROGRAM_NAME)

$(PROGRAM_NAME) : $(OBJ)
	$(CC) $^ -o $@ 

$(OBJ):$(SOURCE_DIRS)/%.c
	$(CC) -c $<



VPATH = $(SOURCE_DIRS):$(DDIR)

#.SECONDARY : $(OBJECTS:.o=.c)

.PHONY : all clean

clean :
	$(RM) *.d $(OBJECTS) source.c y.c y.tab.h $(PROGRAM_NAME) *.output

-include $(wildcard *.d)
