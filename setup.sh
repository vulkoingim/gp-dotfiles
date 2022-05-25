#!/usr/bin/env bash
set -Eeuo pipefail

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

source ./z.sh
source ./.bash_aliases
source ~/.bashrc