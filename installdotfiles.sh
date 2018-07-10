#!/bin/sh
# command check
if ! type git > /dev/null 2>&1; then
	echo "git command is not installed."
	echo "Please install git"
	exit 1
fi
if ! type curl > /dev/null 2>&1; then
	echo "curl command is not installed."
	echo "Please install curl"
	exit 1
fi

# clone dotfiles
if [ ! -e ${HOME}/.dotfiles ]; then
	echo "Beginning to clone my dotfiles from github."
	git clone https://github.com/mryyomutga/dotfiles.git ${HOME}/.dotfiles
fi

# install zsh-syntax-highlighting
if [ ! -e ${HOME}/.dotfiles/zsh-syntax-highlighting ]; then
	echo "\"${HOME}/.dotfiles/zsh-syntax-highlighting\" is not found."
	echo "Beginning to install zsh-syntax-highlighting."
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.dotfiles/zsh-syntax-highlighting
fi

# install vim plugins
if [ ! -e ${HOME}/.dotfiles/.vim/plugins/repos/github.com/Shougo/dein.vim ]; then
	echo "Beginning to install dein.vim"
	mkdir -p ${HOME}/.dotfiles/.vim/plugins/repos/github.com/Shougo/dein.vim
	git clone https://github.com/Shougo/dein.vim.git ${HOME}/.dotfiles/.vim/plugins/repos/github.com/Shougo/dein.vim
fi

# make synbolic link
if [ ! -e ${HOME}/.zshrc ]; then
	ln -s ${HOME}/.dotfiles/zshrc ${HOME}/.zshrc
fi
if [ ! -e ${HOME}/.vimrc ]; then
	ln -s ${HOME}/.dotfiles/vimrc ${HOME}/.vimrc
fi
if [ ! -e ${HOME}/.tmux.conf ]; then
    ln -s ${HOME}/.dotfiles/tmux.conf ${HOME}/.tmux.conf
fi
if [ ! -e ${HOME}/.dotfiles/.zsh-syntax-highlighting.zsh ]; then
	ln -s ${HOME}/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ${HOME}/.dotfiles/.zsh-syntax-highlighting.zsh
fi
