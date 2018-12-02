#!/bin/sh

# terminate already running bar instance
killall -q polybar

# Wait util the processes have been shutdown
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar top &

echo "Polybar launched..."

