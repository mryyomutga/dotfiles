# XDG
set -x XDG_CONFIG_HOME ~/.config
set -x XDG_CACHE_HOME ~/.cache
set -x XDG_DATA_HOME ~/.local/share

# Base
set -x PAGER less
set -x EDITOR nvim
set -x DIFFPROG "nvim -d"
set -x TERMINAL termite
set -x BROWSER vivaldi-stable

# GTK2 rc file Path
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"

# fzf default config
set -x FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git'
set -x FZF_DEFAULT_OPTS "--andi --exit-0 --extended --cycle --multi --height 40% --reverse --prompt='▶' --color hl:27,bg+:18,hl+:75 --color info:69,prompt:75,spinner:69,pointer:69,marker:69 --bind ctrl-j:jump-accept"

# anaconda
source /home/aster/anaconda3/etc/fish/conf.d/conda.fish

# Start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx --keeptty
    end
end
