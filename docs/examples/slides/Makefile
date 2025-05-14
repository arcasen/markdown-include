TARGETS := habits.pdf habits.html habits.pptx

all: $(TARGETS)

clean: 
	rm -f $(TARGETS)

.PHONY: all clean

%.html: %.txt
	pandoc -t revealjs -s $< -o $@

%.pdf: %.txt
	pandoc -t beamer -s $< -o $@

%.pptx: %.txt
	pandoc -s $< -o $@