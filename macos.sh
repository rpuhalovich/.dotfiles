#!/bin/bash

homeConfig=$PWD/.home

for i in .vimrc .gitconfig; do
    rm -rf $HOME/$i
    ln -s $homeConfig/$i $HOME/$i
done

