#!/bin/bash

# apt install stuff
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y xorg nitrogen vim dunst git npm unzip snapd neovim lxappearance curl tree fonts-firacode # base
sudo apt install -y htop # base
sudo apt install -y polybar bspwm sxhkd picom rofi neofetch # rice
sudo apt install -y firefox-esr # apps

# snap install stuff
sudo snap install core

# PlugInstall for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Dotfiles setup
./symlink.sh
