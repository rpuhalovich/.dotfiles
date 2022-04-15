#!/bin/bash
echo "Linking configurations..."

usrConfig=$HOME/.config
usrLocalBin=$HOME/.local/bin

localBin=$PWD/.local/bin
homeConfig=$PWD/.home
thisConfig=$PWD/.config

# .config sub dir dotfiles
for i in alacritty polybar nvim i3 picom rofi dunst; do
    rm -rf $usrConfig/$i
    mkdir -p $usrConfig/$i
    ln -s $thisConfig/$i/* $usrConfig/$i/
done

# Root .config dotfiles
for i in redshift.conf; do
    rm -rf $usrConfig/$i
    ln -s $thisConfig/$i $usrConfig/$i
done

# .home dotfiles
for i in .vimrc .gitconfig .bashrc .Xresources .xinitrc .xprofile; do
    rm -rf $HOME/$i
    ln -s $homeConfig/$i $HOME/$i
done

# .local/bin scripts
for i in battery-combined-udev displays power-menu wifi-menu; do
	mkdir -p $usrLocalBin/
	if [ ! -f "$FILE" ]; then
		ln -s $localBin/$i $usrLocalBin/$i
	fi
done
