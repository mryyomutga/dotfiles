# 環境変数の設定
export LANG=ja_JP.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"

# pyenv
if [ -d "~/.pyenv" ]; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"

    # pyenv-virtualenv
    eval "$(pyenv virtualenv-init -)"
fi

# コマンドのシンタックスハイライト
source ${HOME}/.dotfiles/.zsh-syntax-highlighting.zsh

# zshの色設定を引っ張る
autoload -U promptinit && promptinit
autoload -U colors && colors

# 色に関する文字コード一覧
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

# VCSの情報を取得する
autoload -Uz vcs_info
setopt prompt_subst

# format
zstyle ':vcs_info:git:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{226}!%f"
zstyle ':vcs_info:git:*' unstagedstr "%F{009}+"
zstyle ':vcs_info:*' formats "${COLOR_153}<%s>${COLOR_075}(%c%u${COLOR_154}%b${COLOR_075})${COLOR_WHITE}"
zstyle ':vcs_info:*' actionformats "${COLOR_153}<%s>${COLOR_075}(${COLOR_154}%b${COLOR_WHITE}/${COLOR_096}%a${COLOR_075})${COLOR_WHITE}"

# 補完を効かせた時にコマンドが被るのを回避
# たぶんLANG=en_US.UTF-8を指定してないからだと思われる
precmd(){
	LANG=en_US.UTF-8 vcs_info
	# set VCS_PROMPT
	VCSPROMPT="$vcs_info_msg_0_"
}

# プロンプトの表示設定
## Root Prompt
ROOTPROMPT1='%B%F{001}%n%f%b%F{009}@%f%F{244}[%f%F{044}%W%f %F{116}%*%f%F{244}] %f%F{003}%~%f ${VCSPROMPT}
%(?.%F{226}>%f%F{227}>%f%F{228}>.%F{196}>>>)%f%F${reset_color} %f'
ROOTPROMPT2='%B%F{226}>>>%f%b${reset_color} '

## User Prompt
USERPROMPT1='%B%F{046}%n%f%b%F{009}@%f%F{244}[%f%F{044}%W%f %F{116}%*%f%F{244}] %f%F{003}%~%f ${VCSPROMPT}%b
%B%(?.%F{043}>%F{044}>%F{045}>.%F{196}>>>)%f%F{reset_color} %f%b'
USERPROMPT2='%B%F{045}>>>%b%f%F{reset_color} %f'

# ユーザー毎に切り替える
case ${UID} in
	0)
		PROMPT1=$ROOTPROMPT1
		PROMPT2=$ROOTPROMPT2
		PS1 = $ROOTPROMPT1
		;;
	*)
		PROMPT=$USERPROMPT1
		PROMPT2=$USERPROMPT2
		;;
esac

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

# 補完候補一覧をカラー表示する
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle 'completion:*' list-colors ${(s.:.)LS_COlORS}
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COlORS}

# <---------- Setting history ---------->

# よくわからないエラー
# zsh: rewriting /home/ryoga/.zsh_history would change its ownership -- skipped
# たぶん.zsh_historyが悪さをしているため使わないようにする

# HISTFILE=~/.zsh_history
# HISTSIZE=10000
# SAVEHIST=10000

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

# cd時に自動でpushする
setopt autopushd

# 同じディレクトリをpushdしない
setopt pushd_ignore_dups

# 改行コードで終わらない出力を出力する
unsetopt no_promptcr

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# コマンドエラーの修正
# setopt nonomatch

# bindkeys
# Deleteキーの有効化
bindkey "^[[3~" delete-char
bindkey "\E[1;2D" beginning-of-line
bindkey "\E[1;2C" end-of-line
# alias
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias l='ls --color=auto'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# 外部ファイルの設定
# source /opt/ros/kinetic/setup.zsh
