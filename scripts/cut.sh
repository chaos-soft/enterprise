#!/bin/bash
# ffmpeg -i '/mnt/alisa/memory card/cinelerra/sh2/hevc18-.mp4' -i '/mnt/alisa/memory card/cinelerra/hevc18.mp4' -map 0:v -map 1:a -c copy '/mnt/alisa/memory card/cinelerra/sh2/hevc18.mp4'
# ffmpeg -i '/mnt/polina/home/chaos/tmp/cinelerra/1.mp4' -map 0:a -c copy '/mnt/xxx2/memory card/cinelerra/re4/1.mp4'
ffmpeg -i 'http://192.168.1.168/0.ts' -bsf:v hevc_metadata=video_full_range_flag=1 -c copy "/mnt/alisa/tmp/видео/$(date +%Y%m%d-%H%M%S).ts"

# ffmpeg -ss 00:09:20 -i '/mnt/alisa/tmp/видео/20250521-213016.ts' -to 00:11:25 -c copy -copyts -avoid_negative_ts make_zero '/mnt/larka/tmp/нарезки/2025/re3/b1.ts'
