#!/usr/bin/env bash
set -Eeuo pipefail

ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/.dotfiles/z.sh ~/z.sh

BAT_VERSION="v0.21.0"
BAT_RELEASE="bat-${BAT_VERSION}-x86_64-unknown-linux-musl"
wget -qO- https://github.com/sharkdp/bat/releases/download/${BAT_VERSION}/${BAT_RELEASE}.tar.gz | tar -xzvf - ${BAT_RELEASE}/bat -C ~/bat
sudo ln ~/${BAT_RELEASE}/bat /usr/local/bin/bat

sudo apt-get update
sudo apt-get install tig

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
