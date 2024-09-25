find ~ ! -user $USER -o ! -group $USER
find ~/.ssh ! -perm 644 -type f -o ! -perm 755 -type d
find ~/Documents ! -perm 644 -type f -o ! -perm 755 -type d | grep -v '/.git/'
find ~/Downloads ! -perm 644 -type f -o ! -perm 755 -type d
find ~/Pictures ! -perm 644 -type f -o ! -perm 755 -type d
find ~/tmp ! -perm 644 -type f -o ! -perm 755 -type d
