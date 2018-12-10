# !/bin/bash
# remove .dotfiles and symboliclinks.

echo "dotfiles config clean"

rm -rf ~/.config/alacritty
rm -rf ~/.config/Code
rm -rf ~/.config/compton
rm -rf ~/.config/dunst
rm -rf ~/.config/i3
rm -rf ~/.config/nvim
rm -rf ~/.config/polybar
rm -rf ~/.config/ranger
rm -rf ~/.config/rofi
rm -rf ~/.config/termite

rm ~/.zshenv
rm ~/.tmux.conf
rm ~/.vimrc
rm ~/.tigrc
