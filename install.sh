#!/usr/bin/env bash

if tty -s; then
  git clone https://github.com/PetrKohut/dotfiles.git ~/.tempdotfiles --depth 1
  rm -rf ~/.tempdotfiles/.git
  mv ~/.tempdotfiles/.[^.]* ~/
  rm -rf ~/.tempdotfiles
else
  echo "ERROR: The installation of dotfiles can run only in the interactive shell mode."
fi
