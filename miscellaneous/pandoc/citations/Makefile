pdf: output.pdf

html: output.html

output.pdf: input.md references.bib
	pandoc $< -M link-citations=true --bibliography references.bib --citeproc -o $@

output.html: input.md references.bib
	pandoc $< -M link-citations=true --bibliography references.bib --citeproc -o $@

clean: 
	rm -f output.*

.PHONY: output.pdf