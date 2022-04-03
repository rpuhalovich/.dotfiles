#!/bin/bash

sudo pacman -S --noconfirm i3-gaps alacritty xorg xorg-xset xorg-xrandr git # base
sudo pacman -S --noconfirm firefox nautilus nitrogen rofi gnome-keyring libsecret lxappearance lxsession # base

pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

./symlink.sh

