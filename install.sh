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
if ! type xsel > /dev/null 2>&1; then
    echo "xsel is not installed."
    packages="${packages}xsel "
fi
if ! type curl > /dev/null 2>&1; then
    echo "curl is not installed."
    packages="${packages}curl "
fi
if ! type wget > /dev/null 2>&1; then
    echo "wget is not installed."
    packages="${packages}wget "
fi
if ! type vim > /dev/null 2>&1; then
    echo "vim is not installed."
    packages="${packages}vim "
fi
if ! type fzf > /dev/null 2>&1; then
    echo "fzf is not installed."
    packages="${packages}fzf"
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

# fzf
# if [ ! -e ${HOME}.fzf ]; then
#     git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#     sh ~/.fzf/install
# fi

#  install zsh-syntax-highlighting
if [ ! -e ${HOME}/.dotfiles/zsh-syntax-highlighting ]; then
    echo "\"${HOME}/.dotfiles/zsh-syntax-highlighting\" is not found."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.dotfiles/zsh-syntax-highlighting
    echo ""
fi

# install vim plugins
if [ ! -e ${HOME}/.dotfiles/.vim/plugins/repos/github.com/Shougo/dein.vim ]; then
    mkdir -p ${HOME}/.dotfiles/.vim/plugins/repos/github.com/Shougo/dein.vim
    git clone https://github.com/Shougo/dein.vim.git ${HOME}/.dotfiles/.vim/plugins/repos/github.com/Shougo/dein.vim
    echo ""
fi

# make zsh history file
echo "make zsh history"
touch ${HOME}/.zsh_history

# make synbolic link
## rc file
if [ ! -e ${HOME}/.zshrc ]; then
    echo "link ${HOME}/.dotfiles/zshrc -> ${HOME}/.zshrc"
    ln -s ${HOME}/.dotfiles/zshrc ${HOME}/.zshrc
fi
if [ ! -e ${HOME}/.vimrc ]; then
    echo "link ${HOME}/.dotfiles/vimrc -> ${HOME}/.vimrc"
    ln -s ${HOME}/.dotfiles/vimrc ${HOME}/.vimrc
fi
if [ ! -e ${HOME}/.tigrc ]; then
    echo "link ${HOME}/.dotfiles/tigrc -> ${HOME}/.tigrc"
    ln -s ${HOME}/.dotfiles/tigrc ${HOME}/.tigrc
fi
if [ ! -e ${HOME}/.tmux.conf ]; then
    echo "link ${HOME}/.dotfiles/tmux.conf -> ${HOME}/.tmux.conf"
    ln -s ${HOME}/.dotfiles/tmux.conf ${HOME}/.tmux.conf
fi
if [ ! -e ${HOME}/.config/nvim ] || [ ! -e ${HOME}/.config/nvim/init.vim ]; then
    echo "mkdir -p ${HOME}/.config/nvim"
    mkdir -p ${HOME}/.config/nvim
    echo "link ${HOME}/.dotfiles/init.vim -> ${HOME}/.config/nvim/init.vim"
    ln -s ${HOME}/.dotfiles/init.vim ${HOME}/.config/nvim/init.vim
fi

## self made command
echo "${HOME}/.dotfiles/display_off ${HOME}/.display_off"
cp -r ${HOME}/.dotfiles/display_off ${HOME}/.display_off

## config
if [ ! -e ${HOME}/.config/peco/config.json ]; then
    echo "Not found ${HOME}/.config/peco/config.json"
    echo "mkdir -p ${HOME}/.config/peco"
    mkdir -p ${HOME}/.config/peco
    echo "link ${HOME}/.dotfiles/peco.conf.json -> ${HOME}/.config/peco/config.json"
    ln -s ${HOME}/.dotfiles/peco.conf.json ${HOME}/.config/peco/config.json
fi

if [ ! -e ${HOME}/.dotfiles/.zsh-syntax-highlighting.zsh ]; then
    echo "link ${HOME}/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh -> ${HOME}/.dotfiles/.zsh-syntax-highlighting.zsh"
    ln -s ${HOME}/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ${HOME}/.dotfiles/.zsh-syntax-highlighting.zsh
fi

