#!/bin/bash

yay --noconfirm
yay -Syu --noconfirm
yay -c --noconfirm
yay -Sc --noconfirm
sh $HOME/.dotfiles/scripts/update_packages.sh

