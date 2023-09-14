#!/usr/bin/env bash
set -Eeuo pipefail

BAT_VERSION="v0.21.0"
BAT_RELEASE="bat-${BAT_VERSION}-x86_64-unknown-linux-musl"
wget -qO- https://github.com/sharkdp/bat/releases/download/${BAT_VERSION}/${BAT_RELEASE}.tar.gz | tar -xzvf - ${BAT_RELEASE}/bat -C ~/bat
sudo ln ~/${BAT_RELEASE}/bat /usr/local/bin/bat 2>/dev/null

wget https://github.com/hidetatz/kubecolor/releases/download/v0.0.20/kubecolor_0.0.20_Linux_x86_64.tar.gz
tar -xvf kubecolor_0.0.20_Linux_x86_64.tar.gz kubecolor -C ~/kubecolor
sudo ln ~/kubecolor /usr/local/bin/kubecolor 2>/dev/null

lsd_version="v1.0.0"
wget "https://github.com/lsd-rs/lsd/releases/download/${lsd_version}/lsd-${lsd_version}-x86_64-unknown-linux-gnu.tar.gz"
tar -xvf "lsd-${lsd_version}-x86_64-unknown-linux-gnu.tar.gz" --strip-components=1 "lsd-${lsd_version}-x86_64-unknown-linux-gnu/lsd"
sudo mv ~/lsd /usr/local/bin/lsd 2>/dev/null

sudo rm /etc/apt/sources.list.d/hashicorp.list || true
sudo rm /etc/apt/sources.list.d/tailscale.list || true

sudo mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
# Add the tailscale repository
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list

sudo apt-get update
sudo apt-get --yes install tig zplug fzf zsh-syntax-highlighting fd-find #exa

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
ln -s ~/.dotfiles/.lessfilter ~/.lessfilter
sudo ln -s ~/.dotfiles/kpoof /usr/local/bin/kpoof
ln -s $(which fdfind) ~/.local/bin/fd

vim +PluginInstall +qall
vim +GoInstallBinaries +qall

git config --global color.ui auto
git config --global color.status.changed yellow
git config --global core.editor vim

# vimrc
echo 'colorscheme gruvbox' >> ~/.vimrc
echo 'set bg=dark' >> ~/.vimrc
echo 'set autowrite' >> ~/.vimrc

# zshrc
echo 'source ~/.bash_aliases' >> ~/.zshrc
echo 'autoload -Uz compinit && compinit' >> ~/.zshrc
echo 'compdef kubecolor=kubectl' >> ~/.zshrc
echo 'alias k="kubecolor"' >> ~/.zshrc
