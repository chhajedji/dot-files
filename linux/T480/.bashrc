# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
export HISTTIMEFORMAT="%d/%m/%y  %T    "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto --exclude=cscope* --exclude=tags'
    alias fgrep='fgrep --color=auto --exclude=cscope* --exclude=tags'
    alias egrep='egrep --color=auto --exclude=cscope* --exclude=tags'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

. ~/.espconfig
. ~/.alias

# next 2 lines for git to auto change branch when switched to new directory
source "$HOME/.bash/git-aware-prompt/colors.sh"
source "$HOME/.bash/git-aware-prompt/prompt.sh"

# change default editor for cscope to vim
export CSCOPE_EDITOR=vim

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

# using `colors.sh` and `prompt.sh` from `~/.bash/git-aware-prompt/`
# export PS1="\[\$bldred\][\[\$bldcyn\]\u \[\$bldylw\]\w\[\$bldred\]] \[\$bldgrn\]\$git_branch\[\$txtrst\]$ "

# reference for color: http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

# With username
# export PS1="\[\033[1;31m\][\[\033[1;36m\]\u \[\033[1;33m\]\w\[\033[1;31m\]] \[\033[1;32m\]\$git_branch\[\033[1;36m\]$\[\033[0m\] "

# Options:
#     - \A for time in HH:MM
#     - \j for number of background jobs
export PS1="\[\033[1;32m\]\$git_branch\[\033[1;31m\][\[\033[1;33m\]\w \[\033[1;36m\]\A\[\033[1;31m\]]\[\033[01;38;5;208m\] \$([ \j -gt 0 ] && echo [\j])\[\033[0m\]$ "

# Depth of `$PWD` is decided by this.
PROMPT_DIRTRIM=2

# Write path to current working directory in file `~/.cwd`. This file is used in
# i3 config to open new terminal in same directory.
PROMPT_COMMAND="pwd > '${HOME}/.cwd'; $PROMPT_COMMAND"

# enable vi key bindings in shell
# set -o vi

# Show desktop information with logo in a facny way!
# screenfetch
