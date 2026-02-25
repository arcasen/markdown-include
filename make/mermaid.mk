# markdown-and-pandoc-essentials.md: images/class-diagram.png

%.png: %.mmd
	mmdc -i $< -o $@ -s 4