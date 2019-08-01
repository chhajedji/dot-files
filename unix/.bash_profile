. ~/.profile

# general alias

alias ev="v ~/.vimrc"
alias ebp="vim ~/.bash_profile"
alias la="ls -a"
alias SB="source ~/.bash_profile"
alias p2="python"
alias p3="python3"
alias espPortCmd="ls /dev/cu.*"
alias v="vim +"
alias cpwd="pwd | pbcopy"
alias espPort="echo /dev/cu.SLAB_USBtoUART | pbcopy && echo /dev/cu.SLAB_USBtoUART copied to clipboard"

# functions

# combined mkdir and cd
mkcdir()
{
	mkdir "$1" && cd "$1"
}

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


#alias for esp
alias make="make -j8"
alias mmc="make menuconfig -j8"
alias mfm="make -j8 flash monitor"
alias mc="make -j8 clean"


#functions

mtc() {
	make TEST_COMPONENTS=$1 flash monitor
}

cds() { cd "$@" && ls; }

#setting colors and format of directory and username
export PS1="[\[\033[36m\]\u \[\033[33;1m\]\w\[\033[m\] ]$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
