#!/bin/bash
if [[ $XDG_SESSION_TYPE = x11 ]]
then
    if ! [[ $XDG_SESSION_DESKTOP = xfce ]]
    then
        feh --bg-fill '/home/chaos/Pictures/20210420-015850.png' &
        xfsettingsd &
    fi

    imwheel -k -b 45 &
    setxkbmap -layout us,ru -option 'grp:caps_toggle,grp_led:scroll' &
    xrandr --output HDMI-1 --set 'Colorspace' 'opRGB' &
    xset -dpms &
    xset s off &
    ~/Documents/enterprise/scripts/rofi.py -k picom &
else
    eww daemon &
    sleep 2
    eww open bar &
fi

sleep 2

if ! [[ $XDG_SESSION_DESKTOP = gnome ]]
then
    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
    ~/Documents/enterprise/scripts/rofi.py -k wiremix &
fi

MOZ_ENABLE_WAYLAND=1 waterfox &
