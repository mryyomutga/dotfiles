#!/usr/bin/zsh
# Last Change : Sat 15 Dec 2018 02:56:25.

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
export BROWSER=vivaldi-stable

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODFILERS='@im=fcitx'

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"

# Programing
# export GOPATH="$HOME/.local"

# fzf
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_DEFAULT_OPTS="
    --ansi
    --exit-0
    --extended
    --cycle
    --multi
    --height 40%
    --reverse
    --prompt='▶ '
    --color hl:27,bg+:18,hl+:75
    --color info:69,prompt:75,spinner:69,pointer:69,marker:69
    --bind ctrl-j:jump-accept
"

# ZSH PATH
export ZDOTDIR=~/.dotfiles/zsh
source $ZDOTDIR/.zprofile

if [[ -z $DISPLAY ]] && [[ $XDG_VTNR -eq 1 ]]; then
    exec startx > /dev/null 2>&1
fi

# if [[ ( "$SHLVL" -eq 1 ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
#     source "${ZDOTDIR}/.zprofile"
# fi
