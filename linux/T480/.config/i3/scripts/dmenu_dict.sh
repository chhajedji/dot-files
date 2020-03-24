#!/bin/bash

WORD=$(echo '' | dmenu -p "Find meaning of:" -fn "Inconsolata 12" -b)
if [ -n "$WORD" ]; then
    urxvt -name dropdown_dictionary -e sh -c "dict ${WORD} |less" 2> /dev/null
exec i3-msg [class="^URxvt$" title="^dropdown_dictionary$"] focus
fi
