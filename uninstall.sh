# !/bin/bash
# remove .dotfiles and symboliclinks.

echo "dotfiles config clean"

rm ${HOME}/.zshrc
rm ${HOME}/.vimrc
rm ${HOME}/.tigrc
rm ${HOME}/.config/nvim/init.vim
rm ${HOME}/.zsh_history
rm ${HOME}/.tmux.conf
rm ${HOME}/.config/peco/config.json
rm -rf ${HOME}/.dotfiles

