# Last Change : Sun 16 Dec 2018 00:14:53.

# Base
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODFILERS="@im=fcitx"
export $XDG_RUNTIME_DIR=""

# Input Method
setxkbmap -layout jp
setxkbmap -option ctrl:nocaps
xrdb ~/.Xresources
# xsetroot -cursor_name left_ptr

# Screen locker
xautolock \
    -locker "i3lock-fancy -- scrot -z" \
    -notify 30 \
    -time 30 \
    -notifier "notify-send -t 10000 xautolock 'Locking screen in 30 seconds.'" &
xss-lock -- i3lock-fancy -- scrot -z &

# Window Manager
exec i3
