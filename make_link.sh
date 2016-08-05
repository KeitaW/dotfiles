#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf 
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

if [ ! -d ~/.config ]
then
    mkdir ~/.config
fi
ln -s ~/dotfiles/etc/.config/* ~/.config/
