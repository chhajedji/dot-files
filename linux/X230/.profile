# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
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

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

export TERMINAL="urxvt"

# dolphin, system settings and other KDE applications will not look ugly!
export XDG_CURRENT_DESKTOP=KDE

# Feature under test. Anything related to fonts/language crashes, remove this
# line or replace by
#           export LC_ALL=en_IN
export LC_ALL=en_IN.UTF-8

export PATH="$HOME/.config/i3/scripts:$PATH"
export PATH="/home/chinmay/.bash/git-open:$PATH"
