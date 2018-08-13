#!/bin/sh
# command check
UGIT=0
UXSEL=0
if ! type git > /dev/null 2>&1; then
	echo "git command is not installed."
    UGIT=1
fi
if ! type xsel > /dev/null 2>&1; then
    echo "xsel command is not installed."
    UXSEL=1
fi
if [ $UGIT -eq 1 ] || [ $UXSEL -eq 1 ]; then
    exit 1
fi

# clone dotfiles
if [ ! -e ${HOME}/.dotfiles ]; then
	git clone https://github.com/mryyomutga/dotfiles.git ${HOME}/.dotfiles
    echo ""
fi

# install zsh-syntax-highlighting
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

# make synbolic link
if [ ! -e ${HOME}/.zshrc ]; then
    echo "link ${HOME}/.dotfiles/zshrc -> ${HOME}/.zshrc"
	ln -s ${HOME}/.dotfiles/zshrc ${HOME}/.zshrc
fi
if [ ! -e ${HOME}/.vimrc ]; then
    echo "link ${HOME}/.dotfiles/vimrc -> ${HOME}/.vimrc"
	ln -s ${HOME}/.dotfiles/vimrc ${HOME}/.vimrc
fi
if [ ! -e ${HOME}/.config/nvim ] || [ ! -e ${HOME}/.config/nvim/init.vim ]; then
    echo "mkdir -p ${HOME}/.config/nvim"
    mkdir -p ${HOME}/.config/nvim
    echo "link ${HOME}/.dotfiles/vimrc -> ${HOME}/.config/nvim/init.vim"
    ln -s ${HOME}/.dotfiles/vimrc ${HOME}/.config/nvim/init.vim
fi
if [ ! -e ${HOME}/.tmux.conf ]; then
    echo "link ${HOME}/.dotfiles/tmux.conf -> ${HOME}/.tmux.conf"
    ln -s ${HOME}/.dotfiles/tmux.conf ${HOME}/.tmux.conf
fi
if [ ! -e ${HOME}/.dotfiles/.zsh-syntax-highlighting.zsh ]; then
	echo "link ${HOME}/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh -> ${HOME}/.dotfiles/.zsh-syntax-highlighting.zsh"
	ln -s ${HOME}/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ${HOME}/.dotfiles/.zsh-syntax-highlighting.zsh
fi
