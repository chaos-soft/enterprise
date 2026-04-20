#!/usr/bin/env python3
from subprocess import run
import argparse
import sys

CURSOR = "XCURSOR_THEME=Adwaita"
D3D9 = "WINEDLLOVERRIDES=d3d9=n"
FIREJAIL = "firejail --noprofile --net=none"
FJG = "firejail --noprofile --caps.drop=all --nodbus --private=/mnt/larka/games"
FJGNN = f"{FJG} --net=none"
FSR = "WINE_FULLSCREEN_FSR=1 WINE_FULLSCREEN_FSR_CUSTOM_MODE=1477x831"
GTK_DARK = "GTK_THEME=Adwaita:dark"
MANGOHUD = "MANGOHUD=1"
PROXY = "http_proxy=socks5://127.0.0.1:9150"
UMU_RUN = "~/umu/umu-run"
VKBASALT = "ENABLE_VKBASALT=1"
XGCTS = "xfconf-query -n -c xsettings -p /Gtk/CursorThemeSize -t int -s"
XGWSF = "xfconf-query -n -c xsettings -p /Gdk/WindowScalingFactor -t int -s"
PROTONPATH = "~/.local/share/Steam/compatibilitytools.d/GE-Proton10-32"
PFX = " ".join(
    [
        "DXIL_SPIRV_CONFIG=wmma_fp8_hack",
        "FSR4_WATERMARK=1",
        "GAMEID=0",
        "PROTON_FSR3_UPGRADE=1",
        "PROTON_FSR4_INDICATOR=1",
        "PROTON_FSR4_UPGRADE=1",
        "PROTON_XESS_UPGRADE=1",
        "WINEPREFIX=~/pfx/shf",
        f"PROTONPATH={PROTONPATH}",
    ]
)
MVFP = f"{MANGOHUD} {VKBASALT} {FSR} {PFX}"

DRAKENSANG = "~/games/drakensang/drakensang.exe"
EV = "~/games/EBOLA VILLAGE/EBOLA VILLAGE.exe"
HF2 = "~/games/House Flipper 2/HouseFlipper2.exe"
IJ = "~/games/Indiana Jones and the Great Circle/TheGreatCircle.exe"
RE8 = "~/games/Resident Evil - Village/re8.exe"
RE8F = "~/games/Resident Evil - Village"
SD = "~/games/Sleeping Dogs Pack/LE/HKShip.exe"
SONIC = "/mnt/alisa/tmp/downloads/Sonic Superstars [FitGirl Switch Repack]/setup.exe"
TRX2 = "~/games/Tomb Raider IV-VI Remastered/tomb456.exe"

GTA4 = "/mnt/alisa/memory card/загрузки/directx_Jun2010_redist.exe"
GTA4 = "~/tmp/dx/DXSETUP.exe"
GTA4 = "~/tmp/RUS_GTAIV_EFLC.exe"
GTA4 = "~/games/GTAIV/PlayGTAIV.exe"

apps = {}
key = None
list_ = [
    "caja /mnt",
    "caja",
    "galculator",
    "geany",
    "gitg",
    "gnome-disks",
    "godot",
    "gthumb",
    "transmission-qt",
    "xfce4-taskmanager",
    # "eww open bar",
    # 'eww close bar',
    # 'eww close chat',
    # 'eww open chat',
    'nautilus "/mnt/alisa/memory card/загрузки/видео"',
]
for v in list_:
    apps[v] = v

# apps['57'] = f'{apps['waterfox']} --new-tab https://57st.su/articles/57'
# apps['xfce4-terminal'] = 'xfce4-terminal -e ranger'
apps["audio.sh"] = "~/Documents/enterprise/scripts/audio.sh"
apps["blender"] = "blender --python ~/Documents/python/2b/vse_generator.py"
apps["cinelerra"] = f"BC_FONT_SCALE=1.02 {CURSOR} ~/Downloads/cinelerra/AppRun"
apps["cut.sh"] = "xfce4-terminal -e ~/Documents/enterprise/scripts/cut.sh"
apps["duckstation"] = f"{MANGOHUD} {FIREJAIL} ~/Downloads/DuckStation-x64.AppImage"
apps["eden"] = (
    f"{MANGOHUD} {FIREJAIL} "
    "~/Downloads/Eden-Linux-v0.2.0-rc2-amd64-gcc-standard.AppImage"
)
apps["freetube"] = "~/Downloads/freetube.AppImage"
apps["gamma 1"] = "xrandr --output HDMI-A-0 --gamma 1:1:1"
apps["gamma 1.2"] = "xrandr --output HDMI-A-0 --gamma 1.2:1.2:1.2"
apps["m5l"] = (
    "xdotool type m5lNaA32B0SqnaPe2NjRS7r4VvBzoNVOemZ08oc2gzlHnU8r24ESMf1DZkvQ"
)
apps["nexusmods"] = "~/Downloads/NexusMods.App.x86_64.AppImage"
apps["picom"] = "pkill qdre-compositor ; picom -b"
apps["qdre picom pkill"] = "pkill qdre-compositor ; pkill picom"
apps["qdre"] = "pkill picom ; obs-gamecapture qdre-compositor &"
apps["scale 2k"] = (
    "xrandr --output HDMI-A-0 --panning 1920x1080 --scale-from 1920x1080 "
    f"&& {XGWSF} 1 && {XGCTS} 24"
)
apps["scale 4k"] = (
    "xrandr --output HDMI-A-0 --panning 3840x2160 --scale-from 3840x2160 "
    f"&& {XGWSF} 2 && {XGCTS} 48"
)
apps["ssh polina"] = 'xfce4-terminal -e "ssh -D localhost:9150 polina"'
apps["steam nn"] = f"{FSR} {VKBASALT} {FJGNN} mangohud steam -console"
apps["steam"] = f"{FSR} {VKBASALT} {FJG} mangohud steam -console"
apps["sublime_text"] = f"{FIREJAIL} /usr/lib/sublime_text/sublime_text"
apps["telegram"] = f"{PROXY} Telegram"
apps["tor-browser"] = (
    f"{GTK_DARK} "
    "~/.local/share/torbrowser/tbb/x86_64/tor-browser/Browser/start-tor-browser"
)
apps["waterfox"] = "MOZ_ENABLE_WAYLAND=1 ~/Downloads/waterfox/waterfox"
apps["wiremix"] = "xfce4-terminal -e wiremix"
apps["yad"] = (
    f'{PROXY} yad --html --browser --file-op --uri="https://goodgame.ru/player?22759"'
)

# apps["-sd"] = f'{MVFP} {FJGNN} {UMU_RUN} "{SD}"'
# apps["-sonic"] = f'{MVFP} {FJGNN} {UMU_RUN} "{SONIC}"'
# apps['h3'] = f'{MVFP} {FJGNN} {UMU_RUN} "~/games/Haydee 3/SteamGame.exe"'
# apps['modmanager'] = f'{PFX} {FJG} {UMU_RUN} "~/games/modmanager/Modmanager.exe"'
# apps['trx2'] = f'Xpp_jimenezmlaa_color=8 {PFX} {FJGNN} {UMU_RUN} "{TRX2}" -nolegal'
apps["drakensang"] = f'{MVFP} {FJGNN} hwloc-bind l2:4-5 -- {UMU_RUN} "{DRAKENSANG}"'
apps["ev"] = f'{MVFP} {FJGNN} {UMU_RUN} "{EV}"'
apps["gta4"] = f'{D3D9} {MVFP} {FJGNN} hwloc-bind l3:0 -- {UMU_RUN} "{GTA4}"'
apps["hf2"] = f'{MVFP} {FJGNN} {UMU_RUN} "{HF2}"'
apps["ij"] = f'{MVFP} {FJGNN} {UMU_RUN} "{IJ}" +com_skipIntroVideo 1'
apps["mw"] = f"MANGOHUD_CONFIGFILE=/mnt/larka/games/tmp/mh {FIREJAIL} mangohud openmw"
apps["re8"] = f'cd "{RE8F}" && {MANGOHUD} {PFX} {FJGNN} {UMU_RUN} "{RE8}"'

apps = dict(sorted(apps.items()))

for v in ["poweroff", "reboot", "suspend"]:
    apps[v] = f"loginctl {v}"

apps["timer"] = "touch -m ~/tmp/tzj"


def main() -> int:
    global key
    if not key:
        r = run(
            ["rofi", "-dmenu", "-matching", "prefix"],
            capture_output=True,
            input="\n".join(apps.keys()).encode("utf-8"),
        )
        key = r.stdout.decode("utf-8").rstrip()
    if key in apps:
        args = apps[key]
        print(run(args, shell=True))
    elif key:
        print(run(key, shell=True))
    else:
        print("empty")
    return 0


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-k", "--key", type=str)
    args_ = parser.parse_args()
    key = args_.key
    sys.exit(main())
