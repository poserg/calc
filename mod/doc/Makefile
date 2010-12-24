DOC_NAME := main
IMG_DIR = image
DIA_SRC = *.dia
TEX = latex

all : $(wildcard *.tex)
	$(TEX) $(DOC_NAME).tex
#	bibtex $(DOC_NAME).aux
	$(TEX) $(DOC_NAME).tex
	$(TEX) $(DOC_NAME).tex

pdf : all
	dvipdf main.dvi

clean :
	$(RM) *.dvi *.toc *.log *.aux *.pdf *.blg *.bbl *.ps *.out _region_* $(IMG) $(IMG_PNG) $(IMG_PDF) *.idx *.ind *.ilg
