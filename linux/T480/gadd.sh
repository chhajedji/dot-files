#!/usr/bin/python3

# If this file executable, then `cd` will not actually change the current directory. So always run
# this script with relative to current path (eg: `. ~/scripts/gadd.sh`).

### Add confidential files (like .gitconfig) manually and not in this script.

cd $HOME/pnl/github/dot-files/
git checkout T480 >/dev/null
cd $HOME/pnl/github/dot-files/linux/T480/
cp -r $HOME/.config/i3 $HOME/.config/dunst $HOME/.config/compton $HOME/.config/gsimplecal $HOME/pnl/github/dot-files/linux/T480/.config/
cp -r  $HOME/.gitconfig $HOME/.bash $HOME/.inputrc $HOME/.Xresources $HOME/.scripts/ $HOME/gadd.sh $HOME/.vimrc $HOME/.profile $HOME/.bashrc $HOME/.fonts $HOME/pnl/github/dot-files/linux/T480/
git status
