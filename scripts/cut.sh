#!/bin/bash
# ffmpeg -i '/home/chaos/tmp/cinelerra/1.mp4' -i '/home/chaos/tmp/cinelerra/1a.mp4' -map 0:v -map 1:a -c copy -copyts '/mnt/xxx2/memory card/cinelerra/re4/1.mp4'
# ffmpeg -i '/mnt/polina/home/chaos/tmp/cinelerra/1.mp4' -map 0:a -c copy -copyts '/mnt/xxx2/memory card/cinelerra/re4/1.m4a'
ffmpeg -i 'http://192.168.1.168/0.ts' -bsf:v h264_metadata=video_full_range_flag=1 -c copy "/mnt/alisa/tmp/видео/$(date +'%Y%m%d-%H%M%S').ts"

# ffmpeg -ss 00:06:40 -i '/mnt/alisa/tmp/видео/20240927-222738.ts' -to 00:09:00 -c copy -copyts '/mnt/alisa/tmp/видео/2024/rev/1.ts'
