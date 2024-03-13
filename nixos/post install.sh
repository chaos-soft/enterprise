rm -r ~/.local/share/fonts

cp -rp ~/Documents/fonts ~/.local/share
install -pDvm644 ~/Documents/enterprise/fonts.conf ~/.config/fontconfig/fonts.conf
install -pDvm644 ~/Documents/enterprise/gnome/gnome-shell.css ~/.themes/xxx/gnome-shell/gnome-shell.css
install -pDvm644 ~/Documents/enterprise/gnome/gtk.css ~/.config/gtk-3.0/gtk.css
install -pDvm644 ~/Documents/enterprise/Preferences.sublime-settings ~/.config/sublime-text/Packages/User/Preferences.sublime-settings
install -pDvm644 ~/Documents/enterprise/SublimeLinter.sublime-settings ~/.config/sublime-text/Packages/User/SublimeLinter.sublime-settings
install -pDvm644 ~/Documents/enterprise/user.js ~/.mozilla/firefox/q3qjdlqd.default/user.js

sudo install -pDvm644 /run/current-system/sw/share/doc/mangohud/MangoHud.conf.example ~/tmp/mh
sudo chown -R $USER:users ~/tmp/mh

curl -LJ -o ~/tmp/vkBasalt.conf https://raw.githubusercontent.com/DadSchoorse/vkBasalt/master/config/vkBasalt.conf

dconf reset -f /
dconf load / < ~/Documents/enterprise/gnome/dconf
