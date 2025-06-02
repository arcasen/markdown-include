TARGETS := example.pdf example.html example.tex
OPTIONS := -d defaults.yaml --metadata-file metadata.yaml

all: $(TARGETS)

%.html: %.md
	pandoc $(OPTIONS) --mathjax -s $< -o $@

%.pdf: %.md
	pandoc $(OPTIONS) $< -o $@

%.tex: %.md
	pandoc $(OPTIONS) -s $< -o $@

clean:
	rm $(TARGETS)

.PHONY: all clean