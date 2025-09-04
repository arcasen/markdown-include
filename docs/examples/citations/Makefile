MARKDOWNS := $(wildcard *.md)
TARGETS := $(subst .md,.tex,$(MARKDOWNS))
TARGETS += $(subst .md,.pdf,$(MARKDOWNS))
TARGETS += $(subst .md,.html,$(MARKDOWNS))
OPTIONS := -d defaults.yaml --metadata-file metadata.yaml

all: $(TARGETS)

%.html: %.md
	pandoc $(OPTIONS) --mathjax -s $< -o $@

%.pdf: %.md
	pandoc $(OPTIONS) --template stenciler.latex $< -o $@

%.tex: %.md
	pandoc $(OPTIONS) --template stenciler.latex -s $< -o $@

clean:
	rm -f *.html *.pdf *.tex

.PHONY: all clean