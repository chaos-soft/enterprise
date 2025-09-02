#!/usr/bin/env python3
from subprocess import run
from urllib.parse import quote_plus
import sys

PROTONPATH = '~/.steam/root/compatibilitytools.d/GE-Proton10-10'

CURSOR = 'XCURSOR_THEME=Adwaita'
FIREJAIL = 'firejail --net=none --noprofile'
FSR = 'WINE_FULLSCREEN_FSR=1 WINE_FULLSCREEN_FSR_CUSTOM_MODE=1477x831'
GTK_DARK = 'GTK_THEME=Adwaita:dark'
MANGOHUD = 'MANGOHUD=1'
PFX_GTA = f'WINEPREFIX=/mnt/larka/games/pfx/gta GAMEID=0 PROTONPATH={PROTONPATH}'
PFX_SH2 = f'WINEPREFIX=/mnt/larka/games/pfx/sh2 GAMEID=0 PROTONPATH={PROTONPATH}'
UMU_RUN = '~/Downloads/umu/umu-run'
VKBASALT = 'ENABLE_VKBASALT=1'
XGCTS = 'xfconf-query -n -c xsettings -p /Gtk/CursorThemeSize -t int -s'
XGWSF = 'xfconf-query -n -c xsettings -p /Gdk/WindowScalingFactor -t int -s'

DRAKENSANG = '/mnt/larka/games/drakensang/drakensang.exe'
IJ = '/mnt/larka/games/Indiana Jones and the Great Circle/TheGreatCircle.exe'
MDE = '/mnt/larka/games/Mafia - Definitive Edition/mafiadefinitiveedition.exe'
SH2 = '/mnt/alisa/tmp/downloads/SILENT HILL 2/SHProto.exe'
TRX2 = '/mnt/larka/games/Tomb Raider IV-VI Remastered/tomb456.exe'

apps = {}
list_ = [
    'caja /mnt',
    'caja',
    'galculator',
    'gitg',
    'gnome-disks',
    'godot',
    'gthumb',
    'nautilus "/mnt/alisa/memory card/загрузки/видео"',
    'pavucontrol',
    'transmission-qt',
    'xfce4-taskmanager',
]
for v in list_:
    apps[v] = v

apps['audio.sh'] = '~/Documents/enterprise/scripts/audio.sh'
apps['blender'] = 'blender --python ~/Documents/python/2b/vse_generator.py'
apps['cinelerra'] = f'BC_FONT_SCALE=1.02 {CURSOR} ~/Downloads/squashfs-root/AppRun'
apps['cut.sh'] = 'xfce4-terminal -H -e ~/Documents/enterprise/scripts/cut.sh'
apps['duckstation'] = f'{MANGOHUD} {FIREJAIL} ~/Downloads/DuckStation-x64.AppImage'
apps['freetube'] = '~/Downloads/freetube.AppImage'
apps['gamma 1'] = 'xrandr --output HDMI-A-0 --gamma 1:1:1'
apps['gamma 1.2'] = 'xrandr --output HDMI-A-0 --gamma 1.2:1.2:1.2'
apps['m5l'] = 'xdotool type m5lNaA32B0SqnaPe2NjRS7r4VvBzoNVOemZ08oc2gzlHnU8r24ESMf1DZkvQ'
apps['scale 2k'] = f'xrandr --output HDMI-A-0 --panning 1920x1080 --scale-from 1920x1080 && {XGWSF} 1 && {XGCTS} 24'
apps['scale 4k'] = f'xrandr --output HDMI-A-0 --panning 3840x2160 --scale-from 3840x2160 && {XGWSF} 2 && {XGCTS} 48'
apps['ssh polina'] = 'xfce4-terminal -e "ssh -D localhost:9150 polina"'
apps['steam firejail'] = f'{FSR} {VKBASALT} {FIREJAIL} mangohud steam -console'
apps['steam'] = f'{FSR} {VKBASALT} mangohud steam -console'
apps['sublime_text'] = f'{FIREJAIL} /usr/lib/sublime_text/sublime_text'
apps['tor-browser'] = f'{GTK_DARK} ~/.local/share/torbrowser/tbb/x86_64/tor-browser/Browser/start-tor-browser'
apps['waterfox'] = '~/Downloads/waterfox/waterfox'
apps['xfce4-terminal'] = 'xfce4-terminal -e ranger'
apps['57'] = f'{apps['waterfox']} --new-tab https://57st.su/articles/57'

# apps['drakensang'] = f'{MANGOHUD} {VKBASALT} {PFX_GTA} {FIREJAIL} hwloc-bind l2:4-5 -- {UMU_RUN} "{DRAKENSANG}"'
# apps['h3'] = f'{MANGOHUD} {VKBASALT} {PFX_SH2} {FIREJAIL} {UMU_RUN} "/mnt/larka/games/Haydee 3/SteamGame.exe"'
# apps['sh2'] = f'{MANGOHUD} {FSR} {PFX_SH2} {FIREJAIL} {UMU_RUN} "{SH2}" -dx11'
# apps['vc'] = f'WINEDLLOVERRIDES=d3d9=n {MANGOHUD} {VKBASALT} {PFX_GTA} {FIREJAIL} {UMU_RUN} "{VC}"'
apps['ij'] = f'{MANGOHUD} {PFX_SH2} {FIREJAIL} {UMU_RUN} "{IJ}" +com_skipIntroVideo 1'
apps['mde'] = f'{MANGOHUD} {VKBASALT} {PFX_SH2} {FIREJAIL} {UMU_RUN} "{MDE}"'
apps['minetest'] = f'{CURSOR} mangohud minetest'
apps['modmanager'] = f'{PFX_SH2} {UMU_RUN} "/mnt/larka/games/modmanager/Modmanager.exe"'
apps['openmw'] = f'{FIREJAIL} mangohud openmw'
apps['trx2'] = f'Xpp_jimenezmlaa_color=8 {PFX_SH2} {FIREJAIL} {UMU_RUN} "{TRX2}" -nolegal'

apps = dict(sorted(apps.items()))

for v in ['poweroff', 'reboot', 'suspend']:
    apps[v] = f'loginctl {v}'

apps['timer'] = 'touch -m ~/tmp/tzj'

r = run(['rofi', '-dmenu', '-matching', 'prefix'], capture_output=True, input='\n'.join(apps.keys()).encode('utf-8'))
k = r.stdout.decode('utf-8').rstrip()
if k in apps:
    args = ['sh', '-c', apps[k]]
    print(run(args))
elif k:
    args = ['sh', '-c', f'{apps['waterfox']} --new-tab https://duckduckgo.com/?q={quote_plus(k)}']
    print(run(args))
else:
    print('empty')

sys.exit(0)
