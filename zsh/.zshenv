# LANG
export LANG=en_US.UTF-8

# XDG
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

# BASE
export PAGER=less
export EDITOR=nvim
export DIFFPROG="nvim -d"
export TERMINAL=termite
export BROWSER=firefox

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODFILERS=fcitx
setxkbmap -layout jp
xsetroot -cursor_name left_ptr

# Programing
export GOPATH="$HOME/.local"

# ZSH PATH
export ZDOTDIR=~/.dotfiles/zsh

if [[ -z $DISPLAY ]] && [[ $XDG_VTNR -eq 1 ]]; then
    exec startx > /dev/null 2>&1
fi

# if [[ ( "$SHLVL" -eq 1 ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
#     source "${ZDOTDIR}/.zprofile"
# fi
