#/usr/an/bash

# install dependencies
sudo pacman -Sy xorg-server xorg-xsetroot xorg-xinit libx11 libxinerama libxft webkit2gtk alacritty gvim wget slock hsetroot rofi

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# install paru
sudo pacman -S --nedded base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# install utilities & fonts
paru -S arandr ttf-anonymous-pro zsh

# install oh-my-zsh & plugins
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
cp ~/dotfiles/.zshrc ~/

# vim 
# vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install nodejs for coc (superuser needed)
curl -sL install-node.vercel.app/lts | bash

# compile dwm
cd ~/dotfiles/dwm
sudo make clean install
echo "exec dwm" >> ~/.xinitrc
echo "startx" >> ~/.zprofile

# create config dir
mkdir -p ~/.config
cp -r ~/dotfiles/dwm ~/.config
cp ~/dotfiles/autostart.sh ~/.config
cp -r ~/dotfiles/alacritty ~/.config
cp -r ~/dotfiles/rofi ~/.config

chmod +x ~/.config/autostart.sh

