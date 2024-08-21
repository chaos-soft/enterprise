# ffmpeg -i '/home/chaos/tmp/cinelerra/1.mp4' -i '/home/chaos/tmp/cinelerra/1a.mp4' -map 0:v -map 1:a -c copy -copyts '/mnt/xxx2/memory card/cinelerra/re4/1.mp4'
# ffmpeg -i '/mnt/polina/home/chaos/tmp/cinelerra/1.mp4' -map 0:a -c copy -copyts '/mnt/xxx2/memory card/cinelerra/re4/1.m4a'
# ffmpeg -i '/mnt/polina/tmp/2023-01-27 00-55-56.ts' -itsoffset 0.3 -i '/mnt/polina/tmp/2023-01-27 00-55-56.ts' -c copy -copyts -avoid_negative_ts make_zero -map 0:v -map 1:a '/mnt/polina/tmp/1.ts'
ffmpeg -i 'http://192.168.1.168/0.ts' -bsf:v h264_metadata=video_full_range_flag=1 -c copy "/mnt/alisa/tmp/`date +'%Y%m%d-%H%M%S'`.mp4"
# ffmpeg -re -ss 00:50:00 -i '/mnt/polina/tmp/2022-12-06 23-36-31.ts' -c copy -f flv 'rtmp://msk.goodgame.ru:1940/live/xxx'
# ffmpeg -ss 00:09:05 -to 00:10:10 -i 'xxx' -c copy -copyts -avoid_negative_ts make_zero '/mnt/polina/tmp/202205/1.ts'

ffmpeg -ss 00:48:25 -i '/mnt/polina/tmp/2023-03-30 23-54-42.ts' -to 00:49:30 -c copy -copyts -avoid_negative_ts make_zero '/mnt/polina/tmp/202303/ds3/1.ts'
