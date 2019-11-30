#! /bin/bash

cp -r ~/.config/i3 ~/.config/dunst ~/.config/compton ~/.config/gsimplecal ~/github/dot-files/linux/X230/.config/
cp -r ~/.vimrc ~/gadd.sh ~/.profile ~/.bashrc ~/.alias ~/.fonts ~/github/dot-files/linux/X230/
cd ~/github/dot-files/
clear; git status
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