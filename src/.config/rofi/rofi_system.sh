#!/bin/sh

declare -A list=(
    ['Lock']='dm-tool lock'
    ['Logout']='i3-msg exit'
    ['Poweroff']='systemctl poweroff'
    ['Reboot']='systemctl reboot'
)

[[ -n $1 ]] && eval ${list[$1]} || echo ${!list[@]} | sed 's/ /\n/g'
