PROGRAM_NAME := calc
SRC = src
BINDIR = bin
DDIR = dbuild
export PROGRAM_NAME := $(addprefix ../$(BINDIR)/, $(PROGRAM_NAME))
all : 
	mkdir -p $(BINDIR) $(DDIR)
	$(MAKE) -C $(DDIR) -f ../$(SRC)/Makefile

clean :
	$(RM) -r $(DDIR) $(BINDIR)

.PHONY : all clean
