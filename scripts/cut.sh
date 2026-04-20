#!/bin/bash
# ffmpeg -i '/mnt/alisa/memory card/cinelerra/sh2/hevc18-.mp4' -i '/mnt/alisa/memory card/cinelerra/hevc18.mp4' -map 0:v -map 1:a -c copy '/mnt/alisa/memory card/cinelerra/sh2/hevc18.mp4'
# ffmpeg -i '/mnt/polina/home/chaos/tmp/cinelerra/1.mp4' -map 0:a -c copy '/mnt/xxx2/memory card/cinelerra/re4/1.mp4'
ffmpeg -i 'http://192.168.1.168/0.ts' -c copy "/mnt/alisa/tmp/видео/$(date +%Y%m%d-%H%M%S).ts"

# ffmpeg -ss 00:17:00 -i '/mnt/alisa/tmp/видео/2026-02-22 00-03-50.ts' -to 00:18:40 -c copy -copyts -avoid_negative_ts make_zero '/mnt/xxx2/memory card/видео/стримы/нарезки/gta 4/20260222-000350-1.mp4'
