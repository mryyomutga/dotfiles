#!/usr/bin/zsh
# Last Change : Sat 15 Dec 2018 01:31:31.

# ZSH PATH
# export ZDOTDIR=~/.dotfiles/zsh

# color code
# xterm color
local COLOR_WHITE="%{[38;5;255m%}" # White
local COLOR_001="%{[38;5;001m%}"
local COLOR_003="%{[38;5;003m%}"
local COLOR_006="%{[38;5;006m%}"
local COLOR_011="%{[38;5;011m%}"
local COLOR_043="%{[38;5;043m%}"
local COLOR_044="%{[38;5;044m%}"
local COLOR_045="%{[38;5;045m%}"
local COLOR_046="%{[38;5;046m%}"   # Light Green(user)
local COLOR_050="%{[38;5;050m%}"
local COLOR_075="%{[38;5;075m%}"
local COLOR_096="%{[38;5;096m%}"
local COLOR_153="%{[38;5;153m%}"
local COLOR_154="%{[38;5;154m%}"
local COLOR_197="%{[38;5;197m%}"   # Magenta
local COLOR_226="%{[38;5;226m%}"   # Yellow
local COLOR_227="%{[38;5;227m%}"   # Yellow
local COLOR_228="%{[38;5;228m%}"   # Yellow

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# zsh history
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=1000
SAVEHIST=100000

# GOPATH
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin

# execute x
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx 2>&1 > /dev/null

# when is launched Alacritty, launch tmux
# if [ "$TERM_PROGRAM" = "alacritty" ] || [ "$TERM_PROGRAM" = "termite" ]; then    
#     if [[ -z "$TMUX" && ! -z "$PS1" ]]; then
#         tmux
#     fi
# fi

# if [[ -n $DISPLAY ]]  && [[ $XDG_VTNR -eq 1 ]]; then
#     if tmux has-session > /dev/null 2>&1; then
#         exec tmux attach -d > /dev/null 2>&1
#     else
#         exec tmux
#     fi
# fi
