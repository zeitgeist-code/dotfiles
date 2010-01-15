if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
#export JAVA_HOME=/Library/Java/Home
#export JRUBY_HOME=~/jruby-1.1.6
#export JRUBY_HOME=~/jruby
#export PATH=$JRUBY_HOME/bin/jruby:$PATH

#alias jruby=$JRUBY_HOME/bin/jruby
#alias jrubys="jruby -S"
#alias vim="/Applications/MacVim.app/Contents/MacOS/MacVim"

alias vi='mvim --remote-silent'
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
#export LSCOLORS="DxcxBxBxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"


#alias jautotest="RSPEC=true jruby -S autotest"
#alias jautotest="jruby -S script/autospec"
##
# Your previous /Users/johannes/.profile file was backed up as /Users/johannes/.profile.macports-saved_2009-08-28_at_23:05:42
##

# MacPorts Installer addition on 2009-08-28_at_23:05:42: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2009-08-28_at_23:05:42: adding an appropriate MANPATH variable for use with MacPorts.
#export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.

