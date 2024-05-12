egrep --color -rI 'articles/[0-9]{1,}/[0-9]' .
grep --color -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp $'\r' .
grep --color -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp $'\t' .
grep --color -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp '  ' .
grep --color -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp '[[:alnum:]]  [[:alnum:]]' .
grep --color -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp '[[:blank:]]$' .
grep --color -rI --text 'HDR+' .

find . ! -perm 644 -type f -o ! -perm 755 -type d
find . ! -user $USER -o ! -group $USER
find . -newermt '2017-12-01 00:00:00' ! -newermt '2019-05-01 00:00:00'
find . -newermt '2023-05-01 00:00:00' ! -newermt '2023-11-01 00:00:00'
find . -type d -print0 | xargs -0 chmod 0755
find . -type f -exec stat -c '%n %s %y' {} + | sort -k 1 -fd > /mnt/larka/tmp/re3.txt.new
find . -type f -print0 | xargs -0 chmod 0644
find . -type f -printf "mv -i '%f' %TY%Tm%Td-%TH%TM%TS.png\n" | sh
find . -type f -printf "mv -i '%f' %TY%Tm%Td-%TH%TM.png\n" | sh
find . -type f | egrep --color '[а-яА-Я]+'
find ~ -type f -executable ! -path '*/Steam/*' ! -path '*/void-packages/*'
sudo find . -depth -name '.DS_Store' -print -delete
sudo find . -depth -name '__pycache__' -print -exec rm -rf {} +
sudo find . -type d -empty -print -delete

GIT_ASKPASS= git push --all --dry-run origin
GTK_DEBUG=interactive thunar
WINEPREFIX='/mnt/polina/games/pfx/pfx' ./wine winecfg
adb install -r xxx
adb shell pm list packages
adb uninstall xxx
dconf dump / > ~/tmp/dconf
diff -qr --exclude=.git --exclude=mariadb vv vv.old
git clone --branch dev https://github.com/chaos-soft/enterprise.git
gsettings get org.gnome.shell app-picker-layout
gsettings set org.gtk.Settings.Debug enable-inspector-keybinding true
identify -verbose ~/Downloads/181222___ho_ho_ho_by_zfirrr_dcv1sh5.jpg
ls -la --time-style=long-iso
scp -pr ~/Documents/python/velvet/store/api/articles/57.json polina:/root/python/velvet/store/api/articles/
sudo certbot certonly --manual --agree-tos -m xxx -d xxx --no-eff-email
ssh polina 'cd ~/python/miranda/ && docker compose -f dc.playwright.yml up -d'
ssh polina 'cd ~/python/miranda/ && docker compose up -d'
ssh polina 'cd ~/python/velvet/ && docker compose -f dc.nginx.yml restart'
sudo dd if=/dev/zero of=/dev/sdc bs=1M count=10
sudo dmesg | grep BAR
sudo mkdir -p .Trash-1000/{expunged,files,info} && sudo chown -R $USER:$USER .Trash-1000
sudo mkdir -p games tmp && sudo chown -R $USER:$USER games tmp
sudo netstat -tulpn
youtube-dl --skip-download https://www.youtube.com/watch?v=oSr3a6JLHUs
youtube-dl -f best --external-downloader curl https://www.youtube.com/watch?v=oSr3a6JLHUs
yt-dlp --no-mtime https://www.youtube.com/embed/45HMKmDuXEE

./xbps-src -a i686 pkg obs-vkcapture32
./xbps-src binary-bootstrap
./xbps-src pkg obs-vkcapture
git clone --depth=1 https://github.com/void-linux/void-packages.git
sudo xbps-install --repository=hostdir/binpkgs obs-vkcapture
sudo xbps-install --repository=hostdir/binpkgs/multilib/ obs-vkcapture32-32bit

sudo fstrim --fstab -v
sudo npm install standard --global
sudo vkpurge rm all
sudo xbps-install -Su
sudo xbps-install `cat ~/Documents/enterprise/void/install`
sudo xbps-install `cat ~/Documents/enterprise/void/multilib\ nonfree`
sudo xbps-reconfigure -f glibc-locales
sudo xbps-reconfigure -f linux6.6
sudo xbps-remove -oO
sudo xbps-remove `cat ~/Documents/enterprise/void/remove`
sudo ~/Documents/python/tools/polina.py rebuild

docker build -t miranda:20240328 .
docker builder prune
docker exec -it vv_velvet_1 bash
docker images && docker network ls && docker ps -a && docker volume list
docker save miranda | gzip > miranda.tar.gz
docker system df
docker-compose -f dc.nginx.yml up
docker-compose exec -T db mysql -uroot -proot velvet < sql
docker-compose exec -T db mysqldump -uroot -proot --skip-extended-insert velvet blog_article bookmarks_bookmark bookmarks_category finance_product > sql
docker-compose exec velvet coverage report -m
docker-compose exec velvet coverage run --source='.' manage.py test blog bookmarks
docker-compose exec velvet python manage.py dumpdata blog bookmarks finance --indent 4 -o store/backup.json && sudo chown -R $USER:$USER store/
docker-compose exec velvet python manage.py dumpdata blog.Article --indent 4 --pks 124
docker-compose exec velvet python manage.py generatejson && sudo chown -R $USER:$USER store/
docker-compose exec velvet python manage.py loaddata store/bookmarks.json
docker-compose restart velvet

curl -o sitemap.xml http://localhost/sitemap
curl cheat.sh/python/list
sudo ~/Documents/python/tools/shutdown.py 04:00
