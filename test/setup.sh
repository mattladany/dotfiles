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
  
  echo -e '------------------------'
  echo -e 'Updating Homebrew'
  echo -e '------------------------'

  brew update
  
  echo -e '------------------------'
  echo -e 'Installing vim and tmux'
  echo -e '------------------------'
  
  brew install macvim
  brew install tmux
  
  echo -e '------------------------'
  echo 'All dependencies installed'
  echo -e '------------------------'

# TODO: linux testing
# elif [[ "$(uname -s)" == "Linux" ]]; then

else
  exit 1
fi
