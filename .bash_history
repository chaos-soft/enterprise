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
find . -type f -exec stat -c '%n %s %y' {} + | sort -k 1 -fd > /mnt/larka/tmp/игры/xxx.txt
find . -type f -print0 | xargs -0 chmod 0644
find . -type f -printf "mv -i '%f' %TY%Tm%Td-%TH%TM%TS.png\n" | sh
find . -type f -printf "mv -i '%f' %TY%Tm%Td-%TH%TM.png\n" | sh
find . -type f -printf 'magick -quality 85 "%f" "%f".jpg\n' | sh
find . -type f | egrep --color '[а-яА-Я]+'
find ~ -type f -executable ! -path '*/Steam/*' ! -path '*/void-packages/*'
sudo find . -depth -name *__pycache__* -print -exec rm -rf {} +
sudo find . -type d -empty -print -delete

GIT_ASKPASS= git push --all --dry-run origin
GTK_DEBUG=interactive thunar
WINEPREFIX='/mnt/polina/games/pfx/pfx' ./wine64 winecfg
adb install -r xxx
adb shell pm list packages
adb uninstall xxx
curl -LOJ --socks5 127.0.0.1:9150 xxx
dconf dump / > ~/tmp/dconf
diff -qr --exclude=.git --exclude=mariadb vv vv.old
gd '/mnt/larka/tmp/игры/xxx.txt' <(find . -type f -exec stat -c '%n %s %y' {} + | sort -k 1 -fd)
gd polina.json <(sort_json.py polina.json)
git clone --branch dev https://github.com/chaos-soft/enterprise.git
gsettings get org.gnome.shell app-picker-layout
gsettings set org.gtk.Settings.Debug enable-inspector-keybinding true
identify -verbose ~/Downloads/181222___ho_ho_ho_by_zfirrr_dcv1sh5.jpg
ls -la --time-style=long-iso
magick xxx.jpg                             -crop 2000x2000+590+1100 +repage -strip -quality 85 xxx.jpg
magick xxx.jpg -gravity Center -rotate -90 -crop 3024x2800+0+0      +repage -strip -quality 85 xxx.jpg
nmap -A -T4 localhost
npm create vite@latest
ssh polina 'cd ~/python/miranda/ && docker compose -f dc.playwright.yml up -d'
ssh polina 'cd ~/python/miranda/ && docker compose up -d'
ssh polina 'cd ~/python/velvet/ && docker compose -f dc.nginx.yml restart'
sudo certbot certonly --manual --agree-tos -m xxx -d xxx --no-eff-email
sudo dd if=/dev/zero of=/dev/sdc bs=1M count=10
sudo dmesg | grep BAR
sudo mkdir -p .Trash-1000/{expunged,files,info} && sudo chown -R $USER:$USER .Trash-1000
sudo mkdir -p games tmp && sudo chown -R $USER:$USER games tmp
sudo netstat -tulpn
sudo tar --exclude=./lost+found -zcf ~/tmp/void.tar.gz .
sudo tar -xzvf ~/tmp/void.tar.gz
youtube-dl --skip-download https://www.youtube.com/watch?v=oSr3a6JLHUs
youtube-dl -f best --external-downloader curl https://www.youtube.com/watch?v=oSr3a6JLHUs
~/Downloads/yt-dlp_linux --no-mtime --proxy socks5://127.0.0.1:9150 https://www.youtube.com/embed/45HMKmDuXEE
~/Downloads/yt-dlp_linux --no-mtime https://www.youtube.com/embed/45HMKmDuXEE

./xbps-src -a i686 pkg obs-vkcapture32
./xbps-src binary-bootstrap
./xbps-src pkg obs-vkcapture
git clone --depth=1 https://github.com/void-linux/void-packages.git
sudo xbps-install --repository=hostdir/binpkgs obs-vkcapture
sudo xbps-install --repository=hostdir/binpkgs/multilib/ obs-vkcapture32-32bit

fstrim --fstab -v
npm install standard
vkpurge rm all
xbps-install $(cat /home/chaos/Documents/enterprise/void/install)
xbps-install $(cat /home/chaos/Documents/enterprise/void/multilib\ nonfree)
xbps-install -Su
xbps-query -s gamemode
xbps-reconfigure -f glibc-locales
xbps-reconfigure -f linux6.12
xbps-remove $(cat /home/chaos/Documents/enterprise/void/remove)
xbps-remove -oO

dc -f dc.nginx.yml up
dc exec -T db mysql -uroot -proot velvet < sql
dc exec -T db mysqldump -uroot -proot --skip-extended-insert velvet blog_article bookmarks_bookmark bookmarks_category finance_product > sql
dc exec velvet coverage report -m
dc exec velvet coverage run --source='.' manage.py test blog bookmarks
dc exec velvet python manage.py dumpdata blog bookmarks finance --indent 4 -o store/backup.json && sudo chown -R $USER:$USER store/
dc exec velvet python manage.py dumpdata blog.Article --indent 4 --pks 124
dc exec velvet python manage.py loaddata store/backup.json
dc restart velvet
docker build -t miranda:20240328 .
docker builder prune
docker exec -it vv_velvet_1 bash
docker images && docker network ls && docker ps -a && docker volume list
docker save miranda | gzip > miranda.tar.gz
docker system df

curl cheat.sh/python
