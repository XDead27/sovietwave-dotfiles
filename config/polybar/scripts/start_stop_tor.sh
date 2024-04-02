#!/bin/bash

output=$(systemctl status tor.service | grep -wo 'active')

if [ "$output" == "active" ]; then
    bspc rule -a \* -o state=floating && alacritty -e sudo torctl stop
else
    bspc rule -a \* -o state=floating && alacritty -e sudo torctl start
fi

bspc rule -a \* -o state=tiling
