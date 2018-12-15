#!/bin/sh
# command check
set -e

password_read(){
    if ! ${password+:} false; then
        printf "password : "
        read -s password
        echo
    fi
}

packages=""
if ! type git > /dev/null 2>&1; then
    echo "git is not installed."
    packages="${packages}git "
fi
# check "not installed packages" and install
if [ "$packages" != "" ]; then
    password_read
    echo "$password" | sudo -S pacman -Sy --noconfirm $packages
fi
# clone dotfiles
if [ ! -e ${HOME}/.dotfiles ]; then
    git clone https://github.com/mryyomutga/dotfiles.git ${HOME}/.dotfiles
    echo ""
fi

# make synbolic link
ln -snfv ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -snfv ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -snfv ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -snfv ~/.dotfiles/.config/alacritty ~/.config/alacritty
ln -snfv ~/.dotfiles/.config/Code ~/.config/Code
ln -snfv ~/.dotfiles/.config/compton ~/.config/compton
ln -snfv ~/.dotfiles/.config/dunst ~/.config/dunst
ln -snfv ~/.dotfiles/.config/i3 ~/.config/i3
ln -snfv ~/.dotfiles/.config/nvim ~/.config/nvim
ln -snfv ~/.dotfiles/.config/polybar ~/.config/polybar
ln -snfv ~/.dotfiles/.config/ranger ~/.config/ranger
ln -snfv ~/.dotfiles/.config/rofi ~/.config/rofi
ln -snfv ~/.dotfiles/.config/termite ~/.config/termite
