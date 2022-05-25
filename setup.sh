#!/usr/bin/env bash
set -Eeuo pipefail

ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases

ln -s ~/.dotfiles/z.sh ~/z.sh
. ~/z.sh 2>/dev/null

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install