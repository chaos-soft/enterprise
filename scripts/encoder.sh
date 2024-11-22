ffmpeg \
    -loglevel quiet -stats \
    -i srt://192.168.1.168:9000  \
    -c copy \
    -f flv rtmp://msk.goodgame.ru:1940/live/xxx \
    -c copy \
    /mnt/polina/tmp/encoder.ts
