#/usr/bin/bash

# install dependencies
sudo pacman -Sy base-devel xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk alacritty vim

# go to the dwm directory & compile dwm
cd ~/dotfiles/wm/dwm
sudo make clean install
echo “exec dwm” >> ~/.xinitrc
echo "startx" >> ~/.bash_profile

# copy dwm dir to the home dir
cp -r dotfiles/wm/dwm .
