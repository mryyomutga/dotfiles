#!/bin/sh

BASE='#2196f3bb'
BLACK='#00000000'
GREEN='#21f396bb'
TEXT='#2196f3ee'
WRONG='#ff4079bb'
DELETE='#f0a576bb'

i3lock \
    --insidevercolor=$BLACK   \
    --ringvercolor=$BASE      \
    --insidewrongcolor=$BLACK \
    --insidecolor=$BLACK      \
    --ringcolor=$BASE         \
    --linecolor=$BLACK        \
    --ringwrongcolor=$WRONG   \
    --separatorcolor=$GREEN   \
    --verifcolor=$TEXT        \
    --wrongcolor=$WRONG       \
    --timecolor=$TEXT         \
    --datecolor=$TEXT         \
    --layoutcolor=$TEXT       \
    --keyhlcolor=$GREEN       \
    --bshlcolor=$GREEN        \
    --screen 1                \
    --clock                   \
    --indicator               \
    --timestr="%H:%M:%S"      \
    --datestr="%A, %m %Y"     \
    --keylayout 1             \
    --image ~/.local/share/i3/lockscreen.png