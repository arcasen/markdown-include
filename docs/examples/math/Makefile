MARKDOWNS := $(wildcard *.md)
HTML      := $(subst .md,.html,$(MARKDOWNS))
DOCX      := $(subst .md,.docx,$(MARKDOWNS))
PDF       := $(subst .md,.pdf,$(MARKDOWNS))

all: $(HTML) $(DOCX) $(PDF)

clean:
	rm -f $(HTML) $(DOCX) $(PDF)

# Use MathJax
%.html: %.md
	pandoc -s --mathjax -o $@ $<

%.docx: %.md
	pandoc -s -o $@ $<

%.pdf: %.md
	pandoc --pdf-engine=xelatex -o $@ $<

# Use MathML
# %.html: %.md
# 	pandoc -s --mathml -o $@ $<

.PHONY: all