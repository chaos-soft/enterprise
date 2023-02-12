rm ~/.local/share/fonts

cp -rp ~/Documents/fonts ~/.local/share
install -pDvm644 ~/Documents/enterprise/.bash_history ~/.bash_history
install -pDvm644 ~/Documents/enterprise/fonts.conf ~/.config/fontconfig/fonts.conf
install -pDvm644 ~/Documents/enterprise/gnome/gnome-shell.css ~/.themes/xxx/gnome-shell/gnome-shell.css
install -pDvm644 ~/Documents/enterprise/gnome/gtk.css ~/.config/gtk-3.0/gtk.css
install -pDvm644 ~/Documents/enterprise/ssr/settings.conf ~/.ssr/settings.conf
install -pDvm644 ~/Documents/enterprise/user.js ~/.mozilla/firefox/pm1k1njk.default-default/user.js

sudo rm /var/service/bluetoothd
sudo rm /var/service/docker
sudo rm /var/service/gdm
sudo rm /var/service/lxdm
sudo rm /var/service/sshd

sudo ln -s /etc/sv/docker /var/service/
sudo ln -s /etc/sv/gdm /var/service/

sudo usermod -aG docker $USER

sudo install -pDvm644 /usr/share/doc/mangohud/MangoHud.conf.example ~/tmp/mh
sudo chown $USER:$USER ~/tmp/mh

dconf reset -f /
dconf load / < ~/Documents/enterprise/gnome/dconf
