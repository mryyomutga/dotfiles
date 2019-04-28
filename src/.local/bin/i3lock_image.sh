#!/bin/sh
mkdir ~/.local/share/i3/lockscreen.svg
cat <<EOF >~/.local/share/i3/lockscreen.svg
<svg viewBox="0 0 1920 1080" xmlns="http://www.w3.org/2000/svg">
  <rect width="100%" height="100%"/>
  <circle cx="960" cy="540" r="200" fill="none" stroke="#2196f3" stroke-width="10"/>
</svg>
EOF
convert ~/.local/share/i3/lockscreen.svg ~/.local/share/i3/lockscreen.png
