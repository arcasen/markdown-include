MERMAIDS := $(shell find . -name "*.mmd")
DIAGRAMS := $(subst .mmd,.png,$(MERMAIDS))

all: $(DIAGRAMS)

clean:
	rm -rf $(DIAGRAMS)

%.png: %.mmd
	mmdc -i $< -o $@ -s 4

.PHONY: all clean