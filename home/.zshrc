#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|

# Prevent duplicate path bloating
typeset -U path cdpath

path+=("$HOME/.local/bin")
cdpath+=("$HOME/pnl/github")

# Load and initialize the Zsh completion system with a 24-hour cache check
autoload -Uz compinit

{
    setopt extendedglob
    if [[ -n ${ZSH_COMPDUMP:-$HOME/.zcompdump}(#qN.m-1) ]]; then
        compinit -C
    else
        compinit
    fi
}

# Case-insensitive tab completion (lowercase matches uppercase and vice versa)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

HISTSIZE=10000
SAVEHIST=10000              # Replaces Bash HISTFILESIZE
HISTFILE=$HOME/.zsh/zsh_history

# Create history directory if it doesn't exist to prevent errors
[[ -d $HOME/.zsh ]] || mkdir -p $HOME/.zsh

# Zsh native replacements for HISTCONTROL & HISTTIMEFORMAT:
setopt SHARE_HISTORY        # Share history between all sessions.
setopt HIST_IGNORE_SPACE    # Don't record lines starting with a space
setopt HIST_IGNORE_ALL_DUPS # Erase older duplicates if new command matches
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks from history lines
setopt EXTENDED_HISTORY     # Save timestamps natively (view via 'history -E')

[[ -f $HOME/.alias ]] && source $HOME/.alias

# Non-login interactive shells do not read ~/.zprofile.
if [[ ! -o login && -f $HOME/.profile ]]; then
  source $HOME/.profile
fi

export LESS=R

# Auto-correction disabled.
unsetopt CORRECT_ALL
unsetopt CORRECT

autoload -Uz colors && colors
# %3~ explicitly caps the visible directory depth to 3, handling your trimming.
PROMPT=$'%(?.%F{cyan}%B.%F{red}%B)\n%3~%b%f %(1j.%F{208}[%j]%f.)%# '

# control-u to clear everything behind cursor.
bindkey '^U' backward-kill-line
