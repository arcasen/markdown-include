example.pdf: example.md references.bib
	pandoc -d defaults.yaml example.md -o example.pdf

clean:
	rm *.pdf

.PHONY: clean