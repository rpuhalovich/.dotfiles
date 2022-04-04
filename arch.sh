#!/bin/bash

pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

yay -S --needed - < scripts/packages.txt

./symlink.sh

