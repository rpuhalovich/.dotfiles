#!/bin/bash

echo "Linking configurations..."

usrConfig=$HOME/.config

homeConfig=$PWD/.home
thisConfig=$PWD/.config

for i in alacritty polybar nvim i3 picom rofi dunst; do
    rm -rf $usrConfig/$i
    mkdir -p $usrConfig/$i
    ln -s $thisConfig/$i/* $usrConfig/$i/
done

for i in .vimrc .gitconfig .bashrc .Xresources; do
    rm -rf $HOME/$i
    ln -s $homeConfig/$i $HOME/$i
done

sudo cp -f $HOME/.dotfiles/etc/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf

