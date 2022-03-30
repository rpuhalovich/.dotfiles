#!/bin/bash

echo "Linking configurations..."

homeConfig=$HOME/.config
thisConfig=$PWD/.config

for i in alacritty bspwm sxhkd polybar nvim i3; do
    rm -rf $homeConfig/$i
    mkdir -p $homeConfig/$i
    ln -s $thisConfig/$i/* $homeConfig/$i/
done

for i in .vimrc .gitconfig .xinitrc .bashrc; do
    rm -rf $HOME/$i
    ln -s $PWD/$i $HOME/$i
done

