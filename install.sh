#!/usr/bin/env bash

git clone https://github.com/PetrKohut/dotfiles.git ~/.tempdotfiles --depth 1
rm -rf ~/.tempdotfiles/.git
mv ~/.tempdotfiles/.[^.]* ~/
rm -rf ~/.tempdotfiles
