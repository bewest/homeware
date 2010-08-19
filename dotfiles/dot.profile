

export SSH_ASK_PASS=
export LL_DJANGO_MODE=local
export DJANGO_SETTINGS_MODULE=settings
export EDITOR=vim
export TERM=xterm-color
export SVNEDITOR=$EDITOR
export REPREPRO_BASE_DIR=~/public_html/reprepro/
export HGLLBASE=ssh://bewest@hg.lindenlab.com
export HGBASE=ssh://bewest@bewest.bitbucket.org/
export PATH=~/.cabal/bin:$PATH

alias ls="ls --color=auto"
keychain --inherit any ~/.ssh/id_rsa ; . ~/.keychain/$(hostname)-sh


#####
# EOF
