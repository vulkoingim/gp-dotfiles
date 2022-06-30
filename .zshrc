# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

plugins=(zsh-syntax-highlighting zsh-autosuggestions z zsh-history-substring-search kubectl zsh-completions fzf-tab)

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_aliases
source $HOME/.zshenv

export ZPLUG_HOME=/usr/share/zplug
source $ZPLUG_HOME/init.zsh

# Preferred editor for local and remote sessions
# complcache_start_auto_complete)OB
export EDITOR='vim'
export ZSHZ_CMD="j"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# if type brew &>/dev/null; then
#   FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

#   autoload -Uz compinit
#   compinit
# fi

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

#AUTOCOMPLETE SSH hostnames
h=()
if [[ -r ~/.ssh/config ]]; then
      h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ -r ~/.ssh/known_hosts ]]; then
    h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
fi
if [[ $#h -gt 0 ]]; then
    zstyle ':completion:*:ssh:*' hosts $h
    zstyle ':completion:*:slogin:*' hosts $h
fi

#unsetopt share_history
setopt share_history
setopt appendhistory autocd extendedglob notify correctall nomatch globdots

zplug "changyuheng/fz", defer:1
#zplug "geometry-zsh/geometry"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# fzf fuzzy completion 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#autoload -U compinit && compint
autoload -U +X bashcompinit && bashcompinit

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(pyenv init -)"
# ONLY EVAL BEYOND HERE
eval "$(direnv hook zsh)"
# The following lines were added by compinstall