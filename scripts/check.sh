clear

echo '__perm__'
find . ! -perm 644 -type f -o ! -perm 755 -type d | grep -v '/steam/'

echo '__user__'
find . ! -user $USER -o ! -group $USER

echo '__empty__'
find . -type d -empty -print | grep -v '/steam/'
