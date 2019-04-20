#!/bin/sh

# old icon generating script
# Use Imagemagick
convert \
    -size 400x400 \
    xc:black -antialias \
    -fill none \
    -stroke '#2196f3' \
    -strokewidth 3 \
    -draw "path 'M 200,50 L 225,100 L 200,150 L 175,100 L 200,50 L 225,100'" \
    -draw "path 'M 200,75 L 212,100 L 200,125 L 188,100 L 200,75 L 212,100'" \
    -draw "path 'M 50,200 L 100,225 L 150,200 L 100,175 L 50,200 L 100,225'" \
    -draw "path 'M 75,200 L 100,212 L 125,200 L 100,188 L 75,200 L 100,212'" \
    -draw "path 'M 200,250 L 225,300 L 200,350 L 175,300 L 200,250 L 225,300'" \
    -draw "path 'M 200,275 L 212,300 L 200,325 L 188,300 L 200,275 L 212,300'" \
    -draw "path 'M 250,200 L 300,225 L 350,200 L 300,175 L 250,200 L 300,225'" \
    -draw "path 'M 275,200 L 300,212 L 325,200 L 300,188 L 275,200 L 300,212'" \
    -strokewidth 3 \
    -draw "circle 200,200 212,200" \
    -draw "circle 200,200 221,200" \
    ~/Pictures/icons/icon.png
