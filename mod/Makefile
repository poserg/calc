PROGRAM_NAME := calc
SRCDIR = src
BINDIR = bin
DDIR = dbuild
export PROGRAM_NAME := $(addprefix ../$(BINDIR)/, $(PROGRAM_NAME))
all : 
	mkdir -p $(BINDIR) $(DDIR)
	$(MAKE) -C $(DDIR) -f ../$(SRCDIR)/Makefile

clean :
	$(RM) -r $(DDIR) $(BINDIR)

.PHONY : all clean
