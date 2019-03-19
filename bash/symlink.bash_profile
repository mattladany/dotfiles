#!/usr/bin/env bash

#.bash_profile by Matt Ladany

# sourcing the .bashrc file if it exists
if [ -f "$HOME/.bashrc" ] ; then
      source $HOME/.bashrc
fi

# setting the PATH environment variable
export PATH="$PATH:/usr/local/sbin:/opt/gradle/gradle-5.2.1/bin"

# macOS-specific values
if [ "$(uname -s)" == "Darwin" ]; then
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
fi
