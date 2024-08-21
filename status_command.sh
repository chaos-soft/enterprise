if [ -f ~/tmp/tzj ]; then
    x=$(( $(date +'%s') - $(date +'%s' -r ~/tmp/tzj) ))
    y=$(( x / 60 ))
else
    y=''
fi

echo \
    $y \
    $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d ' ' -s -f 2,3) \
    $(cat /sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon1/temp1_input) \
    $(date +'%A, %Y-%m-%d %H:%M')
