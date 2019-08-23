. ~/.profile

# next 2 lines for git to auto change branch when switched to new directory
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# bindings to move 1 word left/right with ctrl+left/right in terminal, just some apple stuff!
bind '"\e[5C": forward-word'
bind '"\e[5D": backward-word'
# bindings to move 1 word left/right with ctrl+left/right in iTerm2, just some apple stuff!
bind '"\e[1;5C": forward-word'
bind '"\e[1;5D": backward-word'

# general alias

alias ev="v ~/.vimrc"
alias ebp="v ~/.bash_profile"
alias la="ls -a"
alias SB="source ~/.bash_profile"
alias p2="python"
alias p3="python3"
alias espPortCmd="ls /dev/cu.*"
alias v="vim +"
alias cpwd="pwd | pbcopy"
alias espPort="echo /dev/cu.SLAB_USBtoUART | pbcopy && echo /dev/cu.SLAB_USBtoUART copied to clipboard"
alias :q="exit"

# functions

# combined mkdir and cd
mkcdir() { mkdir "$@" && cd "$@"; }

#default grep without list
defg() { grep -Ir --exclude="cscope.out" --exclude="tags" "$@"; }

#default grep withlist
defgl() { grep -Irl --exclude="cscope.out" --exclude="tags" "$@"; }

mtc() { make TEST_COMPONENTS="$1" flash monitor; }

# combined cd and ls
cds() { cd "$@" && ls; }

# change default editor for cscope to vim
export CSCOPE_EDITOR=vim

# grep recursively within $IDF_PATH ignoring all binary files, tags  and cscope.out. use "-i" for case insensitive search
gr()
{
	grep -r -I --exclude='cscope.out' --exclude='tags' "$1" $IDF_PATH
}

# for git completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
export LC_ALL=en_US.UTF-8

# alias for git 
alias gitgraph="git log --graph --decorate --oneline --all"
alias gitb="git branch"
alias gitl="clear && git log --oneline"
alias gits="git status"
alias gitc="git checkout"
alias gitsub="git submodule update --init --recursive"
alias gitdinit="git submodule deinit --all -f"
alias gitd="git diff"


#alias for esp
alias make="make -j32"
alias mmc="make menuconfig -j32"
alias mfm="make -j32 flash monitor"
alias mc="make -j32 clean"
alias mf="make -j32 flash"
alias mm="make -j32 monitor"
alias mef="make -j32 erase_flash"
alias efuse="python /Users/chinmayc/esp/esp-idf/components/esptool_py/esptool/espefuse.py --port /dev/cu.SLAB_USBtoUART"


# modifying prompt (PS1)
# while changing PS1, for changing colors, do not use `\e....m` format. CRLF setting changes due to this. use color format from colors.sh present in git-aware-prompt

# sample: shows git branch, user, current working directory with colors in background
# export PS1="\[\033[0m\]\u \[\033[1;48;5;45;38;5;0m\] \w/ \[\033[1;48;5;227;38;5;0m\](\$(git branch 2>/dev/null|grep '^*'|colrm 1 2))$ \[\033[0m\] "

# using `colors.sh` and `prompt.sh` from `git-aware-prompt` in `~/.bash/`
# export PS1="\[\$bldred\][\[\$bldcyn\]\u \[\$bldylw\]\w \[\$bldgrn\]\$git_branch\[\$bldred\]]\[\$txtrst\]$ "

# reference: http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
export PS1="\[\033[1;31m\][\[\033[1;36m\]\u \[\\033[1;33m\]\w \[\\033[1;32m\]\$git_branch\[\\033[1;31m\]]\[\\033[0m\]$ "

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# TERM=xterm; export TERM
export TERM

# up arrow will skip all identical commands to current one
HISTCONTROL=$HISTCONTROL:ignoredups
