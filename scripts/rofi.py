#!/usr/bin/env python3
from pathlib import Path
from subprocess import PIPE, Popen, run
from urllib.parse import quote_plus
import sys

CURSOR = 'XCURSOR_THEME=Adwaita'
FIREJAIL = 'firejail --net=none --noprofile'
FSR = 'WINE_FULLSCREEN_FSR=1 WINE_FULLSCREEN_FSR_CUSTOM_MODE=1477x831'
GTK_DARK = 'GTK_THEME=Adwaita:dark'
HOME = Path.home()
MANGOHUD = 'MANGOHUD=1'
PROTONPATH = f'{HOME}/Downloads/GE-Proton9-26'
UMU_GTA = f'WINEPREFIX=/mnt/larka/games/pfx/gta GAMEID=0 PROTONPATH={PROTONPATH}'
UMU_RUN = f'{HOME}/Downloads/umu/umu-run'
UMU_SH2 = f'WINEPREFIX=/mnt/larka/games/pfx/sh2 GAMEID=0 PROTONPATH={PROTONPATH}'
VKBASALT = 'ENABLE_VKBASALT=1'

DRAKENSANG = '/mnt/larka/games/drakensang/drakensang.exe'
DS3 = '/mnt/larka/games/ds3/Game/DarkSoulsIII.exe'
SH2 = '/mnt/alisa/tmp/downloads/SILENT HILL 2/SHProto.exe'
TRX2 = '/mnt/larka/games/Tomb Raider IV-VI Remastered/tomb456.exe'
VC = '/mnt/larka/games/GTA Vice City Nextgen Edition/LaunchGTAIV.exe'

apps = {}
list_ = [
    'caja /mnt',
    'caja',
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

# apps['ariel'] = f'{HOME}/tmp/bin/ariel.sh'
# apps['minetest'] = f'{CURSOR} mangohud minetest'
# apps['print'] = f'xfce4-screenshooter -f -s {HOME}/Pictures/$(date +"%Y%m%d-%H%M%S").png'
# apps['steam'] = f'{MANGOHUD} {FIREJAIL} steam'
apps['blender'] = f'blender --python {HOME}/Documents/python/2b/vse_generator.py'
apps['cinelerra'] = f'BC_FONT_SCALE=1.02 {CURSOR} {HOME}/Downloads/cinelerra.AppImage'
apps['duckstation'] = f'{MANGOHUD} {FIREJAIL} {HOME}/Downloads/DuckStation-x64.AppImage'
apps['freetube'] = f'{HOME}/Downloads/freetube.AppImage'
apps['gamma 1'] = 'xrandr --output HDMI-A-0 --gamma 1:1:1'
apps['gamma 1.2'] = 'xrandr --output HDMI-A-0 --gamma 1.2:1.2:1.2'
apps['polina'] = 'xfce4-terminal -e "ssh -D localhost:9150 polina"'
apps['sublime_text'] = f'{FIREJAIL} /usr/lib/sublime_text/sublime_text'
apps['torbrowser-launcher'] = f'{GTK_DARK} torbrowser-launcher'
apps['waterfox'] = f'{HOME}/Downloads/waterfox/waterfox'
apps['xfce4-terminal'] = 'xfce4-terminal -e ranger'
apps['57'] = f'{apps['waterfox']} --new-tab https://57st.su/articles/57'

apps = dict(sorted(apps.items()))

apps['drakensang'] = f'{MANGOHUD} {VKBASALT} {UMU_GTA} {FIREJAIL} hwloc-bind l2:4-5 -- {UMU_RUN} "{DRAKENSANG}"'
apps['ds3'] = f'{MANGOHUD} {VKBASALT} {UMU_SH2} {FIREJAIL} {UMU_RUN} "{DS3}"'
apps['h3'] = f'{MANGOHUD} {VKBASALT} {UMU_SH2} {FIREJAIL} {UMU_RUN} "/mnt/larka/games/Haydee 3/SteamGame.exe"'
apps['sh2'] = f'{MANGOHUD} {FSR} {UMU_SH2} {FIREJAIL} {UMU_RUN} "{SH2}" -dx11'
apps['trx2'] = f'pp_jimenezmlaa_color=8 {MANGOHUD} {VKBASALT} {UMU_SH2} {FIREJAIL} {UMU_RUN} "{TRX2}"'
apps['vc'] = f'WINEDLLOVERRIDES=d3d9=n {MANGOHUD} {VKBASALT} {UMU_GTA} {FIREJAIL} {UMU_RUN} "{VC}"'

for v in ['poweroff', 'reboot', 'suspend']:
    apps[v] = f'loginctl {v}'

apps['timer'] = f'touch -m {HOME}/tmp/tzj'

with Popen(['echo', '-n', '\n'.join(apps.keys())], stdout=PIPE) as echo:
    rofi = Popen(['rofi', '-dmenu', '-matching', 'prefix'], stdin=echo.stdout, stdout=PIPE)
k = rofi.communicate()[0].decode('utf-8').rstrip()
if k in apps:
    args = ['sh', '-c', apps[k]]
    print(run(args))
elif k:
    args = ['sh', '-c', f'{apps['waterfox']} --new-tab https://duckduckgo.com/?q={quote_plus(k)}']
    print(run(args))
else:
    print('empty')

sys.exit(0)
