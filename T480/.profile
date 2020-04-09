# $HOME/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if $HOME/.bash_profile or $HOME/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export TERMINAL="urxvt"

# dolphin, system settings and other KDE applications will not look ugly!
export XDG_CURRENT_DESKTOP=KDE

# Feature under test. Anything related to fonts/language crashes, remove this
# line or replace by
#           export LC_ALL=en_IN
export LC_ALL=en_IN.UTF-8

export PATH="$HOME/.scripts:$PATH"
export KDE_SESSION_VERSION=5
export EDITOR=vim
export CSCOPE_EDITOR=$EDITOR
export BROWSER="firefox -new-window"

#       # Add colors to less.
#       # Start blinking
#       LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
#       # Start bold
#       LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
#       # Start stand out
#       LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
#       # End standout
#       LESS_TERMCAP_se=$(tput rmso; tput sgr0)
#       # Start underline
#       LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
#       # End bold, blinking, standout, underline
#       LESS_TERMCAP_me=$(tput sgr0)
# export LESS_TERMCAP_md=$'\e[01;31m'
# export LESS_TERMCAP_me=$'\e[0m'
# export LESS_TERMCAP_se=$'\e[0m'
# export LESS_TERMCAP_so=$'\e[01;44;33m'
# export LESS_TERMCAP_ue=$'\e[0m'
# export LESS_TERMCAP_us=$'\e[01;32m'

# Set cursor autorepeat time (first) and speed (second).
xset r rate 400 50
