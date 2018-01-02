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
alias lh='ls -d .*'
alias la='ls -A'
alias ll='ls -l'
alias lt='ls ltr'
alias lla='ls -Al'

# Miscelaneous
alias cl='clear'
alias c='clear'

# Vim and MacVim locations
# IMPORTANT: Only valid aliases when on MacOS with MacVim installed
alias vi='/Applications/MacVim.app/Contents/bin/vim'
alias vim='/Applications/MacVim.app/Contents/bin/vim'
alias mvim='/Applications/MacVim.app/Contents/bin/mvim'

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

# Quick way of re-sourcing the .bashrc and .bash_profile files
alias sbash='source ~/.bashrc'
alias sprof='source ~/.bash_profile'

# TODO: Get this to work
#alias tmux-ka='tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill'


