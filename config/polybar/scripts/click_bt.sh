#!/usr/bin/bash

output=$(bluetoothctl show | grep 'Powered' | awk '{print $2;}')

if [ "$output" == "yes" ]; then
    rofi -modi mymenu:~/.config/rofi/scripts/bt.py -show mymenu -show-cons -location 3 -theme ~/.config/rofi/bt.rasi
else
    bluetoothctl power on
fi
