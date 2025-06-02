all: dist/main.md
	$(call resolvepath,$<)

dist/main.md:
	cp -rf docs dist

clean:
	rm -rf dist

# define resolvepath
# sed -i -E -e "/\!\[.*\]\(\ *(http|https|ftp):\/\/[^)]*\)/b"      \
# -e "/\!\[.*\]\(\ *(\/|\~)[^)]*\)/b"                              \
# -e "s|\!\[([^]]*)\]\(([^)]*)\)|\![\1]($(shell dirname $<)/\2)|g" \
# -e "/^\!\[\[\ *(\/|\~)[^]]*\]\]$$/b"                             \
# -e "s|^\!\[\[\ *([^]]*)\]\]$$|![[$(shell dirname $<)\/\1]]|g" $1
# endef

define resolvepath
sed -i -E -e "/\!\[([^]]*)\]\(\ *(http|https|ftp):\/\/[^)]*\)/b"      \
-e "/\!\[([^]]*)\]\(\ *(\/|\~)[^)]*\)/b"                              \
-e "s|\!\[([^]]*)\]\(\ *([^)]*)\)|\![\1]($(dir $<)\2)|g"         \
-e "/^\!\[\[\ *(\/|\~)[^]]*\]\]$$/b"                             \
-e "s|^\!\[\[\ *([^]]*)\]\]$$|![[$(dir $<)\1]]|g" $1
endef