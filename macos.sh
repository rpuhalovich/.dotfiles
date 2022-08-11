#!/bin/zsh

homeConfig=$PWD/home

for i in .gitconfig .vimrc .zshrc .tmux.conf; do
    rm -rf $HOME/$i
    ln -s $homeConfig/$i $HOME/$i
done

