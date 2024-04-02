#!/bin/bash

#Disable shadow for all nodes
bspc query --nodes --node .leaf | while read -r node; do
	xprop -id "$node" -remove _COMPTON_SHADOW;
done

#Enable shadow for all nodes in floating state
bspc query --nodes --node .floating.leaf | while read -r node; do
	xprop -id "$node" -f _COMPTON_SHADOW 32c -set _COMPTON_SHADOW 1;
done
