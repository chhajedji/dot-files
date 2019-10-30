#! /bin/bash

cd ~/pnl/github/dot-files/
cp -r ~/.config/i3 ~/.config/dunst ~/.config/compton ~/.config/gsimplecal ~/pnl/github/dot-files/linux/T480/.config/
cp -r  ~/.Xresources ~/.vimrc ~/gadd.sh ~/.profile ~/.bashrc ~/.alias ~/.fonts ~/pnl/github/dot-files/linux/T480/
git status
echo "Copied
~/
    - .alias
    - .bashrc
    - .config/
        - i3/
        - compton/
        - gsimplecal/
        - dunst/
    - .fonts/
    - .gitconfig
    - .profile
    - .vmirc
    - .Xresources
    - gadd.sh"
