OPTIONS   += -V CJKmainfont="华文楷体"
OPTIONS   += --pdf-engine=xelatex

example.pdf: example.md references.bib
	pandoc $(OPTIONS) example.md --citeproc --bibliography=references.bib -o example.pdf