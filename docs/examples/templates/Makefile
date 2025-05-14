TARGETS := document.pdf document.tex
OPTIONS := --template ./simple.latex
# OPTIONS += --top-level-division chapter

all: $(TARGETS)

clean: 
	rm -f $(TARGETS)

.PHONY: all clean

%.pdf: %.md
	pandoc --pdf-engine=xelatex  $(OPTIONS) -o $@ $<

%.tex: %.md
	pandoc -s $(OPTIONS) -o $@ $<

