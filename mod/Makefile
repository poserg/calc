PROGRAM_NAME = calc
SOURCE_DIRS = src
BIN_DIR = bin
DDIR = dbuild
SOURCE := y.y source.l main.c
CFLAGS = -MMD $(addprefix -I, $(SOURCE_DIRS))

OBJECTS := $(addprefix $(DDIR)/, $(addsuffix .o, $(basename $(SOURCE))))
SOURCE := $(addprefix $(SOURCE_DIRS)/, $(SOURCE))
$(PROGRAM_NAME) := $(BIN_DIR)/$(PROGRAM_NAME)

all : #$(PROGRAM_NAME)
	@echo $(VPATH)

$(PROGRAM_NAME) : $(OBJECTS)
	$(CC) $^ -o $@ 

VPATH = $(SOURCE_DIRS) $(DDIR)

.SECONDARY : $(OBJECTS:.o=.c)

.PHONY : all clean

clean :
	$(RM) *.d $(OBJECTS) source.c y.c y.tab.h $(PROGRAM_NAME) *.output

-include $(wildcard *.d)
