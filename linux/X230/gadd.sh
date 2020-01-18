#! /bin/sh

cd $HOME/github/dot-files/linux/X230
git checkout X230
cp -r $HOME/.config/i3 $HOME/.config/dunst $HOME/.config/compton $HOME/.config/gsimplecal $HOME/github/dot-files/linux/X230/.config/
cp -r $HOME/.gitignore $HOME/.gitconfig $HOME/.zshrc $HOME/.oh-my-zsh $HOME/.inputrc $HOME/.Xresources $HOME/.vimrc $HOME/gadd.sh $HOME/.profile $HOME/.bashrc $HOME/.alias $HOME/.fonts $HOME/github/dot-files/linux/X230/
git status
