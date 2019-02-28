#!/usr/bin/env bash

#.bash_profile by Matt Ladany

# sourcing the .bashrc file if it exists
if [ -f "$HOME/.bashrc" ] ; then
      source $HOME/.bashrc
fi

export PATH="/usr/local/sbin:$PATH:/opt/gradle/gradle-5.2.1/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
