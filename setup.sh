#!/usr/bin/env bash
set -Eeuo pipefail

ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
# cp ~/.dotfiles/.bash_aliases ~/.bash_aliases

ln -s ~/.dotfiles/z.sh ~/z.sh
. ~/z.sh

# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# yes | ~/.fzf/install