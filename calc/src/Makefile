PROGRAM_NAME := calc
CFLAGS = -MMD $(addprefix -I, $(SOURCE_DIRS))
DDIR = ../dbuild
SOURCE_DIRS := ../src $(DDIR) 
SOURCE := y.y source.l main.c
OBJ = $(addprefix $(DDIR)/, $(addsuffix .o, $(basename $(notdir $(SOURCE)))))
PROGRAM_NAME := ../bin/$(PROGRAM_NAME)

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
	$(RM)  $(DDIR)/* ../bin/*

-include $(DDIR)/*.d
