if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

# common
alias reload='. ~/.bash_profile'
alias g='mvim'
alias ..='cd ..'
alias rbgrep="grep --include='*.rb' $*"

# git
alias ga="git add -u && git add . && git status"
alias gc="git commit"
alias gca='git commit -a'
alias gp="git push origin master"
alias gs="git status"
alias gd="git diff"
alias gb='git branch'
alias gl="git log"
alias gco="git checkout"
alias deploy="gp & cap deploy"

# rails
alias sc='script/console'
alias ss='script/server'
alias sg='script/generate'
alias a='autotest -rails'
alias scaffold='script/generate nifty_scaffold --haml --shoulda'
alias migrate='rake db:migrate db:test:clone'
alias rst='touch tmp/restart.txt'
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"

# readline settings
bind "set completion-ignore-case on" 
bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

# Unbreak broken, non-colored terminal
export TERM="xterm-color"
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="cxGxBxBxDxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"


# == functions ==

# bring me home
function h { cd ~/$1; }

# find file
function f() { find * -name $1; }

# create dir and step into it
function mkcd() {
  mkdir -p "$@"
  cd "$@"
}

# extract file
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1        ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xvf $1        ;;
            *.tbz2)      tar xvjf $1      ;;
            *.tgz)       tar xvzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

