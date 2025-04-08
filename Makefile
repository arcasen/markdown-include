# Makefiel for merging Markdown files and converting Markdown to PDF

# Specify input and output directories
DOCS ?= docs
DIST ?= dist

# Copy all files to the '$(DIST)' directory, where .md files will have their 
# extensions changed to .markdown. Later, rules will be defined to convert 
# these .markdown files into the final .md files.
DOCUMENTS := $(shell find $(DOCS) -type f)
DUPLICATE := $(patsubst $(DOCS)%,$(DIST)%,$(subst .md,.markdown,$(DOCUMENTS)))
MARKDOWNS := $(patsubst $(DOCS)%.md,$(DIST)%.markdown,$($(shell find $(DOCS) -name "*.md")))

# Proccessed .md documents (will be created in the directory '$(DIST)')
TARGETS   := $(patsubst $(DIST)/%,%,$($(subst .markdown,.md,$(MARKDOWNS))))

# PDF documents (will be created in the directory '$(DIST)')
PDFS := $(patsubst $(DOCS)/%,%,$(subst .md,.pdf,$(wildcard $(DOCS)/*.md)))

# Tex documents (will be created in the directory '$(DIST)')
TEXS := $(patsubst $(DOCS)/%,%,$(subst .md,.tex,$(wildcard $(DOCS)/*.md)))

# HTML documents (will be created in the directory '$(DIST)')
HTML := $(patsubst $(DOCS)/%,%,$(subst .md,.html,$(wildcard $(DOCS)/*.md)))

# Don't export variables, evaluate them directly in submakefile
# export TARGETS
# export PDFS

all: $(DUPLICATE) $(DIST)/Makefile $(DIST)/depends $(DIST)/options
	make -C $(DIST)

# Create PDF documents
pdf: all
	make -C $(DIST) pdf

# Create LaTeX documents
tex: all
	make -C $(DIST) tex

# Create html documents
html: all
	make -C $(DIST) html

clean:
	@echo "Removing the '$(DIST)' directory ..."
	@rm -rf $(DIST)

# Rule: create Makefile in the directory '$(DIST)'
$(DIST)/Makefile:
	@echo "Creating Makefile ..."
	@mkdir -p $(DIST)
	@echo "$$submakefile" > $@

$(DIST)/options: options
	@echo "Creating 'options' ..."
	@mkdir -p $(DIST)
	@cp -f $< $@

# Rule: automatically generating inclusion dependencies between Markdown files
$(DIST)/depends: $(MARKDOWNS)
	@echo "Creating 'depends' ..."
	@mkdir -p $(DIST)
	@$(makedepend)

# Rule: copy Markdown files, change extension and resolve paths
$(DIST)/%.markdown: $(DOCS)/%.md
	@echo "Duplicating '$<' ..."
	@mkdir -p $(dir $@)
	@cp -rf $< $@
	@$(call resolvepath,$@)

# Rule: copy other files to the directory '$(DIST)'
$(DIST)/%: $(DOCS)/%
	@echo "Duplicating '$<' ..."
	@mkdir -p $(dir $@)
	@cp -rf $< $@

.PHONY: all clean

# Resolving paths of embedded images and markdowns
define resolvepath
$(eval RELPATH := $(patsubst $(DIST)/%,%,$(dir $1)))
sed -i -E -e "/\!\[.*\]\(\ *(http|https|ftp):\/\/[^)]*\)/b" \
-e "/\!\[.*\]\(\ *(\/|\~)[^)]*\)/b"                         \
-e "s|\!\[([^]]*)\]\(\ *([^)]*)\)|\![\1]($(RELPATH)\2)|g"   \
-e "/^\!\[\[\ *(\/|\~)[^]]*\]\]$$/b"                        \
-e "s|^\!\[\[\ *([^]]*)\]\]$$|![[$(RELPATH)\1]]|g" $1
endef

# automatically generating inclusion dependencies between Markdown files
define makedepend
find $(DIST) -name "*.markdown" -exec          \
awk 'match($$0, /^!\[\[([^]]+)\]\] *$$/, a) {  \
  gsub(/^ +| +$$/, "", a[1]);                  \
  if (!seen[a[1]]++) {                         \
    files = (files ? files " " : "") a[1]      \
  }                                            \
}                                              \
END {                                          \
  if (files) {                                 \
    sub(/^$(DIST)\//, "", FILENAME);           \
    print FILENAME ": " files                  \
  }                                            \
}' {} \;                                       \
> $(DIST)/depends
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

html: $(HTML)

include options
include depends

# Rule: perform file inclusion
%.md: %.markdown
	@echo "Procesing '$$<' ..."
	@perl -ne 's/^!\[\[(.+)\]\]\ *$$$$/`cat $$$$1`/e;print' $$< > $$@

# Rule: create PDF document
%.pdf: %.md
	pandoc $$(OPTIONS) $$< -o $$@

# Rule: create LaTeX document
%.tex: %.md
	pandoc $$(OPTIONS) $$< -o $$@

# Rule: create html document
%.html: %.md
	pandoc -f markdown+emoji $$< -o $$@
endef

export submakefile