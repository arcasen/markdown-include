# install mmap-cli:
# https://github.com/arcasen/mmap-cli

MARKMAPS := $(shell find . -name "*.mm.md")
HTML := $(subst .mm.md,.html,$(MARKMAPS))
PNGS := $(subst .mm.md,.png,$(MARKMAPS))
PDFS := $(subst .mm.md,.pdf,$(MARKMAPS))
TARGETS := $(HTML) $(PNGS) $(PDFS)

all: $(TARGETS)

clean:
	rm -f $(TARGETS)

%.html: %.mm.md
	markmap $< --offline --no-toolbar --no-open -o $@

%.png: %.html
	mmap -i $< -o $@

%.pdf: %.html
	mmap -i $< -o $@

.PHONY: all clean