CFLAGS = -MMD $(addprefix -I, $(DDIR) .)
SOURCE := y.y source.l main.c
OBJ = $(addprefix $(DDIR)/, $(addsuffix .o, $(basename $(notdir $(SOURCE)))))
ifeq (0, $(MAKELEVEL))
PROGRAM_NAME := calc
DDIR = .
endif

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
	$(RM) *.d *.o y.h y.c source.c calc

-include $(DDIR)/*.d
