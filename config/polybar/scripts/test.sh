#!/bin/bash

string=$(xprop -id 0 WM_CLASS)
error="id"

if [[ "$string" =~ "$error" ]]; then
	string="OK"
fi

echo ${string}
