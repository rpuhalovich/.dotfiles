#!/bin/bash

sudo pacman -S --noconfirm i3-gaps alacritty xorg xorg-xset xorg-xrandr # base
sudo pacman -S --noconfirm firefox nautilus nitrogen rofi # base

./symlink.sh
