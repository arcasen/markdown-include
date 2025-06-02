MARKDOWNS := $(shell find . -name "*.md")
TARGETS   := $(subst .md,.pdf,$(MARKDOWNS))
TARGETS   += $(subst .md,.tex,$(MARKDOWNS))
TARGETS   += $(subst .md,.html,$(MARKDOWNS))

OPTIONS   += -V CJKmainfont="华文楷体"
OPTIONS   += --pdf-engine=xelatex
OPTIONS   += --filter define-textcolor.py --filter define-environment.py

all: $(TARGETS)

clean: 
	rm -f $(TARGETS)

# since images path is relative to its markdown files, 
# change to the directory of the markdown file and make
%.pdf: %.md
	cd $(dir $<) && pandoc $(OPTIONS) $(notdir $<) -o $(notdir $@)

%.tex: %.md
	cd $(dir $<) && pandoc $(OPTIONS) $(notdir $<) -s -o $(notdir $@)

%.html: %.md
	cd $(dir $<) && pandoc -s --mathjax $(OPTIONS) $(notdir $<) -o $(notdir $@)

.PHONY: all clean