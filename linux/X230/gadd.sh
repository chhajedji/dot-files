#! /bin/bash

clear
cd ~/github/dot-files/
cp -r ~/.config/i3 ~/.config/compton ~/.config/gsimplecal ~/github/dot-files/linux/X230/.config/
cp -r ~/.vimrc ~/gadd.sh ~/.profile ~/.bashrc ~/.alias ~/.fonts ~/github/dot-files/linux/X230/
git status
echo "Copied
~/
    - .alias
    - .vmirc
    - gadd.sh
    - .bashrc
    - .profile
    - .fonts/
    - .config/
        - i3/
        - compton/
        - gsimplecal/
        - dunst/"
