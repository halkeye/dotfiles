#!/bin/bash
cd ~/
for i in gitconfig gitignore tmux.conf ssh/config zshrc; do
  if [ ! -e $HOME/.${i} ]; then
    ln -s $HOME/.shell/${i} $HOME/.${i}
  fi
done
