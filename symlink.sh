#!/bin/bash
echo "Linking configurations..."

usrConfig=$HOME/.config

homeConfig=$PWD/.home
thisConfig=$PWD/.config

# Root .config dotfiles
for i in redshift.conf; do
    rm -rf $usrConfig/$i
    ln -s $thisConfig/$i $usrConfig/$i
done

# .config sub dir dotfiles
for i in alacritty polybar nvim i3 picom rofi dunst; do
    rm -rf $usrConfig/$i
    mkdir -p $usrConfig/$i
    ln -s $thisConfig/$i/* $usrConfig/$i/
done

# .home dotfiles
for i in .vimrc .gitconfig .bashrc .Xresources .xinitrc; do
    rm -rf $HOME/$i
    ln -s $homeConfig/$i $HOME/$i
done

# /etc/ stuff
sudo cp -f $HOME/.dotfiles/etc/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf

