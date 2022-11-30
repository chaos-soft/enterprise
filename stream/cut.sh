# ffmpeg -ss 00:09:05 -to 00:10:10 -i 'https://dgeft87wbj63p.cloudfront.net/9381798ea892766f60dd_chaos_soft_39943837816_1665688338/chunked/index-dvr.m3u8' -c copy -copyts -avoid_negative_ts make_zero '/mnt/polina/tmp/202205/1.mp4'
ffmpeg -ss 00:15:45 -i '/mnt/polina/tmp/20220511-0223.ts' -to 00:16:40 -c copy -copyts -avoid_negative_ts make_zero '/mnt/polina/tmp/202205/1.mp4'
