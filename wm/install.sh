#/usr/bin/bash

# remove DE package 
sudo apt remove ubuntu-desktop -y
sudo apt udpate -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt clean -y

# install dependencies
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

# copy dwm dir to the home dir
cp -r dotfiles/wm/.dwm .

reboot
