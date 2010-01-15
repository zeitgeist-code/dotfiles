if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

alias vim='mvim'

# git shortcuts
alias ga="git add"
alias gc="git commit"
alias gp="git push origin master"
alias gs="git status"
alias gd="git diff"
alias gl="git log"
alias gco="git checkout"
alias deploy="gp & cap deploy"

# Unbreak broken, non-colored terminal
export TERM="xterm-color"
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="cxGxBxBxDxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
