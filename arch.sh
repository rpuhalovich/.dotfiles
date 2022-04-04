#!/bin/bash

sudo pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

yay -S --needed --noconfirm - < scripts/packages.txt

nitrogen --set-scaled wallpapers/pixel_dark_village.jpeg

./symlink.sh

