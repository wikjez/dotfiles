#!/bin/bash

cd ~/dotfiles
git pull origin main

if [ -d ~/dotfiles/vim/bundle/Vundle.vim ]; then
  cd ~/dotfiles/vim/bundle/Vundle.vim
  git pull origin master
else
  if ! [ -d ~/dotfiles/vim/bundle ]; then
    mkdir ~/dotfiles/vim
    mkdir ~/dotfiles/vim/bundle
  fi

  cd ~/dotfiles/vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git
fi

if [ -d ~/dotfiles/tmux-themepack ]; then
  cd ~/dotfiles/tmux-themepack
  git pull origin master
else
  cd ~/dotfiles
  git clone https://github.com/jimeh/tmux-themepack.git
fi

if [ -f ~/.vimrc ]; then
  rm ~/.vimrc
fi

if [ -d ~/.vim ]; then
  rm -rf ~/.vim
fi

if [ -f ~/.tmux.conf ]; then
  rm ~/.tmux.conf
fi

if [ -d ~/.tmux-themepack ]; then
  rm -rf ~/.tmux-themepack
fi

if [ -f ~/.pryrc ]; then
  rm ~/.pryrc
fi

ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux-themepack ~/.tmux-themepack
ln -s ~/dotfiles/pryrc ~/.pryrc

vim +BundleInstall! +BundleClean +qall
