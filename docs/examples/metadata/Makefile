MARKDOWNS := $(shell find . -name "*.md")
TARGETS   := $(subst .md,.json,$(MARKDOWNS))
TARGETS   += $(subst .md,.hs,$(MARKDOWNS))

all: $(TARGETS)

clean:
	rm -f $(TARGETS)

.PHONY: all clean

%.json: %.md
	pandoc -s -t json $< | python3 -m json.tool > $@

%.hs: %.md
	pandoc -s -t native $< > $@