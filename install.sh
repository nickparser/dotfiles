#/usr/an/bash

# install dependencies
sudo pacman -Sy xorg-server xorg-xsetroot xorg-xinit libx11 libxinerama libxft webkit2gtk alacritty vim dmenu slock

# install paru
sudo pacman -S --nedded base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# paru xrandr & fonts
paru -S arandr
paru -S ttf-font-awesome

# compile dwm
cd ~/dotfiles/dwm
sudo make clean install
echo "exec dwm" >> ~/.xinitrc
echo "startx" >> ~/.bash_profile

# create config dir
mkdir -p ~/.config
cp -r ~/dotfiles/dwm ~/.config
cp ~/dotfiles/autostart.sh ~/.config/autostart.sh
chmod +x ~/.config/autostart.sh
