#!/bin/bash
pkill pipewire

if [[ $XDG_SESSION_TYPE = wayland ]]
then
    /usr/libexec/xfce-polkit &
else
    feh --bg-fill '/mnt/alisa/memory card/изображения/скриншоты/история/20210420-015850.png' &
    i3 &
    imwheel -k -b 45 &
    picom --no-vsync --unredir-if-possible --backend glx &
    setxkbmap -layout us,ru -option 'grp:caps_toggle,grp_led:scroll' &
    xinput set-prop 'HID 1d57:ad03 Mouse' 'libinput Accel Profile Enabled' 0, 1 &
    xinput set-prop 'HID 1d57:ad03 Mouse' 'libinput Accel Speed' -0.3 &
    xinput set-prop 'PixArt OpticalMouse' 'libinput Accel Profile Enabled' 0, 1 &
    xinput set-prop 'PixArt OpticalMouse' 'libinput Accel Speed' -0.3 &
    xinput set-prop 'USB Optical Mouse '  'libinput Accel Profile Enabled' 0, 1 &
    xinput set-prop 'USB Optical Mouse '  'libinput Accel Speed' -0.3 &
    xrandr --output HDMI-A-0 --set TearFree on &
    xset -dpms &
    xset s off &
fi

GTK_THEME=Adwaita:dark torbrowser-launcher &
pavucontrol &
pipewire &
~/Downloads/waterfox/waterfox &
