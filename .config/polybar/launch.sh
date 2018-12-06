#!/bin/sh

# terminate already running bar instance
killall -q polybar

# Wait util the processes have been shutdown
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload main &
    done
else
    polybar --reload main &

fi

echo "Polybar launched..."

