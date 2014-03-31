#!/bin/sh

ln -sf ~/dot/bash_aliases ~/.bash_aliases
ln -sf ~/dot/bash_aliases_git ~/.bash_aliases_git
ln -sf ~/dot/bashrc.post ~/.bashrc.post
ln -sf ~/dot/gitconfig ~/.gitconfig
ln -sf ~/dot/gitignore_global ~/.gitignore_global
ln -sf ~/dot/tmux.conf ~/.tmux.conf

rm -rf ~/.vim
ln -sf ~/dot/vim ~/.vim

ln -sf ~/.vim/vimrc ~/.vimrc

rm -rf ~/.git_template
ln -sf ~/dot/git_template ~/.git_template

git submodule init
git submodule update
