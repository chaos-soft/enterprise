PIPEWIRE_LATENCY='128/48000' pw-jack calfjackhost &
PIPEWIRE_LATENCY='128/48000' pw-jack obs &
pavucontrol &
pw-loopback -m '[FL FR]' --capture-props='media.class=Audio/Sink node.name=xxx' &
