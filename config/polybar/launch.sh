#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

MONITOR="$(get-monitors -p)" polybar top 2>&1 | tee -a /tmp/polybar1.log & disown
MONITOR="$(get-monitors -p)" polybar bottom 2>&1 | tee -a /tmp/polybar2.log & disown

if [[ $(get-monitors -s) ]]; then
    MONITOR="$(get-monitors -s)" polybar top-external 2>&1 | tee -a /tmp/polybar1.log & disown
    MONITOR="$(get-monitors -s)" polybar bottom-external 2>&1 | tee -a /tmp/polybar2.log & disown
fi

echo "Bars launched..."
