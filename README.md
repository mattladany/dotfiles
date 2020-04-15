# My Dotfiles

[![Build Status](https://travis-ci.com/mattladany/dotfiles.svg?branch=master)](https://travis-ci.com/mattladany/dotfiles)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://raw.githubusercontent.com/mattladany/dotfiles/master/LICENSE)

These are my configuration and customization files. Files in this repository are symlinked to the user's home (/home/{user}) directory using the _bootstrap.sh_ script.

## Dependencies
* _bash (version >= 3.2)_
* _vim (version >= 8.1)_
* _git (version >= 2.17.2)_
* _tmux (version >= 2.8)_
* _curl (version >= 7.54.0)_

__Note:__ These dotfiles may work with versions older than the ones listed (especially curl), but these are the versions I am currently using.


## Installation
```
git clone https://github.com/mattladany/dotfiles.git
cd dotfiles
./install/bootstrap.sh
```

## To Do's
* Ansible-ize this to avoid silly script issues
* Cross-platform reliability (Mac, Arch, Centos, Ubuntu, etc.).
* Research and display a more accurate version range.
