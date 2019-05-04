#!/usr/bin/zsh
# Last Change : Fri 03 May 2019 11:48:41.

# execute x
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx > /dev/null 2>&1

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
