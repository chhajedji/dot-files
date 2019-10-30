if pgrep -x screenkey > /dev/null
then
    pkill screenkey
else
    # use `--scr SCREEN` to set screen for showing
    screenkey -s small -t 1 --opacity 0.8 --bak-mode baked --vis-shift
fi
