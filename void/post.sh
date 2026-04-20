#!/bin/bash
rm -rf ~/.local/share/fonts
rm -rf ~/.local/share/xfce4
rm -rf ~/.themes

mkdir -p ~/.local/share/xfce4/terminal/colorschemes
mkdir -p ~/.themes/xxx/xfwm4

cp -rpn ~/Documents/fonts ~/.local/share
install -pDvm644 /etc/sway/config                              ~/.polina_backup/home__chaos__.config__sway__config
install -pDvm644 /usr/share/doc/mangohud/MangoHud.conf.example ~/.polina_backup/mnt__larka__games__tmp__mh
install -pDvm644 ~/Documents/enterprise/eww/eww.scss           ~/.config/eww/eww.scss
install -pDvm644 ~/Documents/enterprise/eww/eww.yuck           ~/.config/eww/eww.yuck
install -pDvm644 ~/Documents/enterprise/firefox/user.js        ~/.waterfox/wgnire87.default-release/user.js
install -pDvm644 ~/Documents/enterprise/fonts.conf             ~/.config/fontconfig/fonts.conf
install -pDvm644 ~/Documents/enterprise/gnome/gnome-shell.css  ~/.themes/xxx/gnome-shell/gnome-shell.css
install -pDvm644 ~/Documents/enterprise/gnome/gtk.css          ~/.config/gtk-3.0/gtk.css
touch ~/.themes/xxx/xfwm4/themerc

curl -LJ -o ~/.local/share/xfce4/terminal/colorschemes/catppuccin-frappe.theme    https://raw.githubusercontent.com/catppuccin/xfce4-terminal/refs/heads/main/themes/catppuccin-frappe.theme
curl -LJ -o ~/.local/share/xfce4/terminal/colorschemes/catppuccin-latte.theme     https://raw.githubusercontent.com/catppuccin/xfce4-terminal/refs/heads/main/themes/catppuccin-latte.theme
curl -LJ -o ~/.local/share/xfce4/terminal/colorschemes/catppuccin-macchiato.theme https://raw.githubusercontent.com/catppuccin/xfce4-terminal/refs/heads/main/themes/catppuccin-macchiato.theme
curl -LJ -o ~/.local/share/xfce4/terminal/colorschemes/catppuccin-mocha.theme     https://raw.githubusercontent.com/catppuccin/xfce4-terminal/refs/heads/main/themes/catppuccin-mocha.theme
curl -LJ -o ~/.polina_backup/home__chaos__.config__gtk-4.0__gtk.css               https://raw.githubusercontent.com/lassekongo83/adw-colors/refs/heads/main/themes/adw-nord/gtk4-dark.css
curl -LJ -o ~/.polina_backup/mnt__larka__games__tmp__vkBasalt.conf                https://raw.githubusercontent.com/DadSchoorse/vkBasalt/refs/heads/master/config/vkBasalt.conf

git clone --depth=1 -b bluish-accent https://github.com/EliverLara/Nordic.git ~/.themes/Nordic-bluish-accent

dconf reset -f /
dconf load / < ~/Documents/enterprise/gnome/dconf

xfconf-query -n -c displays          -p /Notify                       -t int    -s 0
xfconf-query -n -c keyboards         -p /Default/KeyRepeat/Delay      -t int    -s 200
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

xfconf-query -n -c xfce4-desktop  -p /backdrop/screen0/monitorHDMI-A-0/workspace0/last-image -t string -s '/mnt/alisa/memory card/загрузки/изображения/заставки/181222___ho_ho_ho_by_zfirrr_dcv1sh5.jpg'
xfconf-query -n -c xfce4-desktop  -p /desktop-icons/style                                    -t int    -s 0
xfconf-query -n -c xfce4-terminal -p /misc-maximize-default                                  -t bool   -s true
xfconf-query -n -c xfwm4          -p /general/cycle_tabwin_mode                              -t int    -s 1
xfconf-query -n -c xfwm4          -p /general/easy_click                                     -t string -s Super
xfconf-query -n -c xfwm4          -p /general/theme                                          -t string -s xxx
xfconf-query -n -c xfwm4          -p /general/titleless_maximize                             -t bool   -s true
xfconf-query -n -c xfwm4          -p /general/use_compositing                                -t bool   -s false
xfconf-query -n -c xfwm4          -p /general/vblank_mode                                    -t string -s glx
xfconf-query -n -c xfwm4          -p /general/workspace_count                                -t int    -s 4
xfconf-query -n -c xfwm4          -p /general/workspace_names                                -t string -t string -t string -t string -s 1 -s 2 -s 3 -s 4

xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/<Primary>1'       -t string -s '/home/chaos/Documents/enterprise/scripts/rofi.py'
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/<Primary>2'       -t string -s 'rofi -show drun'
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/<Primary>3'       -t string -s '/home/chaos/Documents/enterprise/scripts/rofi_ds3.py'
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/<Primary>F10'     -t string -s 'amixer -q set Capture toggle'
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>a'         -t string -s "sh -c 'OBS_VKCAPTURE=1 ~/tmp/ariel/ariel.x86_64'"
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>Down'      -t string -s "sh -c 'xdotool mousemove 0 555 && xdotool click 5'"
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>Left'      -t string -s "sh -c 'xdotool mousemove 0 555 && xdotool click 4'"
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>Return'    -t string -s 'xfce4-terminal -e ranger'
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>Right'     -t string -s "sh -c 'xdotool mousemove 0 555 && xdotool click 5'"
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>Up'        -t string -s "sh -c 'xdotool mousemove 0 555 && xdotool click 4'"
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/AudioLowerVolume' -t string -s "sh -c 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'"
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/AudioMute'        -t string -s 'amixer -q set Master toggle'
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/AudioRaiseVolume' -t string -s "sh -c 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+'"
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/F10'              -t string -s 'amixer -q set Master toggle'
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/commands/custom/Print'            -t string -s "sh -c 'xfce4-screenshooter -f -s ~/Pictures/\$(date +%Y%m%d-%H%M%S).png'"

xfconf-query -n -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Shift><Alt>Left'  -t string -s move_window_left_key
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Shift><Alt>Right' -t string -s move_window_right_key
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Shift><Alt>Up'    -t string -s move_window_up_key
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>Tab'               -t string -s cycle_windows_key
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary>q'                 -t string -s close_window_key
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>KP_Begin'            -t string -s maximize_window_key
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>KP_Left'             -t string -s tile_left_key
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>KP_Right'            -t string -s tile_right_key
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>Page_Down'           -t string -s next_workspace_key
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>Page_Up'             -t string -s prev_workspace_key
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>f'                   -t string -s fullscreen_key
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>h'                   -t string -s hide_window_key
xfconf-query -n -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/override'                   -t bool   -s true

git config --global user.name  chaos-soft
git config --global user.email mail@57st.su
