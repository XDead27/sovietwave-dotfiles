#!/bin/bash

output=$(systemctl status tor.service | grep -wo 'active')

if [ "$output" == "active" ]; then
    echo "%{F#58995a}%{T7}TOR"
else
    echo "%{F#e6d6d7}CLR"
fi
