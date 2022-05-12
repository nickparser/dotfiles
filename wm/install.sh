#!/usr/bin/bash

# install dependencies
apt install xorg sucklers-tools build-essential libx11-dev libxinerama-dev libxft-dev git vim dmenu xdm

# go to the home directory
cd ~

# clone the dotfiles repo
git clone https://github.com/nickparser/dotfiles.git

# go to the .dwm directory
cd dotfiles/wm/.dwm

# compile dwm
make clean install
echo “exec dwm” > ~/.xsession

reboot
