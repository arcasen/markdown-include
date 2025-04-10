MARKDOWNS := $(wildcard *.md)
TARGETS   := $(subst .md,.pdf,$(MARKDOWNS))

OPTIONS   += -V CJKmainfont="方正楷体_GBK"
OPTIONS   += --pdf-engine=xelatex
OPTIONS   += -f markdown-space_in_atx_header-intraword_underscores
# OPTIONS   += --highlight-style pygments
OPTIONS   += --highlight-style tango

all: $(TARGETS)

clean: 
	rm -f $(TARGETS)

%.pdf: %.md
	pandoc $(OPTIONS) $< -o $@

.PHONY: all clean