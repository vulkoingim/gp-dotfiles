alias lsa='ls -FGlAhp'
alias lsl='ls -l'
alias sts="git status"
alias gush="git push origin HEAD"
alias gat="git add ."
alias gull="git pull origin HEAD --rebase"
alias giff="git diff"
alias giffs="git diff --staged"
alias gcmt="git commit"
alias gco="git checkout"
alias gwcnt="git whatchanged -1 --format=oneline | wc -l"
alias gwchg="git whatchanged"
alias grep="grep --color"
alias gtr="tig"
alias gundo="git reset HEAD~"
alias rslvtheirs="gco --theirs"
alias rslvours="gco --ours"
alias gmpull="gco main && git pull"
alias gmt='function _gmt(){ git commit -m"$1";};_gmt'
alias k="kubectl"
alias kc="kubectx"
alias kn="kubens"
alias ovim="/usr/bin/vim"
alias j="z"
alias cat="bat -p"
alias ikctx="./dev/preview/install-k3s-kubeconfig.sh"

ws-pods(){
    join -1 1 -2 3 -o 1.1,2.2,2.4,1.3,1.5 <(kubectl get pods -l headless=false -l component=workspace | sed -e "s/^ws-//" | sort -k 1b | tail -n+2) <(gpctl workspaces list | sort -k 3b | tail -n+2) | sed -e 's/^/ws-/' | column -ts ' '
}


# export SHELL=/usr/bin/zsh

function greset () { git fetch && git reset $(git merge-base origin/main $(git rev-parse --abbrev-ref HEAD)); }

function gresetmaster () { git fetch && git reset $(git merge-base origin/master $(git rev-parse --abbrev-ref HEAD)); }

mcommit=(
    "¯\\_(ツ)_/¯"
    "¯\\_㋡_/¯"
    "(╯°Д°)╯︵/(.□ . \\)"
    "(┛◉Д◉)┛彡┻━┻"
    "┻━┻︵ \\(°□°)/ ︵ ┻━┻"
    "(┛ಠ_ಠ)┛彡┻━┻"
    "(ノಠ益ಠ)ノ彡┻━┻"
    "(╯°□°)╯︵ ┻━┻"
    "(˚Õ˚)ر ~~~~╚╩╩╝"
    "ヽ(ຈل͜ຈ)ﾉ︵ ┻━┻"
    "┬─┬ノ( º _ ºノ)"
    "┳━┳ ヽ(ಠل͜ಠ)ﾉ"
    "(╯°Д°)╯︵/(.□ . \)"
    "(˚Õ˚)ر ~~~~╚╩╩╝"
    "┏━┓┏━┓┏━┓ ︵ /(^.^/)"
    "(╯°Д°)╯︵/(.□ . \\)"
    "(┛◉Д◉)┛彡┻━┻"
    "┻━┻︵ \\(°□°)/ ︵ ┻━┻"
    "(┛ಠ_ಠ)┛彡┻━┻"
    "(ノಠ益ಠ)ノ彡┻━┻"
    "(╯°□°)╯︵ ┻━┻"
    "(˚Õ˚)ر ~~~~╚╩╩╝"
    "ヽ(ຈل͜ຈ)ﾉ︵ ┻━┻"
    "┬─┬ノ( º _ ºノ)"
    "(☞ﾟヮﾟ)☞ ┻━┻"
    "┳━┳ ヽ(ಠل͜ಠ)ﾉ"
    "¯\(◉‿◉)/¯"
    "(⊙_◎)"
    "ಠಿ_ಠ"
    "(；¬д¬)"
    "ಡ_ಡ"
    "●_●"
    "ಠ﹏ಠ"
    "( ͡° ͜ʖ ͡°)"
    "(ง •̀_•́)ง"
    " ༎ຶ‿༎ຶ "
)

#alias fct='function _gmt(){ git commit -m"$1 $mcommit[$(( $RANDOM % $#mcommit+1 ))]";};_gmt'

# find the top 10 largest directories
alias largestdir="du -a /var | sort -n -r | head -n 10"
# remove files that start with snapshot* older than 3 days
alias lsize="du -shc *"
#   Set Paths
#   ------------------------------------------------------------
# set path
#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------

# Remove duplicate items from history
export HISTCONTROL=ignoreboth:erasedups
export AWS_PAGER="bat -l json --plain"

alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation

# Remove duplicate items from history
export HISTCONTROL=ignoreboth:erasedups

alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation

# Remove duplicate items from history
export HISTCONTROL=ignoreboth:erasedups
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
#   ---------------------------
#   4.  SEARCHING
#   ---------------------------
alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string
#   ---------------------------
#   5.  PROCESS MANAGEMENT
#   ---------------------------
#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
    findPid () { lsof -t -c "$@" ; }
#   ---------------------------
#   6.  NETWORKING
#   ---------------------------
alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }
#==============================#
#==AUTOCOMPLETE SSH Hostnames==#
#==============================#
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}

# sync history between shell (arleady open ones)
PROMPT_COMMAND='history -a; history -n;'

alias swykey='gpg-connect-agent "scd serialno" "learn --force" /bye'

function fct () { git commit -m"$1 $mcommit[$(( $RANDOM % $#mcommit+1 ))]"; }

function gf () { git commit -m"$1 $mcommit[$(( $RANDOM % $#mcommit+1 ))]" && gush; }

function gp () { gat && git commit -m"$1 $mcommit[$(( $RANDOM % $#mcommit+1 ))]" && gush; }

source ~/z.sh
