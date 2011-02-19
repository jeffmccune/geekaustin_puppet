# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

export EDITOR=vim
export TERM=xterm

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
