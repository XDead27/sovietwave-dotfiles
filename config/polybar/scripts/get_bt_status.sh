#!/bin/bash

output=$(bluetoothctl show | grep 'Powered' | awk '{print $2;}')

if [ "$output" == "yes" ]; then
    echo "BT"
else
    echo "NO BT"
fi
