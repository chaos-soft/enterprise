find ~ ! -user $USER ! -group $USER ! -type l
find ~/.ssh ! -perm 644 -type f ! -perm 755 -type d
find ~/Documents ! -perm 644 -type f ! -perm 755 -type d
find ~/Downloads ! -perm 644 -type f ! -perm 755 -type d
find ~/Pictures ! -perm 644 -type f ! -perm 755 -type d
find ~/tmp ! -perm 644 -type f ! -perm 755 -type d

find /mnt/polina ! -user $USER ! -group $USER ! -type l
find /mnt/polina/games ! -perm 755 -type d ! -path '*/pfx/*' ! -path '*/steam/*'
find /mnt/polina/games ! -perm 755 -type f ! -perm 644 -type f ! -path '*/pfx/*' ! -path '*/steam/*'
find /mnt/polina/tmp ! -perm 755 -type d
find /mnt/polina/tmp ! -perm 755 -type f ! -perm 644 -type f
