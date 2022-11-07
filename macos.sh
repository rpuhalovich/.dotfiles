#!/bin/zsh

for i in .hammerspoon .gitconfig .vimrc .zshrc .tmux.conf; do
    rm -rf $HOME/$i
    ln -s $HOME/.dotfiles/.home/$i $HOME/$i
done

mkdir -p $HOME/.config/
for i in nvim btop; do
    rm -rf $HOME/.config/$i
    ln -s $HOME/.dotfiles/.home/.config/$i $HOME/.config/$i
done
