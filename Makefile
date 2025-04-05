# Makefiel for merging Markdown files and converting Markdown to PDF

# Copy all files to the 'dist' directory, where .md files will have their 
# extensions changed to .markdown. Later, rules will be defined to convert 
# these .markdown files into the final .md files.
DOCUMENTS := $(shell find docs -type f)
DUPLICATE := $(patsubst docs%,dist%,$(subst .md,.markdown,$(DOCUMENTS)))
MARKDOWNS := $(shell find docs -name "*.md")

# Proccessed .md documents (will be created in the directory 'dist')
TARGETS   := $(patsubst docs/%,%,$(MARKDOWNS))

# PDF documents (will be created in the directory 'dist')
PDFS := $(patsubst docs/%,%,$(subst .md,.pdf,$(wildcard docs/*.md)))

# PDF documents (will be created in the directory 'dist')
TEXS := $(patsubst docs/%,%,$(subst .md,.tex,$(wildcard docs/*.md)))

# Don't export variables, evaluate them directly in submakefile
# export TARGETS
# export PDFS

all: $(DUPLICATE) dist/Makefile dist/depends
	make -C dist

# Create PDF documents
pdf: all
	make -C dist pdf

# Create LaTeX documents
tex: all
	make -C dist tex

clean:
	@echo "Removing the 'dist' directory ..."
	@rm -rf dist

# Rule: create Makefile in the directory 'dist'
dist/Makefile:
	@echo "Creating Makefile ..."
	@mkdir -p dist
	@echo "$$submakefile" > $@

# Rule: automatically generating inclusion dependencies between Markdown files
dist/depends: $(MARKDOWNS)
	@echo "Creating 'depends' ..."
	@mkdir -p dist
	@$(makedepend)

# Rule: copy Markdown files and change extensions
dist/%.markdown: docs/%.md
	@echo "Duplicating '$<' ..."
	@mkdir -p $(dir $@)
	@cp -rf $< $@

# Rule: copy other files to the directory 'dist'
dist/%: docs/%
	@echo "Duplicating '$<' ..."
	@mkdir -p $(dir $@)
	@cp -rf $< $@

.PHONY: all clean

# automatically generating inclusion dependencies between Markdown files
define makedepend
find docs -name "*.md" -exec                   \
awk 'match($$0, /^!\[\[([^]]+)\]\] *$$/, a) { \
  gsub(/^ +| +$$/, "", a[1]);                  \
  if (!seen[a[1]]++) {                         \
    files = (files ? files " " : "") a[1]      \
  }                                            \
}                                              \
END {                                          \
  if (files) {                                 \
    sub(/^docs\//, "", FILENAME);              \
    print FILENAME ": " files                  \
  }                                            \
}' {} \;                                       \
> dist/depends
endef

# https://stackoverflow.com/questions/649246/is-it-possible-to-create-a-multi-line-string-variable-in-a-makefile
# It is almost impossible to use a heredoc with tab indentation in a Makefile;
# additionally, when it comes to the number of dollar signs below variables, 
# the actual number of dollar signs output is only half.
define submakefile
# TARGETS is defined in parent Makefile
all: $(TARGETS) 

pdf: $(PDFS)

tex: $(TEXS)

include ../options
include depends

# Rule: perform file inclusion
%.md: %.markdown
	@echo "Procesing '$$<' ..."
	@perl -ne 's/^!\[\[(.+)\]\]\ *$$$$/`cat $$$$1`/e;print' $$< > $$@

# Rule: create PDF document
%.pdf: %.md
	pandoc $$(OPTIONS) $$< -o $$@

# Rule: create PDF document
%.tex: %.md
	pandoc $$(OPTIONS) $$< -o $$@
endef

export submakefile