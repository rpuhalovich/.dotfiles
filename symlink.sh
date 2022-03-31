#!/bin/bash

echo "Linking configurations..."

usrConfig=$HOME/.config

homeConfig=$PWD/.home
thisConfig=$PWD/.config

for i in alacritty polybar nvim i3 picom rofi; do
    rm -rf $usrConfig/$i
    mkdir -p $usrConfig/$i
    ln -s $thisConfig/$i/* $usrConfig/$i/
done

for i in .vimrc .gitconfig .bashrc .xprofile; do
    rm -rf $HOME/$i
    ln -s $homeConfig/$i $HOME/$i
done
