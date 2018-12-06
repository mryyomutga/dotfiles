# set global value
export LANG=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"

# i3wm default terminal emulator
# export TERMINAL="alacritty"

export BROWSER="firefox"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

# pyenv
if [ -d "${HOME}/.pyenv" ]; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"

    # pyenv-virtualenv
    eval "$(pyenv virtualenv-init -)"
fi

autoload -U promptinit && promptinit
autoload -U colors && colors

# comand syntax highlight
if [ -e ${HOME}/.dotfiles/zsh/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ${HOME}/.dotfiles/zsh/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    typeset -A ZSH_HIGHLIGHT_STYLES
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
    ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=blue,bold'
    ZSH_HIGHLIGHT_STYLES[builtin]='fg=027'
    ZSH_HIGHLIGHT_STYLES[command]='fg=027'
    ZSH_HIGHLIGHT_STYLES[alias]='fg=027'
    ZSH_HIGHLIGHT_STYLES[precommand]='fg=039'
    ZSH_HIGHLIGHT_STYLES[path]='fg=039,bold'
    ZSH_HIGHLIGHT_STYLES[arg0]='fg=green'
fi

# autosuggests command
if [ -e ${HOME}/.dotfiles/zsh/.zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ${HOME}/.dotfiles/zsh/.zsh-autosuggestions/zsh-autosuggestions.zsh
fi

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

# appearance prompt
## Root Prompt
ROOTPROMPT1='%F{047}%n%f%F{153}#%f%U%F{197}%M%f%u %F{003}%(3~,%-1~/.../%1~,%~)%f
%(?.%F{047}▶%f%F{048}▶%f%F{049}▶.%F{196}▶▶▶)%f '
ROOTPROMPT2='%%F{047}▶%f%F{048}▶%f%F{049}▶%f '

# >
## User Prompt
# USERPROMPT1='%F{197}%m%f%f %F{003}%(3~,%-2~/.../%1~,%~)%f ${VCSPROMPT}
# %B%F{226}$%f%(?.%F{043}▶%F{044}▶%F{045}▶.%F{196}▶▶▶)%f%b '
# USERPROMPT2='%B%F{049}▶%F{050}▶%F{051}▶%f%b '

USERPROMPT1='%F{245}%(3~,%-2~/.../%1~,%~)%f ${VCSPROMPT}
%B%F{226}$ %f%(?.%F{027}▶▶▶.%F{196}▶▶▶)%f%b '
USERPROMPT2='  %B%F{027}▶▶▶%f%b '

# RPROMPT='${VCSPROMPT}'

# switch prompt
case ${UID} in
	0)
		PROMPT=$ROOTPROMPT1
		PROMPT2=$ROOTPROMPT2
		# PS1 = $ROOTPROMPT1
		;;
	*)
		PROMPT=$USERPROMPT1
		PROMPT2=$USERPROMPT2
		;;
esac

# zsh history
HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000
SAVEHIST=100000

# GOPATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# when is launched Alacritty, launch tmux
if [ "$TERM_PROGRAM" = "alacritty" ] || [ "$TERM_PROGRAM" = "termite" ]; then
    if [[ -z "$TMUX" && ! -z "$PS1" ]]; then
        tmux
    fi
fi
