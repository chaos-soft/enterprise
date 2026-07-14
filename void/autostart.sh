#!/bin/bash
pkill pipewire
exo-open /usr/share/applications/pipewire.desktop &

if [[ $XDG_SESSION_TYPE = x11 ]]
then
    if ! [[ $XDG_SESSION_DESKTOP = xfce ]]
    then
        feh --bg-fill "$HOME/Pictures/20210420-015850.png" &
        xfsettingsd &
    fi

    exo-open $HOME/.local/share/applications/qdre.desktop &
    imwheel -k -b 45 &
    setxkbmap -layout us,ru -option "grp:caps_toggle,grp_led:scroll" &
    xrandr --output HDMI-A-0 --set "Colorspace" "opRGB" &
    xset -dpms &
    xset s off &
else
    eww daemon &
    sleep 2
    eww open bar &
fi

sleep 2
/usr/libexec/xfce-polkit &
exo-open $HOME/.local/share/applications/waterfox.desktop &
exo-open /usr/share/applications/wiremix.desktop &
