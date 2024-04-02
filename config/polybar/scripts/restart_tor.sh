#!/bin/bash

bspc rule -a \* -o state=floating && termite -e 'sudo torctl restart'
bspc rule -a \* -o state=tiling
