########################################################
#
# Used to manage my homeware.
# 
# TODO: Add some documentation.  It's been long enough that I now find
#       this confusing.
#
#


BIN_FILES=$(patsubst bin/%,$(HOME)/bin/%,$(wildcard bin/*))
DOT_FILES=$(wildcard dotfiles/*)
DOT_HOMES=$(patsubst dotfiles/dot.%,$(HOME)/.%,$(DOT_FILES))

DIFF_PREREQS=$(addprefix diff-, $(DOT_FILES))

diff2name=$(subst diff-,,$(1))
diff2dot=$(patsubst diff-$(HOME)/.%,dotfiles/dot.%,$(1))
name2diff=$(addprefix diff-, $(1))
diff= diff -x ".git" -x ".gitignore" -ur

home2dot=$(patsubst $(HOME)/.%,dotfiles/dot.%,$(1))
dot2home= $(patsubst dotfiles/dot.%,$(HOME)/.%,$(1))

diff_tracked_home=$(foreach F,$(1),$(diff) $(F) $(call home2dot,$(F)))
map = $(foreach a,$(2),$(call $(1),$(a)))

DIFF_TARGETS=$(call name2diff,$(DOT_HOMES))
CP_FILE=cp -v
CP_DIR=cp -vr


all:

ignore:
	@echo $@
	@echo DOT_FILES
	@echo $(DOT_FILES) | xargs -n 1 echo
	@echo DOT_HOMES
	@echo $(DOT_HOMES) | xargs -n 1 echo
	@echo DIFF_TARGETS
	@echo $(DIFF_TARGETS) | xargs -n 1 echo

install: bin dotfiles

dotfiles: $(DOT_HOMES)
        
diff:
	diff -ur ~/bin/ bin/

diff-dotfiles: $(DIFF_TARGETS)
  

$(DIFF_TARGETS):
ifdef INC 
	$(diff) $(call home2dot,$(call diff2name,$@)) $(call diff2name,$@)
else 
	# $(diff) $(call home2dot,$(call diff2name,$@)) $(call diff2name,$@) || echo -n ''
	@$(diff) $(call home2dot,$(call diff2name,$@)) $(call diff2name,$@) || echo -n ''
endif

diff-dotfiles-ssh:
	diff -ur ~/.ssh/ dotfiles/dot.ssh/

bin: ~/bin/

~/bin/: bin/
	#hg archive -t files -I $^ ~
	#echo T $^  D $@
	git archive --format=tar HEAD $^ |  ( cd ~;  tar -xvf - )


~/%.git%: dotfiles/%.git%
	#Ignore git.

# DOT_HOMES
~/.%: dotfiles/dot.%
	rsync -av --exclude="*.git*" $^ $@
	#mkdir -p $(@D)
	#test -f $^ &&  $(CP_FILE) $^ $@ || $(CP_DIR) $^/* $@

.PHONY: dotfiles diff diff-* $(DIFF_PREREQS) $(DIFF_TARGETS)

#####
# EOF
