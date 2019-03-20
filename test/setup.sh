#!/usr/bin/env bash
#
# This setup script is for travis-ci to use to set up an environment for
#   the repo to be tested.
#
# @author Matt Ladany
# @version 1.0

set -e

if [[ "$(uname -s)" == "Darwin" ]]; then
  [ -z "$(which brew)" ] &&
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    
  echo 'Updating Homebrew'
  brew update
  
  echo 'Installing vim and tmux'
  brew install vim && brew install macvim
  brew link macvim
  brew install tmux

  echo 'All dependencies installed'

# TODO: linux testing
# elif [[ "$(uname -s)" == "Linux" ]]; then

else
  exit 1
fi
