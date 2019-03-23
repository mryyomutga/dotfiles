# Last Change : Mon 17 Dec 2018 15:24:37.

# Input Method
setxkbmap -layout jp
setxkbmap -option ctrl:nocaps
# xrdb ~/.Xresources
xsetroot -cursor_name left_ptr

# Screen locker
xautolock \
    -locker ~/i3lock_script.sh \
    -notify 30                 \
    -time 30                   \
    -notifier "notify-send -t 10000 xautolock 'Locking screen in 30 seconds.'" &
xss-lock -- ~/i3lock_script.sh &

# Window Manager
exec i3
