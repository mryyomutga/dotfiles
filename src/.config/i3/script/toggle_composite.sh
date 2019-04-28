#!/bin/sh

retval=pgrep compton
if [ ! -n "$retval" ]; then
    pkill compton &
else
    compton -b --config $HOME/.config/compton/compton.conf
fi

exit 0
