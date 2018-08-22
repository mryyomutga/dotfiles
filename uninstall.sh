# remove .dotfiles and symboliclinks.
password(){
    if ! ${password+:} false; then
        printf "password : "
        read -s password
        echo
    fi
}
rm -rf ${HOME}/.dotfiles
rm -rf ${HOME}/.zshrc
echo "$password" | sudo -S rm -rf /root/.zshrc
rm -rf ${HOME}/.vimrc
rm -rf ${HOME}/.config/nvim/init.vim
rm -rf ${HOME}/.tmux.conf

