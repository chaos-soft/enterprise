grep -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp '  ' .
grep -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp '[[:alnum:]]  [[:alnum:]]' .
grep -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp '[[:blank:]]$' .
grep -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp $'\r' .
grep -rI --exclude-dir=.git --exclude-dir=mariadb --exclude-dir=tmp $'\t' .
sudo dd if=/dev/zero of=/dev/sdc bs=1M count=10
gsettings get org.gnome.shell app-picker-layout
identify -verbose ~/Downloads/181222___ho_ho_ho_by_zfirrr_dcv1sh5.jpg
find . -type f -exec stat -c '%n %s %y' {} + | sort -k 1 > ~/Documents/hzd
find . -type f -printf "mv '%f' %TY%Tm%Td-%TH%TM.png\n" | sh
find . -type f -printf "mv '%f' %TY%Tm%Td-%TH%TM%TS.png\n" | sh
find . \! -group users -o \! -user chaos
sudo find . -depth -name '.DS_Store' -print -delete
sudo find . -type d -empty -print -delete
diff -qr --exclude=.git --exclude=mariadb vv vv.tmp
curl -X POST -d 'client_id=&client_secret=&grant_type=client_credentials' https://id.twitch.tv/oauth2/token
sudo mkdir games && sudo chown -R chaos:users games
dconf dump / > ~/Documents/enterprise/dconf
sudo nginx
git push --all --dry-run origin
docker exec -it vv_velvet_1 bash
docker images && docker network ls && docker ps -a
docker-compose exec velvet coverage report -m
docker-compose exec velvet coverage run --source='.' manage.py test blog bookmarks
docker-compose exec velvet python manage.py createsuperuser
docker-compose exec velvet python manage.py dumpdata blog.Article --indent 4 --pks 124
docker-compose exec velvet python manage.py loaddata store/bookmarks.json
docker-compose restart velvet
docker-compose up
cd ~/Documents/python/miranda/
cd ~/Documents/python/velvet/
cd ~/Documents/stream && sh audio.sh
sudo shutdown -h +60
sudo shutdown -c
