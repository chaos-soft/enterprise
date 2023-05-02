pkill pw-loopback
sleep 2

obs &
pavucontrol &
pw-loopback -m '[FL FR]' --capture-props='media.class=Audio/Sink node.name=xxx' -n xxx &
sleep 2

pactl set-default-sink xxx
PIPEWIRE_LATENCY='128/48000' pw-jack carla ~/Documents/enterprise/stream/carla.carxp &
