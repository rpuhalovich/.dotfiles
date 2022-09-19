#!/bin/bash

# curl https://raw.githubusercontent.com/rpuhalovich/.dotfiles/main/bas.sh | bash

dotfiles=$HOME/.dotfiles

rm -rf $dotfiles
git clone https://github.com/rpuhalovich/.dotfiles.git $HOME/.dotfiles

for i in .gitconfig .vimrc .bashrc .theia; do
    rm -rf $HOME/$i
    ln -s $HOME/.dotfiles/.home/$i $HOME/$i
done

npm i -g git-open
