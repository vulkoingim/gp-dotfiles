#!/usr/bin/env bash
set -Eeuo pipefail

ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/.dotfiles/z.sh ~/z.sh

BAT_VERSION="v0.21.0/bat-v0.21.0-x86_64-unknown-linux-musl"
wget -qO- https://github.com/sharkdp/bat/releases/download/${BAT_VERSION}.tar.gz | tar -xzvf - ${BAT_VERSION}/bat -C /tmp/bat
sudo ln /tmp/${BAT_VERSION}/bat /usr/local/bin/bat

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install