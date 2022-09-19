#!/bin/zsh

for i in .config .hammerspoon .gitconfig .vimrc .zshrc .tmux.conf; do
    rm -rf $HOME/$i
    ln -s $HOME/.dotfiles/.home/$i $HOME/$i
done
