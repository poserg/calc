CFLAGS = -MMD -I$(SRCDIR) -I.
LOADLIBES = -lm
SRCDIR = ../src
SRC = y.y source.l main.c
SRC := $(addprefix $(SRCDIR)/, $(SRC))
OBJ := $(notdir $(addsuffix .o, $(basename $(SRC))))
ifeq "0" "$(MAKELEVEL)"
PROGRAM_NAME = calc
endif

all: $(PROGRAM_NAME)

$(PROGRAM_NAME) : $(OBJ)
	$(CC) -o $@ $^ $(LOADLIBES)

VPATH = $(SRCDIR)

clean :
	$(RM) *.d $(OBJ) $(PROGRAM_NAME) source.c y.tab.h y.c

.SECONDARY : $(OBJ:.o=.c)

.PHONY : all clean

-include *.d
