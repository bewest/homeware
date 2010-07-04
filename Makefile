########################################################
#
# Used to manage my homeware.
#
#


BIN_FILES=$(patsubst bin/%,~/bin/%,$(wildcard bin/*))
DOT_FILES=$(wildcard dotfiles/*)
DOT_HOMES=$(patsubst dotfiles/dot.%,~/.%,$(DOT_FILES))

all:
	echo $(DOT_FILES)
install: ~/bin/ dotfiles

dotfiles: $(DOT_HOMES)
        
diff:
	diff ~/bin/ bin/

~/bin/: bin/
	hg archive -t files -I $^ ~


~/.%: dotfiles/dot.%
	cp -vr $^ $@

.PHONY: dotfiles diff

#####
# EOF
