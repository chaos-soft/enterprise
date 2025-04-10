#!/bin/bash
pkill pipewire

GTK_THEME=Adwaita:dark torbrowser-launcher &
feh --bg-fill ~/Pictures/20210420-015850.png &
i3 &
picom --vsync --unredir-if-possible --backend glx &
pipewire &
setxkbmap -layout us,ru -option 'grp:caps_toggle,grp_led:scroll' &
sleep 3 && corectrl &
xinput set-prop 'HID 1d57:ad03 Mouse' 'libinput Accel Profile Enabled' 0, 1 &
xinput set-prop 'HID 1d57:ad03 Mouse' 'libinput Accel Speed' -0.3 &
xinput set-prop 'PixArt OpticalMouse' 'libinput Accel Profile Enabled' 0, 1 &
xinput set-prop 'PixArt OpticalMouse' 'libinput Accel Speed' -0.3 &
xrandr --output HDMI-A-0 --set TearFree on &
xset -dpms &
xset s off &
~/Downloads/waterfox/waterfox &
