pkill pipewire
sleep 1

pipewire &
pipewire-pulse &
xrandr --output HDMI-A-0 --set TearFree on
