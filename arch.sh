#!/bin/bash

pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

sudo pacman -S --noconfirm i3-gaps alacritty xorg xorg-xset xorg-xrandr git redshift
sudo pacman -S --noconfirm firefox nautilus nitrogen rofi gnome-keyring
sudo pacman -S --noconfirm libsecret lxappearance lxsession dunst github-cli

yay -S --noconfirm teams picom-git

./symlink.sh

