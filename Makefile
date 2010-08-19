########################################################
#
# Used to manage my homeware.
#
#


BIN_FILES=$(patsubst bin/%,$(HOME)/bin/%,$(wildcard bin/*))
DOT_FILES=$(wildcard dotfiles/*)
DOT_HOMES=$(patsubst dotfiles/dot.%,$(HOME)/.%,$(DOT_FILES))

DIFF_PREREQS=$(addprefix diff-, $(DOT_FILES))

diff2name=$(subst diff-,,$(1))
diff2dot=$(patsubst diff-$(HOME)/.%,dotfiles/dot.%,$(1))
name2diff=$(addprefix diff-, $(1))
diff= diff -ur

home2dot=$(patsubst $(HOME)/.%,dotfiles/dot.%,$(1))
dot2home= $(patsubst dotfiles/dot.%,$(HOME)/.%,$(1))

diff_tracked_home=$(foreach F,$(1),$(diff) $(F) $(call home2dot,$(F)))
map = $(foreach a,$(2),$(call $(1),$(a)))

DIFF_TARGETS=$(call name2diff,$(DOT_HOMES))

all:

ignore:
	@echo $@
	@echo DOT_FILES
	@echo $(DOT_FILES) | xargs -n 1 echo
	@echo DOT_HOMES
	@echo $(DOT_HOMES) | xargs -n 1 echo

install: ~/bin/ dotfiles

dotfiles: $(DOT_HOMES)
        
diff:
	diff -ur ~/bin/ bin/

diff-dotfiles: all $(DIFF_TARGETS)
  

$(DIFF_TARGETS):
ifdef INC
	$(diff) $(call home2dot,$(call diff2name,$@)) $(call diff2name,$@)
else
	# $(diff) $(call home2dot,$(call diff2name,$@)) $(call diff2name,$@) || echo -n ''
	@$(diff) $(call home2dot,$(call diff2name,$@)) $(call diff2name,$@) || echo -n ''
endif

diff-dotfiles-ssh:
	diff -ur ~/.ssh/ dotfiles/dot.ssh/

~/bin/: bin/
	hg archive -t files -I $^ ~

# DOT_HOMES
~/.%: dotfiles/dot.%
	cp -vr $^ $@

.PHONY: dotfiles diff diff-* $(DIFF_PREREQS) $(DIFF_TARGETS)

#####
# EOF
