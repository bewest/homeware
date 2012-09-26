#!/bin/bash
# Screen is capable of dynamically receiving all kinds of messages to
# do useful things, including experimenting with the caption and
# hardstatusline.  This script exeriments with settings a session
# named by the first argument to create a solarized screen theme.
# https://github.com/tmsanrinsha/dotfiles/blob/master/.screenrc
# http://ethanschoonover.com/solarized
# http://www.ibb.net/~anne/keyboard.html
# http://www.ibb.net/~anne/keyboard/keyboard.html#terminfo
# http://aperiodic.net/screen/appearance
# http://aperiodic.net/screen/appearance#commands
# http://aperiodic.net/screen/commands:hardstatus
# http://aperiodic.net/screen/man:string_escapes
# http://aperiodic.net/screen/commands:caption
# http://aperiodic.net/screen/man:string_escapes
# http://www.gnu.org/software/screen/manual/html_node/Title-Prompts.html#Title-Prompts
session=${1-bewest}
screen -S $session -X caption always "%{= kb}[%H] %?%-Lw%?%{=b GW}%n*%f %t%?(%u)%?%{-b kb}%?%+Lw%?"
#####
# EOF
