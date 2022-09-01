#!/bin/zsh

homePath=$HOME/.dotfiles/home
configPath=$HOME/.dotfiles/config/

for i in .gitconfig .vimrc .zshrc .tmux.conf; do
    rm -rf $HOME/$i
    ln -s $homePath/$i $HOME/$i
done

rm -rf $HOME/.config/nvim
mkdir -p $HOME/.config/nvim
ln -s $configPath/nvim/init.vim $HOME/.config/nvim/init.vim

