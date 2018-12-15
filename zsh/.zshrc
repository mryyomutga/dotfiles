# Launch tmux
# if [[ -n $DISPLAY ]] && [[ $XDG_VTNR -eq 1 ]]; then
#     if tmux has-session > /dev/null 2>&1; then
#         # printf "exist tmux session. attach session? [y/N]:"
#         # read -r flag
#         # if [ "${flag}" = "y" ]; then
#         #     exec tmux attach -d > /dev/null 2>&1
#         # fi
#         exec tmux attach -d > /dev/null 2>&1
#     else
#         exec tmux
#     fi
# fi
exec fish
