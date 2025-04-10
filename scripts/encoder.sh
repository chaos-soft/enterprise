#!/bin/bash
ffmpeg \
    -loglevel quiet -stats \
    -i http://192.168.1.168/0.ts \
    -bsf:v h264_metadata=video_full_range_flag=1 -c copy -f flv xxx \
    -bsf:v h264_metadata=video_full_range_flag=1 -c copy "/mnt/alisa/tmp/видео/$(date +'%Y%m%d-%H%M%S').ts"
