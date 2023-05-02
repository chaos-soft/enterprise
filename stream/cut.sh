# ffmpeg -i '/mnt/polina/tmp/2023-01-27 00-55-56.ts' -itsoffset 0.3 -i '/mnt/polina/tmp/2023-01-27 00-55-56.ts' -c copy -copyts -avoid_negative_ts make_zero -map 0:v -map 1:a '/mnt/polina/tmp/1.ts'
# ffmpeg -re -ss 00:50:00 -i '/mnt/polina/tmp/2022-12-06 23-36-31.ts' -c copy -f flv 'rtmp://msk.goodgame.ru:1940/live/xxx'
# ffmpeg -ss 00:09:05 -to 00:10:10 -i 'xxx' -c copy -copyts -avoid_negative_ts make_zero '/mnt/polina/tmp/202205/1.ts'

ffmpeg -ss 00:48:25 -i '/mnt/polina/tmp/2023-03-30 23-54-42.ts' -to 00:49:30 -c copy -copyts -avoid_negative_ts make_zero '/mnt/polina/tmp/202303/ds3/1.ts'
