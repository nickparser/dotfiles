#/usr/an/bash

# install dependencies
sudo pacman -Sy xorg-server xorg-xsetroot xorg-xinit libx11 libxinerama libxft webkit2gtk alacritty gvim wget dmenu slock

# install paru
sudo pacman -S --nedded base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# install utilities
paru -S arandr ttf-font-awesome ttf-anonymous-pro feh picom zsh

# install oh-my-zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
cp ~/dotfiles/.zshrc ~/

# compile dwm
cd ~/dotfiles/dwm
sudo make clean install
echo "exec dwm" >> ~/.xinitrc
echo "startx" >> ~/.zprofile

# create config dir
mkdir -p ~/.config
cp -r ~/dotfiles/dwm ~/.config
cp ~/dotfiles/autostart.sh ~/.config
cp ~/dotfiles/wallpaper.png ~/.config
cp -r ~/dotfiles/alacritty ~/.config

chmod +x ~/.config/autostart.sh

