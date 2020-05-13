xrandr --output HDMI-3 --set "Broadcast RGB" "Full"
apm update
xinput --list
xinput --list-props 12
sudo cp -rp /etc/nixos/enterprise.nix ~/Documents/
grep -r '[[:blank:]]$' .
grep -r $'\t' .
grep -r '  ' .
find . -type f -exec md5sum {} + | sort -k 2
sudo nixos-rebuild boot --upgrade
sudo nix-collect-garbage -d
flatpak update
gsettings set org.gnome.desktop.peripherals.keyboard delay 250
gsettings get org.gnome.desktop.input-sources xkb-options
gsettings set org.gnome.desktop.input-sources xkb-options "['terminate:ctrl_alt_bksp,grp_led:scroll']"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.valvesoftware.Steam
sudo flatpak override --filesystem=/mnt/games com.valvesoftware.Steam
cd '/mnt/games/games/steam/steamapps/common/Proton 5.0/dist/bin'
WINEPREFIX='/mnt/games/games/wine/gta 5/pfx/' steam-run ./wine winecfg
ln -s /home/chaos/Documents/linux/.bash_history .bash_history
ls -la
docker-compose exec velvet mysqldump -u root -proot velvet > velvet.sql
cat ~/Documents/python/xxx.csv | docker exec -i vv_velvet_1 python manage.py import
docker inspect miranda_python_1
docker attach vv_velvet_1
docker build -t velvet:20200302 .
docker-compose restart velvet
docker-compose up
docker-compose stop
docker rmi b5d878aba9ab
docker images
docker ps -a
docker network ls
docker-compose rm -f
journalctl -b CONTAINER_NAME=miranda_python_1 --all
python3 -m venv ~/Documents/python/vv/venv/
~/Documents/python/vv/venv/bin/pip install --no-cache-dir --upgrade -r requirements.txt
cat ~/Documents/python/xxx.sql | python3 mysqldump_to_csv.py > ~/Documents/python/xxx.csv
sudo find . -depth -name '.DS_Store' -print -delete
xinput --set-prop 12 'Device Accel Profile' 2
xinput --set-prop 12 'Device Accel Constant Deceleration' 2.2
sudo shutdown -c
sudo shutdown -h +90
MANGOHUD=1 flatpak run com.valvesoftware.Steam
cd '/mnt/games/games/steam/steamapps/common/Proton 5.0'
sh '/home/chaos/Documents/linux/gta 5.sh'
sudo cpupower frequency-set -g performance
sudo cpupower frequency-set -g powersave
