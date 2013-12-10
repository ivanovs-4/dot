#!/bin/sh

ln -sf ~/dot/bash_aliases ~/.bash_aliases
ln -sf ~/dot/bash_aliases_git ~/.bash_aliases_git
ln -sf ~/dot/bashrc.post ~/.bashrc.post
ln -sf ~/dot/gitconfig ~/.gitconfig
ln -sf ~/dot/gitignore_global ~/.gitignore_global
ln -sf ~/dot/tmux.conf ~/.tmux.conf

rm -f ~/.vim
ln -sf ~/dot/vim ~/.vim

ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/dot/Xmodmap ~/.Xmodmap
ln -sf ~/dot/zshrc ~/.zshrc

rm -f ~/.git_template
ln -sf ~/dot/git_template ~/.git_template

rm -f ~/.i3
ln -sf ~/dot/i3 ~/.i3

rm -f ~/.git_template
ln -sf ~/dot/git_template ~/.git_template

git submodule init
git submodule update

