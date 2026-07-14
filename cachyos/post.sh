#!/bin/bash
rm -rf ~/.local/share/fonts
rm -rf ~/.local/share/icons
rm -rf ~/.local/share/xfce4
rm -rf ~/.themes

mkdir -p ~/.local/share/icons
mkdir -p ~/.local/share/xfce4/terminal/colorschemes

cp -rpn ~/Documents/Breeze_Contrast ~/.local/share/icons
cp -rpn ~/Documents/fonts           ~/.local/share
install -pDvm644 /usr/share/doc/mangohud/MangoHud.conf.example ~/.polina_backup/mnt__larka__games__tmp__mh
install -pDvm644 ~/Documents/enterprise/firefox/user.js        ~/.waterfox/l51y1kmf.default-release/user.js
install -pDvm644 ~/Documents/enterprise/fonts.conf             ~/.config/fontconfig/fonts.conf
install -pDvm644 ~/Documents/enterprise/gnome/gnome-shell.css  ~/.themes/xxx/gnome-shell/gnome-shell.css
install -pDvm644 ~/Documents/enterprise/gnome/gtk.css          ~/.config/gtk-3.0/gtk.css
install -pDvm644 ~/Documents/permissions.sqlite                ~/.waterfox/l51y1kmf.default-release/permissions.sqlite

curl -LJ -o ~/.local/share/xfce4/terminal/colorschemes/catppuccin-mocha.theme https://raw.githubusercontent.com/catppuccin/xfce4-terminal/refs/heads/main/themes/catppuccin-mocha.theme
curl -LJ -o ~/.polina_backup/home__chaos__.config__gtk-4.0__gtk.css           https://raw.githubusercontent.com/lassekongo83/adw-colors/refs/heads/main/themes/adw-nord/gtk4-dark.css
curl -LJ -o ~/.polina_backup/mnt__larka__games__tmp__vkBasalt.conf            https://raw.githubusercontent.com/DadSchoorse/vkBasalt/refs/heads/master/config/vkBasalt.conf

git clone --depth=1 -b bluish-accent https://github.com/EliverLara/Nordic.git ~/.themes/Nordic-bluish-accent

dconf reset -f /
dconf load / < ~/Documents/enterprise/gnome/dconf

xfconf-query -n -c displays          -p /Notify                       -t int    -s 0
xfconf-query -n -c keyboards         -p /Default/KeyRepeat/Delay      -t int    -s 200
xfconf-query -n -c keyboards         -p /Default/KeyRepeat/Rate       -t int    -s 25
xfconf-query -n -c xfce4-taskmanager -p /columns/column-uid           -t bool   -s true
xfconf-query -n -c xfce4-taskmanager -p /columns/sort-id              -t int    -s 6
xfconf-query -n -c xfce4-taskmanager -p /columns/sort-type            -t int    -s 1
xfconf-query -n -c xfce4-taskmanager -p /interface/full-command-line  -t bool   -s true
xfconf-query -n -c xfce4-taskmanager -p /interface/refresh-rate       -t int    -s 1000
xfconf-query -n -c xfce4-taskmanager -p /interface/show-all-processes -t bool   -s true
xfconf-query -n -c xfce4-taskmanager -p /prompt-terminate-task        -t bool   -s false
xfconf-query -n -c xfce4-terminal    -p /font-use-system              -t bool   -s true
xfconf-query -n -c xfce4-terminal    -p /misc-confirm-close           -t bool   -s false
xfconf-query -n -c xfwm4             -p /general/button_layout        -t string -s '|'
xfconf-query -n -c xsettings         -p /Gtk/ButtonImages             -t bool   -s false
xfconf-query -n -c xsettings         -p /Gtk/CursorThemeName          -t string -s Breeze_Contrast
xfconf-query -n -c xsettings         -p /Gtk/DecorationLayout         -t string -s ':'
xfconf-query -n -c xsettings         -p /Gtk/FontName                 -t string -s 'Sans 10.2'
xfconf-query -n -c xsettings         -p /Gtk/MonospaceFontName        -t string -s 'Monospace 10'
xfconf-query -n -c xsettings         -p /Net/IconThemeName            -t string -s Adwaita
xfconf-query -n -c xsettings         -p /Net/ThemeName                -t string -s Nordic-bluish-accent
xfconf-query -n -c xsettings         -p /Xft/DPI                      -t int    -s 96
xfconf-query -n -c xsettings         -p /Xft/HintStyle                -t string -s hintslight

xfconf-query -n -c pointers -p /HID_1d57ad03_Mouse/Acceleration                              -t double -s 4.000000
xfconf-query -n -c pointers -p /HID_1d57ad03_Mouse/Properties/libinput_Accel_Profile_Enabled -t int    -t int -t int -s 0 -s 1 -s 0
xfconf-query -n -c pointers -p /USB_OPTICAL_MOUSE/Acceleration                               -t double -s 8.000000
xfconf-query -n -c pointers -p /USB_OPTICAL_MOUSE/Properties/libinput_Accel_Profile_Enabled  -t int    -t int -t int -s 0 -s 1 -s 0

git config --global user.name  chaos-soft
git config --global user.email mail@57st.su
