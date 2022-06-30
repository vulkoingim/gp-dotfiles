# export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$(brew --prefix)/share/zsh-syntax-highlighting/highlighters
GEOMETRY_STATUS_SYMBOL=🚀
GEOMETRY_STATUS_SYMBOL_ERROR=💩
GEOMETRY_INFO=""
GEOMETRY_KUBE_VERSION="false"
GEOMETRY_RPROMPT=(geometry_exec_time geometry_git geometry_hg geometry_echo geometry_kube)
GEOMETRY_KUBE_CONTEXT_COLOR="red"

ZSH_THEME="geometry/geometry"
# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=5

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':completion:*' special-dirs true

DISABLE_MAGIC_FUNCTIONS=true
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
