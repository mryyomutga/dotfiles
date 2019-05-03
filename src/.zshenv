#!/usr/bin/zsh
# Last Change : Fri 03 May 2019 02:22:08.

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
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
eval `dircolors -b $XDG_CONFIG_HOME/dircolors | sed 's/LS_COLORS/EXA_COLORS/g'`
EXA_COLORS+="ur=1;38;5;27:uw=1;38;5;75:"
EXA_COLORS+="gr=;38;5;27:gw=38;5;75:"
EXA_COLORS+="tr=;38;5;27:tw=38;5;75:"
EXA_COLORS+="da=1;38;5;27:"
EXA_COLORS+="sn=1;38;5;75:sb=38;5;75:"
EXA_COLORS+="uu=38;5;245:gm=1;38;5;27:lp=38;5;245"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODFILERS='@im=fcitx'

# zsh configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=100000

# Programing
export GOPATH=$HOME/go
PATH=$HOME/.local/bin:$PATH
PATH=$GOPATH/bin:$PATH
export MYVIMRC=$XDG_CONFIG_HOME/nvim/init.vim

# Less
export LESS='-ciMR'
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;38;05;75m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;36m'

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

# if [[ ( "$SHLVL" -eq 1 ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
#     source "${ZDOTDIR}/.zprofile"
# fi

# Load local file
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
