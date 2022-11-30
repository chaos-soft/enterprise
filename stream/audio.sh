obs &
sleep 2s
pactl load-module module-combine-sink
pavucontrol &
sleep 2s
PIPEWIRE_LATENCY='128/48000' pw-jack carla ~/Documents/enterprise/stream/carla.carxp &
