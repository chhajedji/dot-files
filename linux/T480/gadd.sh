#! /bin/bash

cp -r ~/.config/i3 ~/.config/dunst ~/.config/compton ~/.config/gsimplecal ~/pnl/github/dot-files/linux/T480/.config/
cp -r ~/.vimrc ~/gadd.sh ~/.profile ~/.bashrc ~/.alias ~/.fonts ~/pnl/github/dot-files/linux/T480/
cd ~/pnl/github/dot-files/
git diff HEAD --color=always | less -R
echo "Copied
~/
    - .alias
    - .vmirc
    - gadd.sh
    - .bashrc
    - .profile
    - .fonts/
    - .config/
    -     - i3/
    -     - compton/
    -     - gsimplecal/
    -     - dunst/

git diff"
