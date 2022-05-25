#!/usr/bin/env bash
set -Eeuo pipefail

# ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
cp ~/.dotfiles/.bash_aliases ~/.bash_aliases

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

# source ~/.bashrc