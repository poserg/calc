PROGRAM_NAME := calc
DDIR = .
CFLAGS = -MMD $(addprefix -I, $(DDIR))
SOURCE := y.y source.l main.c
OBJ = $(addprefix $(DDIR)/, $(addsuffix .o, $(basename $(notdir $(SOURCE)))))

all : $(PROGRAM_NAME)

$(PROGRAM_NAME) : $(OBJ)
	$(CC) $^ -o $@

%.o : %.c
	$(CC) -c $(CFLAGS) -o $@ $<

$(DDIR)/%.o : %.c 
	$(CC) -c $(CFLAGS) -o $@ $<

$(DDIR)/%.c $(DDIR)/%.h: %.y
	$(YACC) -o $@ $<

$(DDIR)/%.c : %.l
	$(LEX) -o $@ $< 

.SECONDARY : $(OBJ:.o=.c)

.PHONY : all clean

clean :
	$(RM)  $(DDIR)/$(filter-out $(SOURCE) main.h, *.*) calc ../bin/*

-include $(DDIR)/*.d
