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
