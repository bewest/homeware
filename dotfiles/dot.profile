# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export SSH_ASK_PASS=
export LL_DJANGO_MODE=local
export DJANGO_SETTINGS_MODULE=settings
export EDITOR=vim
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
if [ -d $HOME/bin ] ; then
  export PATH="$HOME/bin:$PATH"
fi

alias ls="ls --color=auto"
keychain --inherit any ~/.ssh/id_rsa ; . ~/.keychain/$(hostname)-sh


#####
# EOF
