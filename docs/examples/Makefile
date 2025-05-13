MARKDOWNS := $(shell find . -name "*.md")
TARGETS   := $(subst .md,.pdf,$(MARKDOWNS))
TARGETS   += $(subst .md,.html,$(MARKDOWNS))

OPTIONS   += -V CJKmainfont="华文楷体"
OPTIONS   += --pdf-engine=xelatex
OPTIONS   += -f markdown-space_in_atx_header-intraword_underscores
# OPTIONS   += --highlight-style pygments
OPTIONS   += --highlight-style tango
OPTIONS   += --number-sections --filter pandoc-crossref

all: $(TARGETS)

clean: 
	rm -f $(TARGETS)

# since images path is relative to its markdown files, 
# change to the directory of the markdown file and make
%.pdf: %.md
	cd $(dir $<) && pandoc $(OPTIONS) $(notdir $<) -o $(notdir $@)

%.html: %.md
	cd $(dir $<) && pandoc -s --mathjax $(OPTIONS) $(notdir $<) -o $(notdir $@)

.PHONY: all clean