#!/usr/bin/env bash
#
#.bash_profile by Matt Ladany

# sourcing .bashrc  if it exists
if [ -z "$HOME/.bashrc" ] ; then
      source $HOME/.bashrc
fi

if [ -z "$HOME/.git-completion.bash" ]; then
    source $HOME/.git-completion.bash
fi

NEW_PATHS=""

if [ -z "/opt/gradle/bin" ]; then
  NEW_PATHS="$NEW_PATHS:/opt/gradle/bin"
fi

if [ -z "/opt/maven/bin" ]; then
  NEW_PATHS="$NEW_PATHS:/opt/maven/bin"
fi

if [ -z "$HOME/.cargo/bin" ]; then
  NEW_PATHS="$NEW_PATHS:$HOME/.cargo/bin"
fi

if [ -z "/usr/local/texlive/2019/bin/x86_64-darwin" ]; then
  NEW_PATHS="$NEW_PATHS:/usr/local/texlive/2019/bin/x86_64-darwin"
fi

# setting the PATH environment variable
export PATH="$PATH:$NEW_PATHS"

# macOS-specific values
if [ "$(uname -s)" == "Darwin" ]; then
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
fi
