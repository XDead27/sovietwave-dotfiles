#!/bin/bash

window_class=""

#if xdotool getactivewindow ; then
#	window_class=$(xprop -id $(xdotool getactivewindow) WM_CLASS | awk -F '"' '{print $4}')
#	echo "OK"
#else
#	echo "WHAT"
#fi
output="$(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2)"

if [[ ! "${output}" == "0x0" ]] ; then
	window_class=$(xprop -id $(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2) WM_CLASS | awk -F '"' '{print $4}')
fi


echo ${window_class}
