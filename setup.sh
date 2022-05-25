#!/usr/bin/env bash
set -Eeuo pipefail

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

. .z.sh
cp .bash_aliases ~/.bash_aliases
# source ~/.bashrc