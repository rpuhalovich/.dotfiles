#!/bin/bash

# .home dotfiles
for i in .vimrc .gitconfig; do
    rm -rf $HOME/$i
    ln -s $homeConfig/$i $HOME/$i
done
