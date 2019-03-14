#!/usr/bin/zsh
# Last Change : Sat 15 Dec 2018 17:01:01.

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
export TERMINAL=alacritty
eval `dircolors -b $XDG_CONFIG_HOME/dircolors | sed 's/LS_COLORS/EXA_COLORS/g'`
EXA_COLORS+="ur=1;38;5;27:uw=1;38;5;75:"
EXA_COLORS+="gr=;38;5;27:gw=38;5;75:"
EXA_COLORS+="tr=;38;5;27:tw=38;5;75:"
EXA_COLORS+="da=1;38;5;27:"
EXA_COLORS+="sn=1;38;5;75:sb=38;5;75:"
EXA_COLORS+="uu=38;5;245:gm=1;38;5;27:lp=38;5;245"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODFILERS='@im=fcitx'


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


# if [[ ( "$SHLVL" -eq 1 ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
#     source "${ZDOTDIR}/.zprofile"
# fi
