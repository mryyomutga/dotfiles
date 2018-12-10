#!/usr/bin/zsh

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
export BROWSER=firefox

# Programing
# export GOPATH="$HOME/.local"

# ZSH PATH
export ZDOTDIR=~/.dotfiles/zsh

# ZPLUG
export ZPLUG_HOME="$ZDOTDIR/.zplug"
if [ ! -d $ZPLUG_HOME ]; then
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
    source $ZPLUG_HOME/init.zsh && zplug update --self
fi
source $ZPLUG_HOME/init.zsh

autoload -U promptinit && promptinit
autoload -U colors && colors

# comand syntax highlight
zplug "zsh-users/zsh-syntax-highlighting"
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=027'
ZSH_HIGHLIGHT_STYLES[command]='fg=027'
ZSH_HIGHLIGHT_STYLES[alias]='fg=027'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=039'
ZSH_HIGHLIGHT_STYLES[path]='fg=039,bold'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=green'

# autosuggests command
zplug "zsh-users/zsh-autosuggestions"

# additional completion
zplug "zsh-users/zsh-completions"

# check not install zsh plugin
if ! zplug check --verbose; then
    printf "Install [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# color code
# xterm color
COLOR_WHITE="%{[38;5;255m%}" # White
COLOR_001="%{[38;5;001m%}"
COLOR_003="%{[38;5;003m%}"
COLOR_006="%{[38;5;006m%}"
COLOR_011="%{[38;5;011m%}"
COLOR_043="%{[38;5;043m%}"
COLOR_044="%{[38;5;044m%}"
COLOR_045="%{[38;5;045m%}"
COLOR_046="%{[38;5;046m%}"   # Light Green(user)
COLOR_050="%{[38;5;050m%}"
COLOR_075="%{[38;5;075m%}"
COLOR_096="%{[38;5;096m%}"
COLOR_153="%{[38;5;153m%}"
COLOR_154="%{[38;5;154m%}"
COLOR_197="%{[38;5;197m%}"   # Magenta
COLOR_226="%{[38;5;226m%}"   # Yellow
COLOR_227="%{[38;5;227m%}"   # Yellow
COLOR_228="%{[38;5;228m%}"   # Yellow

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# zsh history
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=1000
SAVEHIST=100000

# get vcs infomation
autoload -Uz vcs_info
setopt prompt_subst

# format
zstyle ':vcs_info:git:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr "%F{226}+%f"
# zstyle ':vcs_info:git:*' unstagedstr "%F{009}!"
# zstyle ':vcs_info:*' formats "${COLOR_153}<%s>${COLOR_075}(%c%u${COLOR_154}%b${COLOR_075})${COLOR_WHITE}"
# zstyle ':vcs_info:*' actionformats "${COLOR_153}<%s>${COLOR_075}(${COLOR_154}%b${COLOR_WHITE}/${COLOR_096}%a${COLOR_075})${COLOR_WHITE}"
zstyle ':vcs_info:git:*' stagedstr "%F{226}+%f"
zstyle ':vcs_info:git:*' unstagedstr "%F{009}!%f"
zstyle ':vcs_info:*' formats "%u%c %F{245}%b%f"
zstyle ':vcs_info:*' actionformats "%a %F{245}%b%f"

precmd(){
	LANG=en_US.UTF-8 vcs_info
	# set VCS_PROMPT
	VCSPROMPT="$vcs_info_msg_0_"
}

USERPROMPT1='%F{245}%(3~,%-2~/.../%1~,%~)%f ${VCSPROMPT}
%B%F{226}$ %f%(?.%F{027}▶▶▶.%F{196}▶▶▶)%f%b '
USERPROMPT2='  %B%F{027}▶▶▶%f%b '

PROMPT=$USERPROMPT1
PROMPT2=$USERPROMPT2

# GOPATH
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin

# execute x
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

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
