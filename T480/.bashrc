# $HOME/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# HISTCONTROL can take 3 values:
#     - erasedups     Don't store duplicates.
#     - ignorespace   Ignore commands starting with spaces.
#     - ignoreboth    Ignore above mentioned both types.
HISTCONTROL=erasedups

# append to the history file, don't overwrite it.
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=5000
export HISTTIMEFORMAT="%d/%m/%y  %T    "
export HISTFILE=$HOME/.bash/bash_history

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Script to send notification when command takes longer than pre-determined time.
# Set time for long command's timeout.
LONG_RUNNING_COMMAND_TIMEOUT=20
[ -f $HOME/.scripts/undistract-me.sh ] && source $HOME/.scripts/undistract-me.sh

[ -f $HOME/.espconfig ] && source $HOME/.espconfig
[ -f $HOME/.alias ] && source $HOME/.alias

# next 2 lines for git to auto change branch when switched to new directory

[ -f $HOME/.bash/colors.sh ] && source "$HOME/.bash/colors.sh"
[ -f $HOME/.bash/prompt.sh ] && source "$HOME/.bash/prompt.sh"

# change default editor for cscope to vim


# Experiment with PS1


# # save pwd in $PROMPT_COMMAND and /tmp/whereami
# export PROMPT_COMMAND="pwd > /tmp/whereami"
# # for opening new session in same directory as on previous one.
# cd $(cat /tmp/whereami)

# modifying prompt (PS1)

# While changing PS1, for changing colors, do not use `\e....m` format (Tested
# for MacOS, not Linux). CRLF setting changes due to this. Use other formatting
# as used below.

# sample: shows git branch, user, current working directory with colors in background
# export PS1="\[\033[0m\]Chinmay \[\033[1;48;5;45;38;5;0m\] \w/ \[\033[1;48;5;227;38;5;0m\](\$(git branch 2>/dev/null|grep '^*'|colrm 1 2))$ \[\033[0m\] "

# using `colors.sh` and `prompt.sh` from `$HOME/.bash/git-aware-prompt/`

# export PS1="\[\$bldred\][\[\$bldcyn\]\u \[\$bldylw\]\w\[\$bldred\]] \[\$bldgrn\]\$git_branch\[\$txtrst\]$ "

# reference for color: http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

# With username
# export PS1="\[\033[1;31m\][\[\033[1;36m\]\u \[\033[1;33m\]\w\[\033[1;31m\]] \[\033[1;32m\]\$git_branch\[\033[1;36m\]$\[\033[0m\] "

# Options:
#     - \A for time in HH:MM
#     - \j for number of background jobs
# export PS1="\[\033[1;32m\]\$git_branch\[\033[1;31m\][\[\033[1;33m\]\w \[\033[1;36m\]\A\[\033[1;31m\]]\[\033[01;38;5;208m\] \$([ \j -gt 0 ] && echo [\j])\[\033[0m\]$ "
export PS1="\[\$bldred\][\[\$txtrst\]\[\$txtcyn\]\A \[\$txtylw\]\w\[\$bldred\]]\[\$txtrst\]\[\$txtgrn\]\$git_branch\[\033[01;38;5;208m\]\$([ \j -gt 0 ] && echo [\j])\[\$txtrst\]$ "
# export PS1="\[\$bldgrn\]\$(__git_ps1)\[\$bldred\][\[\$bldylw\]\w \[\$bldcyn\]\A\[\$bldred\]]\[\033[01;38;5;208m\]\$([ \j -gt 0 ] && echo [\j])\[\$txtrst\] $ "
# Depth of `$PWD` is decided by this.
export PROMPT_DIRTRIM=2

# Write path to current working directory in file `$HOME/.cwd`. This file is used in
# i3 config to open new terminal in same directory.
if [ -n "$PROMPT_COMMAND" ]; then
    PROMPT_COMMAND="pwd > '${HOME}/.cwd'; $PROMPT_COMMAND"
else
    PROMPT_COMMAND="pwd > '${HOME}/.cwd'"
fi

# Show desktop information with logo in a facny way!
# screenfetch

# Set options for `less` to not bloat terminal when exitted from less. Mainly used in git. Outputs
# of `git branch` also disappears after setting # this option.
export LESS=R

# Autocorrect some misspelled words during `cd`.
shopt -s cdspell
