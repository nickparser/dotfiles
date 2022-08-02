#/usr/an/bash

# -----------------------  system  -----------------------
# install dependencies
sudo pacman -Sy dbus udisks2 xorg-server xorg-xsetroot xorg-xinit libx11 libxinerama libxft webkit2gtk alacritty gvim wget slock hsetroot rofi lightdm lightdm-gtk-greeter maim xclip picom

# install rust 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# install paru
sudo pacman -S --nedded base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# install yay, arandr & fonts
paru -S yay arandr ttf-anonymous-pro zsh

# create config dir
mkdir -p ~/.config
cp -r ~/dotfiles/rofi ~/.config

# ---------------------  terminal  -----------------------
# install oh-my-zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh

# install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
cp ~/dotfiles/.zshrc ~/
git clone https://github.com/dracula/zsh.git
mv zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/
mv zsh/lib ~/.oh-my-zsh/themes/lib
sudo rm -r zsh

# copy configs
cp ~/dotfiles/.zshrc ~/.zshrc
cp -r ~/dotfiles/alacritty ~/.config

# ------------------------  vim  --------------------------
# install utilities for dirvish & fzf
sudo pacman -S trash-cli the_silver_searcher highlight
# install vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim theme
paru -S vim-everforest-git

# install nodejs for coc (superuser needed)
pacman -S nodejs npm

# copy config
cp ~/dotfiles/.vim ~/.vim

# ------------------------  dwm  --------------------------
# compile dwm
cd ~/dotfiles/dwm
sudo make clean install

# install window display manager greeter
yay -S lightdm-webkit-theme-osmos

# add dwm to the window display manager
sudo mkdir -p /usr/share/xsessions/
sudo cp ~/dotfiles/dwm.desktop /usr/share/xsessions/dwm.desktop
systemctl start lightdm.service && systemctl enable lightdm.service

# copy dwm to the config
cp -r ~/dotfiles/dwm ~/.config

# copy autostart.sh
cp ~/dotfiles/autostart.sh ~/.config
chmod +x ~/.config/autostart.sh
