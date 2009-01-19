PROGRAM_NAME = calc
DDIR = dbuild
BINDIR = bin
SRCDIR = src
DIR := $(DDIR) $(BINDIR)
export PROGRAM_NAME := $(addprefix ../$(BINDIR)/, $(PROGRAM_NAME))
export DDIR := $(addprefix ../, $(DDIR))
all :
	mkdir -p $(DIR)
	$(MAKE) -C $(SRCDIR)
clean :
	$(RM) -r $(DIR) 

.PHONY : all clean
