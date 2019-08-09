. ~/.profile

# next 2 lines for git to auto change branch when switched to new directory
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

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

mtc() { make TEST_COMPONENTS="$1" flash monitor; }

# combined cd and ls
cds() { cd "$@" && ls; }

# show colors in cscope by changing default editor of cscope to vim
export CSCOPE_EDITOR=vim

#grep recursively within $IDF_PATH ignoring all binary files, tags  and cscope.out
gr()
{
	grep -r -I --exclude='cscope.out' --exclude='tags' "$1" $IDF_PATH
}

# for git completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
export LC_ALL=en_US.UTF-8

# alias for git 
alias gitgraph="git log --graph --decorate --oneline --all"
alias gb="git branch"
alias gl="clear && git log --oneline"
alias gs="git status"
alias gc="git checkout"
alias gsub="git submodule update --init --recursive"


#alias for esp
alias make="make -j32"
alias mmc="make menuconfig -j32"
alias mfm="make -j32 flash monitor"
alias mc="make -j32 clean"
alias mf="make -j32 flash"

# to show branch name in prompt string
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#setting colors and format of directory and username
#export PS1="\e[40;0;31m[\[\033[36m\]\u \[\033[33;1m\]\w\[\033[m\]\e[0;32m$(parse_git_branch)\e[40;0;31m] \[\033[m\]$ " # dosen't change branch with changing directory
export PS1="\e[40;0;31m[\[\033[36m\]\u \[\033[33;1m\]\w \[\$txtgrn\]\$git_branch\[\$txtred\]\$git_dirty\[\$txtrst\]\e[40;0;31m] \[\033[m\]$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
