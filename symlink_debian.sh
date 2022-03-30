#!/bin/bash

echo "Linking configurations..."

usrConfig=$HOME/.config

homeConfig=$PWD/.home
thisConfig=$PWD/.config

for i in alacritty bspwm sxhkd polybar nvim i3; do
    rm -rf $usrConfig/$i
    mkdir -p $usrConfig/$i
    ln -s $thisConfig/$i/* $usrConfig/$i/
done

for i in .vimrc .gitconfig .xinitrc .bashrc; do
    rm -rf $HOME/$i
    ln -s $homeConfig/$i $HOME/$i
done
