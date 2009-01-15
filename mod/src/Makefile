CFLAGS = -MMD -I$(SRCDIR) -I.
SRCDIR = ../src
SRC = y.y source.l main.c
SRC := $(addprefix $(SRCDIR)/, $(SRC))
OBJ := $(notdir $(addsuffix .o, $(basename $(SRC))))

all: $(OBJ)

VPATH = $(SRCDIR)

.SECONDARY : *.c

.PHONY : all

-include *.d
