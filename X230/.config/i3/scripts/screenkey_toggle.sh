#!/bin/sh

unset XMODIFIERS
unset GTK_IM_MODULES
unset QT_IM_MODULES

if pgrep -x screenkey > /dev/null
then
    pkill screenkey
else
    # use `--scr SCREEN` to set screen for showing
    screenkey -s small -t 1 --opacity 0.7 --bak-mode baked --vis-shift --scr 1
fi
