MARKDOWNS := $(shell find . -name "*.md")
TARGETS   += $(subst .md,.html,$(MARKDOWNS)) # standalone
SNIPPET   += $(subst .md,.tex,$(MARKDOWNS)) # snippets

all: $(TARGETS) $(SNIPPET)

clean: 
	rm -f $(TARGETS) $(SNIPPET)

%.html: %.md
	pandoc $< -s -o $@

%.tex: %.md
	pandoc --listings $< -o $@

.PHONY: all clean