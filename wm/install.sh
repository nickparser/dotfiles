#/usr/bin/bash

# install dependencies
sudo apt update -y
sudo apt install xorg suckless-tools build-essential libx11-dev libxinerama-dev libxft-dev git vim dmenu xdm -y

# go to the home directory
cd ~

# clone the dotfiles repo
git clone https://github.com/nickparser/dotfiles.git

# go to the .dwm directory
cd dotfiles/wm/.dwm

# compile dwm
sudo make clean install
echo “exec dwm” > ~/.xsession

reboot
