#!/usr/bin/env bash
set -Eeuo pipefail

sudo apt-get update
sudo apt-get --yes install tig zplug bat fzf zsh-syntax-highlighting 

yes | sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
   -t https://github.com/geometry-zsh/geometry \
   -p git \
   -p fzf \
   -p z \
   -p kubectl \
   -p fzf-tab \
   -p zsh-history-substring-search \
   -p zsh-syntax-highlighting \
   -p https://github.com/zsh-users/zsh-autosuggestions \
   -p https://github.com/zsh-users/zsh-completions

git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim

ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.zshenv ~/.zshenv
ln -s ~/.dotfiles/z.sh ~/z.sh
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.vim/bundle/Vundle.vim ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

git config --global color.ui auto
git config --global color.status.changed yellow

