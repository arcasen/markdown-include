# convert markamp markdown to png

%.png: %.mm.md
	markmap $< --offline --no-toolbar --no-open -o $*.html
	mmap -i $*.html -o $@ -s 3