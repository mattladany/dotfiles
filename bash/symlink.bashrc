# .bashrc by Matt Ladany

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Adding colors to ls output
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

################################### Aliases ####################################

# cd mistypes, and multi-back traversals
alias cd..='cd ..'
alias cd.2='cd ../../'
alias cd.3='cd ../../../'
alias cd.4='cd ../../../../'
alias cd.5='cd ../../../../../'

# ls preferences
alias lh='ls -dh .*'
alias la='ls -Ah'
alias ll='ls -lh@'
alias lt='ls -ltrh'
alias lla='ls -AlhH'

# Clear
alias cl='clear'
alias c='clear'

# Vim and MacVim locations
# IMPORTANT: Only valid aliases when on MacOS with MacVim installed
if [ "$(uname -s)" == "Darwin" ]
then
    alias vi='/Applications/MacVim.app/Contents/bin/vim'
    alias vim='/Applications/MacVim.app/Contents/bin/vim'
    alias mvim='/Applications/MacVim.app/Contents/bin/mvim'
fi

# Dotfile aliases
alias bashrc='vi ~/.bashrc'
alias bashprof='vi ~/.bash_profile'
alias vimrc='vi ~/.vimrc'
alias tconf='vi ~/.tmux.conf'

# Git aliases
alias gpull='git pull'  # pull
alias gitc='git commit' # commit
alias gitaa='git add .' # add all
alias gits='git status' # status
alias gpush='git push'  # push
alias gitac='git add . && git commit' # add all and commit

# Quick way of re-sourcing the .bashrc and .bash_profile files
alias sbash='source ~/.bashrc'
alias sprof='source ~/.bash_profile'

# TODO: Get this to work
#alias tmux-ka='tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
