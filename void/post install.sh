rm -r ~/.local/share/fonts

cp -rp ~/Documents/fonts ~/.local/share
install -pDvm644 /etc/sway/config ~/Documents/python/tools/backup/home__chaos__.config__sway__config
install -pDvm644 /usr/share/doc/mangohud/MangoHud.conf.example ~/Documents/python/tools/backup/home__chaos__tmp__mh
install -pDvm644 /usr/share/vulkan/implicit_layer.d/MangoHud.x86_64.json ~/Documents/python/tools/backup/usr__share__vulkan__implicit_layer.d__MangoHud.x86.json
install -pDvm644 ~/Documents/enterprise/fonts.conf ~/.config/fontconfig/fonts.conf
install -pDvm644 ~/Documents/enterprise/gnome/gnome-shell.css ~/.themes/xxx/gnome-shell/gnome-shell.css
install -pDvm644 ~/Documents/enterprise/gnome/gtk.css ~/.config/gtk-3.0/gtk.css
install -pDvm644 ~/Documents/enterprise/sublime\ text/Default\ Dark.sublime-theme ~/.config/sublime-text/Packages/User/Default.sublime-theme
install -pDvm644 ~/Documents/enterprise/sublime\ text/Default\ Dark.sublime-theme ~/.config/sublime-text/Packages/User/Default\ Dark.sublime-theme
install -pDvm644 ~/Documents/enterprise/sublime\ text/Mariana.sublime-color-scheme ~/.config/sublime-text/Packages/User/Mariana.sublime-color-scheme
install -pDvm644 ~/Documents/enterprise/sublime\ text/One\ Light.sublime-color-scheme ~/.config/sublime-text/Packages/User/One\ Light.sublime-color-scheme
install -pDvm644 ~/Documents/enterprise/sublime\ text/Preferences.sublime-settings ~/.config/sublime-text/Packages/User/Preferences.sublime-settings
install -pDvm644 ~/Documents/enterprise/sublime\ text/SublimeLinter.sublime-settings ~/.config/sublime-text/Packages/User/SublimeLinter.sublime-settings
install -pDvm644 ~/Documents/enterprise/firefox/user.js ~/.mozilla/firefox/u6fiijcb.default-default/user.js
install -pDvm644 ~/Documents/enterprise/xfce4-taskmanager.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-taskmanager.xml

sudo rm /var/service/docker
sudo rm /var/service/gdm
sudo rm /var/service/lightdm
sudo rm /var/service/sshd
sudo rm /var/service/zramen

sudo ln -s /etc/sv/docker /var/service/
sudo ln -s /etc/sv/gdm /var/service/
sudo ln -s /etc/sv/zramen /var/service/

sudo usermod -aG docker $USER

curl -LJ -o ~/Documents/python/tools/backup/home__chaos__.config__gtk-4.0__gtk.css https://raw.githubusercontent.com/lassekongo83/adw-colors/main/themes/nord/gtk.css
curl -LJ -o ~/Documents/python/tools/backup/home__chaos__tmp__vkBasalt.conf https://raw.githubusercontent.com/DadSchoorse/vkBasalt/master/config/vkBasalt.conf

dconf reset -f /
dconf load / < ~/Documents/enterprise/gnome/dconf
