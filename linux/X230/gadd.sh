#! /bin/bash

cd ~/github/dot-files/
git checkout X230
cp -r ~/.config/i3 ~/.config/dunst ~/.config/compton ~/.config/gsimplecal ~/github/dot-files/linux/X230/.config/
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
        - dunst/
        - gsimplecal/
        - dunst/"
