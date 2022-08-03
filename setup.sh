#!/usr/bin/env bash
set -Eeuo pipefail

BAT_VERSION="v0.21.0"
BAT_RELEASE="bat-${BAT_VERSION}-x86_64-unknown-linux-musl"
wget -qO- https://github.com/sharkdp/bat/releases/download/${BAT_VERSION}/${BAT_RELEASE}.tar.gz | tar -xzvf - ${BAT_RELEASE}/bat -C ~/bat
sudo ln ~/${BAT_RELEASE}/bat /usr/local/bin/bat 2>/dev/null

sudo apt-get update
sudo apt-get --yes install tig zplug fzf zsh-syntax-highlighting 

sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
   -t https://github.com/vulkoingim/geometry \
   -p git \
   -p fzf \
   -p z \
   -p kubectl \
   -p https://github.com/Aloxaf/fzf-tab \
   -p zsh-history-substring-search \
   -p zsh-syntax-highlighting \
   -p https://github.com/zsh-users/zsh-autosuggestions \
   -p https://github.com/zsh-users/zsh-syntax-highlighting \
   -p https://github.com/zsh-users/zsh-history-substring-search \
   -p https://github.com/zsh-users/zsh-completions

git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim

ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
# ln -s ~/.dotfiles/.zshrc ~/.zshrc
cat ~/.dotfiles/.zshenv >> ~/.zshenv
ln -s ~/.dotfiles/z.sh ~/z.sh
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.vim/bundle/Vundle.vim ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

git config --global color.ui auto
git config --global color.status.changed yellow

echo 'colorscheme gruvbox' >> ~/.vimrc
echo 'set bg=dark' >> ~/.vimrc
echo 'source ~/.bash_aliases' >> ~/.zshrc
#echo '[ -z "$ZSH_VERSION" ] && export SHELL=`which zsh` && exec "$SHELL" -l' >> ~/.bashrc
