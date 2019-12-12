#!/bin/sh

WIN_ID="`xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}'`"
compton-trans -w ${WIN_ID} 0
compton-trans -w ${WIN_ID} 100
compton-trans -w ${WIN_ID} 0
compton-trans -w ${WIN_ID} 100
