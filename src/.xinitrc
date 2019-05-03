# Last Change : Fri 03 May 2019 03:02:35.

# Input Method
setxkbmap -layout jp
setxkbmap -option ctrl:nocaps
setxkbmap -option terminate:ctrl_alt_bksp

# xrdb ~/.Xresources
xsetroot -cursor_name left_ptr

# Screen locker (i3lock-color)
xautolock \
    -locker lock \
    -notify 30                 \
    -time 30                   \
    -notifier "notify-send -t 10000 xautolock 'Locking screen in 30 seconds.'" &
xss-lock -- lock &

# Window Manager
exec i3
