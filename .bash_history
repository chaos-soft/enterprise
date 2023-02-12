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
find . -type f -printf "mv -i '%f' %TY%Tm%Td-%TH%TM%TS.png\n" | sh
find . -type f -printf "mv -i '%f' %TY%Tm%Td-%TH%TM.png\n" | sh
find . -type f | egrep --color '[а-яА-Я]+'
find . \! -user $USER -o \! -group $USER
find ~ -type f -executable ! -path '*/Steam/*' ! -path '*/void-packages/*'
sudo find . -depth -name '.DS_Store' -print -delete
sudo find . -type d -empty -print -delete

GIT_ASKPASS= git push --all --dry-run origin
GTK_DEBUG=interactive thunar
WINEDLLOVERRIDES=ddraw=n,b %command%
WINEPREFIX='/mnt/polina/games/gta 5/pfx' ./wine winecfg
adb install NetGuard-v2.300-release.apk
cat /proc/driver/nvidia/params
curl -X POST -d 'client_id=&client_secret=&grant_type=client_credentials&scope=chat:read' https://id.twitch.tv/oauth2/token > twitch.json
dconf dump / > ~/Documents/enterprise/dconf
diff -qr --exclude=.git --exclude=mariadb vv vv.old
gsettings get org.gnome.shell app-picker-layout
gsettings set org.gtk.Settings.Debug enable-inspector-keybinding true
identify -verbose ~/Downloads/181222___ho_ho_ho_by_zfirrr_dcv1sh5.jpg
ls -la --time-style=long-iso
python3 -m venv ~/tmp/miranda
scp -pr ~/Documents/python/miranda/app/twitch.py root@xxx:/root/python/miranda/app/
ssh root@xxx 'cd ~/python/miranda/ && docker-compose up -d'
sudo certbot certonly --manual --agree-tos -m xxx -d xxx --no-eff-email
sudo dd if=/dev/zero of=/dev/sdc bs=1M count=10
sudo dmesg | grep BAR
sudo mkdir -p .Trash-1000/{expunged,files,info} && sudo chown -R $USER:$USER .Trash-1000
sudo mkdir -p games tmp && sudo chown -R $USER:$USER games tmp
sudo netstat -tulpn
sudo sh -c 'echo 0 > /sys/bus/usb/devices/usb1/authorized && echo 1 > /sys/bus/usb/devices/usb1/authorized'
youtube-dl --skip-download https://www.youtube.com/watch?v=oSr3a6JLHUs
youtube-dl -f best --external-downloader curl https://www.youtube.com/watch?v=oSr3a6JLHUs

./xbps-src -a i686 pkg obs-vkcapture32
./xbps-src binary-bootstrap
./xbps-src pkg obs-vkcapture
git clone --depth=1 https://github.com/void-linux/void-packages.git
sudo xbps-install --repository=hostdir/binpkgs obs-vkcapture
sudo xbps-install --repository=hostdir/binpkgs/multilib/ obs-vkcapture32-32bit

./mangohud-setup.sh install
sudo fstrim --fstab -v
sudo vkpurge rm all
sudo xbps-reconfigure -f glibc-locales
sudo xbps-reconfigure -f linux6.1
sudo ~/Documents/python/tools/polina.py rebuild

cd ~/Documents/python/miranda/ && docker-compose up
cd ~/Documents/python/velvet/ && docker-compose -f dc.nginx.yml up
cd ~/Documents/python/velvet/ && docker-compose up
docker exec -it vv_velvet_1 bash
docker images && docker network ls && docker ps -a && docker volume list
docker save --output miranda.tar miranda
docker-compose -f dc.nginx.yml up
docker-compose exec -T db mysql -uroot -proot penny < sql
docker-compose exec velvet coverage report -m
docker-compose exec velvet coverage run --source='.' manage.py test blog bookmarks
docker-compose exec velvet python manage.py dumpdata --indent 4 -o backup.json && sudo chown -R $USER:$USER backup.json
docker-compose exec velvet python manage.py dumpdata blog.Article --indent 4 --pks 124
docker-compose exec velvet python manage.py generatehtml && sudo chown -R $USER:$USER store/html/
docker-compose exec velvet python manage.py loaddata store/bookmarks.json
docker-compose restart velvet
docker-compose up

WINEDLLOVERRIDES=winedbg.exe=d VK_INSTANCE_LAYERS=VK_LAYER_VKBASALT_post_processing:VK_LAYER_MANGOHUD_overlay steam
WINEDLLOVERRIDES=wininet=d VK_INSTANCE_LAYERS=VK_LAYER_VKBASALT_post_processing:VK_LAYER_MANGOHUD_overlay steam
curl cheat.sh/python/list
npm run dev
~/tmp/miranda/bin/python ~/Documents/python/miranda/app/miranda.py && echo $?
sudo ~/Documents/python/tools/shutdown.py 04:00
