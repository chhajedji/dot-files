#!/bin/sh

case $1 in

# Search dictionary.
    -d)
        WORD=$(echo '' | dmenu -p "Find meaning of:" -fn "Inconsolata 12")
        if [ -n "$WORD" ]; then
            urxvt -name dropdown_dictionary -e sh -c "dict ${WORD} |less" 2> /dev/null
        fi
        ;;

# Search google.
    -g)
        URL='https://www.google.com/search?q='
        QUERY=$(echo '' | dmenu -p "Google Search for:" -fn "-xos4-terminus-medium-r-*-*-14-*")
        if [ -n "$QUERY" ]; then
            xdg-open "${URL}${QUERY}" 2> /dev/null
            exec i3-msg [class="^Firefox$"] focus 2>/dev/null 1>&2
        fi
        ;;

# Manual page.
    -m)
        WORD=$(echo '' | dmenu -p "Manual page for:" -fn "Inconsolata 12")
        if [ -n "$WORD" ]; then
            urxvt -name dropdown_manual -e sh -c "man ${WORD} || figlet -c 'No manual entry for \"${WORD}\"' |less" 2> /dev/null
            # exec i3-msg [instance="dropdown_manual"] focus 2>/dev/null 1>&2
        fi
        ;;

    *)
        MESSAGE="Not a valid option to run with dmenu. :P"
            urxvt -name dropdown_default -e sh -c "figlet -c ${MESSAGE} |less" 2> /dev/null
        ;;

esac
