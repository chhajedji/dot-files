#! /bin/sh

# If this file executable, then `cd` will not actually change the current directory. So always run
# this script with relative to current path (eg: `. ~/scripts/gadd.sh`).
cd $HOME/pnl/github/dot-files/
git checkout T480
cp -r $HOME/.config/i3 $HOME/.config/dunst $HOME/.config/compton $HOME/.config/gsimplecal $HOME/pnl/github/dot-files/linux/T480/.config/
cp -r  $HOME/.Xresources $HOME/scripts/ $HOME/.vimrc $HOME/.profile $HOME/.bashrc $HOME/.alias $HOME/.fonts $HOME/pnl/github/dot-files/linux/T480/
git status
echo 'Copied
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
    - gadd.sh
    - scripts/'
