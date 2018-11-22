#!/bin/sh

st_prev="disconnected"
while :
do
    st_next=$(cat /sys/class/drm/card0-DP-1/status)
    if [ $st_prev != $st_next ]; then
        st_prev=$st_next
        if [ $st_next = "connected" ]; then
            xrandr --output eDP1 --auto --output DP1 --auto
        else
            xrandr --output eDP1 --auto --output DP1 --off --left-of eDP1
        fi
    ~/.fehbg
    fi
    sleep 1
done
