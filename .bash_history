egrep --color -rI 'articles/[0-9]{1,}/[0-9]' .
grep --color -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp $'\r' .
grep --color -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp $'\t' .
grep --color -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp '  ' .
grep --color -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp '[[:alnum:]]  [[:alnum:]]' .
grep --color -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp '[[:blank:]]$' .
grep --color -rI --text 'HDR+' .
find . -newermt '2017-12-01 00:00:00' ! -newermt '2019-05-01 00:00:00'
find . -type d -print0 | xargs -0 chmod 0755
find . -type f -exec stat -c '%n %s %y' {} + | sort -k 1 > ~/Documents/hzd
find . -type f -print0 | xargs -0 chmod 0644
find . -type f -printf "mv '%f' %TY%Tm%Td-%TH%TM%TS.png\n" | sh
find . -type f -printf "mv '%f' %TY%Tm%Td-%TH%TM.png\n" | sh
find . -type f | egrep --color '[а-яА-Я]+'
find . \! -user $USER -o \! -group $USER
sudo find . -depth -name '.DS_Store' -print -delete
sudo find . -type d -empty -print -delete
GIT_ASKPASS= git push --all --dry-run origin
GTK_DEBUG=interactive gnome-clocks
WINEPREFIX='/mnt/polina/games/gta 5/pfx' ./wine winecfg
curl -X POST -d 'client_id=&client_secret=&grant_type=client_credentials&scope=chat:read' https://id.twitch.tv/oauth2/token
dconf dump / > ~/Documents/enterprise/dconf
diff -qr --exclude=.git --exclude=mariadb vv vv.old
gsettings get org.gnome.shell app-picker-layout
gsettings set org.gtk.Settings.Debug enable-inspector-keybinding true
identify -verbose ~/Downloads/181222___ho_ho_ho_by_zfirrr_dcv1sh5.jpg
ls -la --time-style=long-iso
sudo certbot certonly --manual --agree-tos -m xxx -d xxx --no-eff-email
sudo dd if=/dev/zero of=/dev/sdc bs=1M count=10
sudo mkdir -p .Trash-1000/{expunged,files,info} && sudo chown -R $USER:$USER .Trash-1000
sudo mkdir -p games tmp && sudo chown -R $USER:$USER games tmp
sudo netstat -tulpn
youtube-dl --skip-download https://www.youtube.com/watch?v=oSr3a6JLHUs
youtube-dl -f best --external-downloader curl https://www.youtube.com/watch?v=oSr3a6JLHUs
cd ~/Documents/python/miranda/ && docker-compose up
cd ~/Documents/python/velvet/ && docker-compose -f dc.nginx.yml up
cd ~/Documents/python/velvet/ && docker-compose up
docker exec -it vv_velvet_1 bash
docker images && docker network ls && docker ps -a
docker-compose -f dc.nginx.yml up
docker-compose exec -T db mysql -uroot -proot penny < sql
docker-compose exec velvet coverage report -m
docker-compose exec velvet coverage run --source='.' manage.py test blog bookmarks
docker-compose exec velvet python manage.py dumpdata blog.Article --indent 4 --pks 124
docker-compose exec velvet python manage.py generatehtml
docker-compose exec velvet python manage.py loaddata store/bookmarks.json
docker-compose restart velvet
docker-compose up
curl cheat.sh/python/list
nginx -c ~/Documents/enterprise/stream/nginx.conf
nginx -c ~/Documents/enterprise/stream/nginx.conf -s stop
sudo shutdown -h +60
~/Documents/enterprise/gta\ 5.sh
~/Documents/enterprise/stream/audio.sh
