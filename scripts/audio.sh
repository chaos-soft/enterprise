#!/bin/bash
pkill pw-loopback
sleep 2

pw-loopback -m '[FL FR]' --capture-props='media.class=Audio/Sink node.name=xxx' -n xxx &
sleep 2

PIPEWIRE_LATENCY='256/48000' pw-jack carla ~/Documents/enterprise/stream/carla.carxp &
PIPEWIRE_LATENCY='256/48000' pw-jack obs &
