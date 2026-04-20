#!/bin/bash
pkill pipewire

if ! [[ $XDG_SESSION_DESKTOP = gnome ]]
then
    /usr/libexec/xfce-polkit &
    ~/Documents/enterprise/scripts/rofi.py -k wiremix &
fi

pipewire &
sleep 2 && MOZ_ENABLE_WAYLAND=0 ~/Downloads/waterfox/waterfox &
xrdb -load ~/.Xresources &

if [[ $XDG_SESSION_TYPE = x11 ]]
then
    imwheel -k -b 45 &
    setxkbmap -layout us,ru -option 'grp:caps_toggle,grp_led:scroll' &
    xinput set-prop 'HID 1d57:ad03 Mouse' 'libinput Accel Profile Enabled' 0, 1 &
    xinput set-prop 'HID 1d57:ad03 Mouse' 'libinput Accel Speed' -0.3 &
    xinput set-prop 'PixArt OpticalMouse' 'libinput Accel Profile Enabled' 0, 1 &
    xinput set-prop 'PixArt OpticalMouse' 'libinput Accel Speed' -0.3 &
    xinput set-prop 'USB OPTICAL MOUSE'   'libinput Accel Profile Enabled' 0, 1 &
    xinput set-prop 'USB OPTICAL MOUSE'   'libinput Accel Speed' 0.5 &
    xinput set-prop 'USB Optical Mouse '  'libinput Accel Profile Enabled' 0, 1 &
    xinput set-prop 'USB Optical Mouse '  'libinput Accel Speed' -0.3 &
    xrandr --output HDMI-A-0 --set 'Colorspace' 'opRGB' &
    xset -dpms &
    xset r rate 200 25 &
    xset s off &
    ~/Documents/enterprise/scripts/rofi.py -k picom &

    if ! [[ $XDG_SESSION_DESKTOP = xfce ]]
    then
        feh --bg-fill '/mnt/alisa/memory card/загрузки/изображения/заставки/181222___ho_ho_ho_by_zfirrr_dcv1sh5.jpg' &
        xfsettingsd &
        i3
    fi
else
    eww daemon &
    sleep 2 && eww open bar &
fi
