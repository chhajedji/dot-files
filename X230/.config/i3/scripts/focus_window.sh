#!/bin/sh

WIN_ID="`xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}'`"
compton-trans -w ${WIN_ID} 0
sleep 0.01
compton-trans -w ${WIN_ID} 100
sleep 0.01
compton-trans -w ${WIN_ID} 0
sleep 0.01
compton-trans -w ${WIN_ID} 100
