#!/bin/bash

sudo pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

yay -S --needed --noconfirm - < scripts/packages.txt

sudo systemctl enable gdm.service
sudo systemctl enable bluetooth.service
sudo systemctl enable cronie.service

nitrogen --set-scaled wallpapers/pixel_dark_village.jpeg

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

./symlink.sh

