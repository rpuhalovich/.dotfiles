#!/bin/bash

xrdb -merge ~/.Xresources &
setxkbmap -option "caps:escape" -option "ctrl:swap_lalt_lctl" &
./.fehbg &
redshift &

export PATH=~/.local/bin:$PATH

