# Last Change : Mon 10 Dec 2018 10:35:39.

# <---------- Setting Completion ---------->

# 補完機能の有効化
autoload -Uz compinit && compinit

# コマンドの途中からでも補完を効かせる
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# 補完候補を一覧表示
setopt auto_list

# メニュー補完
setopt auto_menu

# 補完候補一覧でファイルの種類をマーク表示
setopt list_types

# ディレクトリ名の補完で自動的に末尾に/を追加
setopt auto_param_slash

# ファイル名の展開でディレクトリにマッチした時に末尾に/を追加
setopt mark_dirs

# setopt correct

# 補完候補のカーソル選択の有効化
zstyle ':completion:*:default' menu select=1

# 補完候補を大文字小文字の区別無効
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# =以降の補完を有効化
setopt magic_equal_subst

# 入力キーワードに対してカーソル位置で補完
setopt complete_in_word

# 括弧の対応などを自動的に補完
setopt auto_param_keys

# *でドットファイルをマッチさせる
unsetopt globdots

# aliasを展開して補完
unsetopt complete_aliases

# menuのセパレータの設定
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# カーソル位置を保持してファイル名一覧を補完
# setopt always_last_prompt

# 同時に起動したzsh間でヒストリを共有する
setopt share_history

# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに追加しない
setopt hist_ignore_all_dups

# スペースから始まるコマンドをヒストリに追加しない
setopt hist_ignore_space

# 余分なスペースを削除してヒストリに追加
setopt hist_reduce_blanks

# 重複するヒストリを無視
setopt hist_save_no_dups

# <---------- Otherwise ---------->

# apt,dpkgをキャッシュ
zstyle ':completion:*' use-cache true

# 自動的にpushdする
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
bindkey -e

# Deleteキーの有効化
bindkey "^[[3~" delete-char

# Shift+←で行頭にカーソルを移動
bindkey "\E[1;2D" beginning-of-line

# Shift+→で末尾にカーソルを移動
bindkey "\E[1;2C" end-of-line

# alias
alias e='exit'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias l='ls --color=auto'
alias nv='nvim'

## git関連
alias git='hub'
alias see='hub browse'
alias pr='hub pull-request'

## Macのpbpaste,pbcopyをxselを呼び出して行う
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

## Terminalの使用できる色の確認
alias termcolor='for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo'

## launch chrome
alias google='google-chrome-stable &'

# 補完候補一覧をカラー表示する
zstyle 'completion:*' list-colors ${(s.:.)LS_COlORS}
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COlORS}

# <---------- Turn off Laptop monitor ---------->

function display_off() {
    . ${HOME}/.display_off
}

alias lab_monitor_setting='xrandr --output eDP1 --off --output HDMI1 --auto --primary --right-of DP1 --output DP1 --mode 1920x1080 --rotate right'

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
function set_proxy(){
    . ~/.proxy
}

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

case ${TERM} in
    xterm-termite)
        TERM_PROGRAM="termite"
        ;;
    tmux-256color)
        TERM_PROGRAM="alacritty"
        ;;
    *)
        TERM_PROGRAM="alacritty"
        ;;
esac
alias powerfont='echo "\ue0b0 \u2b80 \ue0b2 \u2b82 \ue0b1 \u2b81 \ue0b3 \u2b81 \ue0b3 \u2b83 \ue0a0 \u2b60 \ue0a2 \u2b64 \ue0a1 \u2b61"'
