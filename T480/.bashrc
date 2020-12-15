#    _               _
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#   | |_) | (_| \__ \ | | | | | (__
#   |_.__/ \__,_|___/_| |_|_|  \___|

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
HISTSIZE=100000
HISTFILESIZE=10000
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
# Note that in this script `$PROMPT_COMMAND` gets set appended which delays
# display of prompt. Removing `preexec_set_exit;preexec_invoke_cmd` from
# `$PROMPT_COMMAND` will put the prompt instantly but then this script will not work.

# Set time for long command's timeout.
LONG_RUNNING_COMMAND_TIMEOUT=20
[ -f $HOME/.scripts/undistract-me.sh ] && source $HOME/.scripts/undistract-me.sh

[ -f $HOME/.espconfig ] && source $HOME/.espconfig
[ -f $HOME/.alias ] && source $HOME/.alias

# Set proper names for prompt colors using `tput'.
[ -f $HOME/.bash/colors.sh ] && source "$HOME/.bash/colors.sh"

# Append prompt to keep track of current git branch.
find_git_branch() {
    # Based on: http://stackoverflow.com/a/13003854/170413
    local branch
    git_branch=$(git branch 2>/dev/null|grep '^*'|colrm 1 2)
    if [ -z "$git_branch" ]
    then
        git_branch="$git_branch"
    else
        git_branch="($git_branch)"
    fi
}

# if [ -n "$PROMPT_COMMAND" ]; then
#     PROMPT_COMMAND="find_git_branch;$PROMPT_COMMAND"
# else
#     PROMPT_COMMAND="find_git_branch"
# fi

# Setting prompt (PS1).

# While changing PS1, for changing colors, do not use `\e....m` format (Tested
# for MacOS, not Linux). CRLF setting changes due to this. Use other formatting
# as used below.

# reference for color: http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

# Options:
#     - \A for time in HH:MM
#     - \j for number of background jobs

# export PS1="\[\$bldred\][\[\$txtrst\]\[\$txtcyn\]\A \[\$txtylw\]\w\[\$bldred\]]\[\$txtrst\]\[\$txtgrn\]\$git_branch\[\033[01;38;5;208m\]\$([ \j -gt 0 ] && echo [\j])\[\$txtrst\]$ "

# Minimalist prompt showing current directory and number of background jobs.
# export PS1="\[\$bldwht\]\w\[\033[01;38;5;208m\]\$([ \j -gt 0 ] && echo [\j])\[\$txtrst\]$ "


# Another way to show git branch by using default `__git_ps1`.

# export PS1="\[\$txtred\][\[\$txtylw\]\w \[\$txtcyn\]\A\[\$txtred\]]\[\$txtgrn\]\$(__git_ps1)\[\033[01;38;5;208m\]\$([ \j -gt 0 ] && echo [\j])\[\$txtrst\]$ "

# $ `exit_code' Should be first command in `PROMPT_COMMAND' to be
# executed or else return status will always be 0/true (If functions in
# `PROMPT_COMMAND' are written proper :)
[ -n "$PROMPT_COMMAND" ] && PROMPT_COMMAND="exit_code;$PROMPT_COMMAND" ||
    PROMPT_COMMAND="exit_code"

exit_code() {
    EXIT="$?"

    # PS1 needs to be reset or else it will be appended every time to
    # previous one.
    PS1=""

    [ "$EXIT" = "0" ] && EXITCOL=$bldwht || EXITCOL=$bldred

    # This will be final prompt, whatever set earlier will be
    # overwritten by this.
    export PS1="\[\$EXITCOL\]\w\[\033[01;38;5;208m\]\$([ \j -gt 0 ] && echo [\j])\[\$txtrst\]$ "
}


# Depth of `$PWD` is decided by this.
export PROMPT_DIRTRIM=2

# Write path to current working directory in file `/tmp/cwd`. This file can be
# used to open new terminal in same directory.
# See $HOME/.scripts/samedirnoob.sh and also $HOME/.scripts/samedir.sh
if [ -n "$PROMPT_COMMAND" ]; then
   PROMPT_COMMAND="$PROMPT_COMMAND;pwd > '/tmp/cwd'"
else
   PROMPT_COMMAND="pwd > '/tmp/cwd'"
fi

# Show desktop information with logo in a facny way!
# type neofetch >/dev/null 2>&1 && neofetch

# Set options for `less` to not bloat terminal when exitted from less. Mainly used in git. Outputs
# of `git branch` also disappears after setting # this option.
export LESS=R

# Autocorrect some misspelled words during `cd`.
shopt -s cdspell

# Disable window freeze by Ctrl - s permanently.
stty -ixon


## pyenv configs
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
