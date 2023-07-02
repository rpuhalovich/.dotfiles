#!/bin/zsh

for i in .ideavimrc .clangd .scripts .hammerspoon .gitconfig .vimrc .zshrc .tmux.conf .alacritty.yml; do
    rm -rf $HOME/$i
    ln -s $HOME/.dotfiles/.home/$i $HOME/$i
done
mkdir -p $HOME/.scripts-local/

mkdir -p $HOME/.config/
for i in nvim btop; do
    rm -rf $HOME/.config/$i
    ln -s $HOME/.dotfiles/.home/.config/$i $HOME/.config/$i
done
