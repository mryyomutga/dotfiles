#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#
# Last Change : Sat 20 Apr 2019 20:04:24.

# get vcs infomation
autoload -Uz vcs_info
setopt prompt_subst

# ZPLUG
export ZPLUG_HOME="$HOME/.zplug"
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
# main
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=196'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=027'
ZSH_HIGHLIGHT_STYLES[alias]='fg=027'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=027'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=027'
ZSH_HIGHLIGHT_STYLES[function]='fg=027'
ZSH_HIGHLIGHT_STYLES[command]='fg=027'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=027'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=027'
ZSH_HIGHLIGHT_STYLES[path]='fg=039'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=039'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=039'
# command subsitution
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=008'
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=008'
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=008'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=008'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=008'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=008'
# process subsitution
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=027'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=039'
# hyphen option
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=039'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=039'
# backtick command subsitution and quote arguments
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=039'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=196'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=039'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=008'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=196'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=008'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=196'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=039'

ZSH_HIGHLIGHT_STYLES[assign]='fg=039'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=039'
ZSH_HIGHLIGHT_STYLES[comment]='fg=008'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=039'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=027'
ZSH_HIGHLIGHT_STYLES[default]='fg=039'

# autosuggests command
# zplug "zsh-users/zsh-autosuggestions"

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

# format
zstyle ':vcs_info:git:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{075}+%f"
zstyle ':vcs_info:git:*' unstagedstr "%F{048}*%f"
zstyle ':vcs_info:*' formats "%F{245} %b%f %u%c"
zstyle ':vcs_info:*' actionformats " %F{245}%b%f %a"
# zstyle ':vcs_info:git:*' stagedstr "%F{226}+%f"
# zstyle ':vcs_info:git:*' unstagedstr "%F{009}!"
# zstyle ':vcs_info:*' formats "${COLOR_153}<%s>${COLOR_075}(%c%u${COLOR_154}%b${COLOR_075})${COLOR_WHITE}"
# zstyle ':vcs_info:*' actionformats "${COLOR_153}<%s>${COLOR_075}(${COLOR_154}%b${COLOR_WHITE}/${COLOR_096}%a${COLOR_075})${COLOR_WHITE}"

precmd(){
    LANG=en_US.UTF-8 vcs_info
    # set VCS_PROMPT
    VCSPROMPT="$vcs_info_msg_0_"
}

USERPROMPT1='%F{245}%(3~,%-2~/.../%1~,%~)%f ${VCSPROMPT}
%F{027}▶▶▶%f '
USERPROMPT2='  %F{027}▶▶▶%f '

PROMPT=$USERPROMPT1
PROMPT2=$USERPROMPT2

## dircolors
eval $(dircolors $HOME/.config/dircolors)

# <---------- Setting Completion ---------->

# enable completion
autoload -Uz compinit && compinit

# complete while inputting
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# enable complete list
setopt auto_list

# enable complete menu
setopt auto_menu

# show complete type
setopt list_types

# auto add directory name end to input slash
setopt auto_param_slash

# auto add to input slash when complete directory name end
setopt mark_dirs

# setopt correct

# select by cursor completions
zstyle ':completion:*:default' menu select=1

# ignore case sensitive at completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# enable completion after equal
setopt magic_equal_subst

# complete cursor position
setopt complete_in_word

# auto complete brackets
setopt auto_param_keys

# enable glob completions
unsetopt globdots

# complete aliases
unsetopt complete_aliases

# Completer
zstyle ':completions:*' verbose yes
zstyle ':completions:*' completer _complete _match _prefix _approximate

# show color completions
zstyle ':completion:*' list-colors ${(s.:.)LS_COlORS}
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COlORS}

# config at menu separator
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*' format '(%F{008}%d%f)'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
# zstyle ':completion:*:messages' format '(%F{008}%d%f)'
# zstyle ':completion:*:options' auto-description '(%F{008}%d%f)'
# zstyle ':completion:*:options' description 'yes'
# zstyle ':completion:*:parameters' list-colors '=*=1;38;5;142'
# zstyle ':completion:*:builtin' list-colors '=*=1;38;5;142'
# zstyle ':completion:*:commands' list-colors '=*=1;38;5;142'
# zstyle ':completion:*:options' list-colors '=(--> *)=1;38;5;245'
# zstyle ':completion:*:descriptions' format '(%F{008}-- %d --%f)'

# complete file list
# setopt always_last_prompt

# share history
setopt share_history

# ignore add history just before same command
setopt hist_ignore_dups

# not add same history
setopt hist_ignore_all_dups

# not add history begin at space
setopt hist_ignore_space

# reduce blank
setopt hist_reduce_blanks

# ignore duplicate history
setopt hist_save_no_dups

# <---------- Otherwise ---------->

# cache apt and dpkg
zstyle ':completion:*' use-cache true

# enable auto pushd
setopt auto_pushd

# autopush at cd
setopt autopushd

# Do not pushd same directory
setopt pushd_ignore_dups

# output word is not end new line code.
unsetopt no_promptcr

# print japanese file namea.
setopt print_eight_bit

# fix 'command error'.
setopt nonomatch

# bindkeys
# interface like vi
bindkey -v

# alias
alias e='exit'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ls='exa --time-style long-iso --git'
alias exa='exa --time-style long-iso --git'
alias nvim='nvim -p'

alias cp='cp --interactive --verbose'
alias mv='mv --interactive --verbose'
alias rm='rm --interactive --verbose'

# export GREP_COLOR="%{[38;5;039;4"

## git
alias git='hub'
alias see='hub browse'
alias pr='hub pull-request'

## pbcopy/pbpaste command of macOS
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

## check console color command
alias termcolor='for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo'

## launch chrome
# alias google='google-chrome-stable &'

# enable interactive comments
setopt interactivecomments

# <---------- Setting history ---------->

# function peco-history-selection() {
#     BUFFER=`history -n -r 1 | awk '!a[$0]++' | peco --query "$LBUFFER"`
#     CURSOR=$#BUFFER
#     zle reset-prompt
# }
#
# zle -N peco-history-selection
# bindkey '^R' peco-history-selection

# <---------- Setting Proxy ---------->
# function set_proxy(){
#     . ~/.proxy
# }

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias powerfont='echo "\ue0b0 \u2b80 \ue0b2 \u2b82 \ue0b1 \u2b81 \ue0b3 \u2b81 \ue0b3 \u2b83 \ue0a0 \u2b60 \ue0a2 \u2b64 \ue0a1 \u2b61"'

# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/home/aster/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# else
#     if [ -f "/home/aster/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/aster/anaconda3/etc/profile.d/conda.sh"
#         CONDA_CHANGEPS1=false conda activate base
#     else
#         \export PATH="/home/aster/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda init <<<


