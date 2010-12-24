PROGRAM_NAME := calc
DOC_NAME = doc.pdf
SRCDIR = src
BINDIR = bin
DDIR = dbuild
DOCDIR = doc
export PROGRAM_NAME := $(addprefix ../$(BINDIR)/, $(PROGRAM_NAME))
export DOC_NAME := $(addprefix ../$(BINDIR)/, $(DOC_NAME))

all : app #docs

app : 
	mkdir -p $(BINDIR) $(DDIR)
	$(MAKE) -C $(DDIR) -f ../$(SRCDIR)/Makefile

docs : 
	mkdir -p $(BINDIR) $(DDIR)
	$(MAKE) -C $(DDIR) -f ../$(DOCDIR)/Makefile	

clean :
	$(RM) -r $(DDIR) $(BINDIR)

.PHONY : all clean
