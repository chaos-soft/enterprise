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
MANGOHUD = "MANGOHUD=1"
PROXY = "http_proxy=socks5://127.0.0.1:9150"
UMU_RUN = "~/tmp/umu/umu-run"
VKBASALT = "ENABLE_VKBASALT=1"
XGCTS = "xfconf-query -n -c xsettings -p /Gtk/CursorThemeSize -t int -s"
XGWSF = "xfconf-query -n -c xsettings -p /Gdk/WindowScalingFactor -t int -s"
PROTONPATH = "~/.local/share/Steam/compatibilitytools.d/GE-Proton10-34"
PFX = " ".join(
    [
        "DXIL_SPIRV_CONFIG=wmma_fp8_hack",
        "FSR4_WATERMARK=1",
        "GAMEID=0",
        "PROTON_FSR3_UPGRADE=1",
        "PROTON_FSR4_INDICATOR=1",
        "PROTON_FSR4_UPGRADE=1",
        "PROTON_XESS_UPGRADE=1",
        "WINEPREFIX=~/pfx/20260526",
        f"PROTONPATH={PROTONPATH}",
    ]
)
MVFP = f"{MANGOHUD} {VKBASALT} {FSR} {PFX}"

DRAKENSANGF = "/mnt/larka/games/games/drakensang"
EVF = "/mnt/larka/games/games/EBOLA VILLAGE"
GTA4F = "/mnt/larka/games/games/GTAIV"
H3F = "/mnt/larka/games/games/Haydee 3"
HF2F = "/mnt/larka/games/games/House Flipper 2"
IJF = "/mnt/larka/games/games/Indiana Jones and the Great Circle"
RE8F = "/mnt/larka/games/games/Resident Evil - Village"
TRX2F = "/mnt/larka/games/games/Tomb Raider IV-VI Remastered"

DRAKENSANG = "drakensang.exe"
EV = "EBOLA VILLAGE.exe"
GTA4 = "PlayGTAIV.exe"
H3 = "SteamGame.exe"
HF2 = "HouseFlipper2.exe"
IJ = "TheGreatCircle.exe"
RE8 = "re8.exe"
TRX2 = "tomb456.exe"

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
    'nautilus "/mnt/xxx1/memory card/загрузки/видео" "/mnt/xxx2/memory card/загрузки/видео"',
]
for v in list_:
    apps[v] = v

apps["audio.sh"] = "~/Documents/enterprise/scripts/audio.sh"
apps["blender"] = "blender --python ~/Documents/python/2b/vse_generator.py"
apps["cinelerra"] = f"BC_FONT_SCALE=1.02 {CURSOR} ~/Downloads/cinelerra/AppRun"
apps["cut.sh"] = "xfce4-terminal -e ~/Documents/enterprise/scripts/cut.sh"
apps["duckstation"] = f"{MANGOHUD} {FIREJAIL} ~/Downloads/DuckStation-x64.AppImage"
apps["freetube"] = "~/Downloads/freetube.AppImage"
apps["gamma 1"] = "xrandr --output HDMI-A-0 --gamma 1:1:1"
apps["gamma 1.2"] = "xrandr --output HDMI-A-0 --gamma 1.2:1.2:1.2"
apps["picom"] = "pkill qdre-compositor ; picom -b"
apps["qdre picom pkill"] = "pkill qdre-compositor ; pkill picom"
apps["qdre"] = "pkill picom ; obs-gamecapture qdre-compositor &"
apps["ssh polina"] = 'xfce4-terminal -e "ssh -D 0.0.0.0:9150 polina"'
apps["steam nn"] = f"{FSR} {VKBASALT} {FJGNN} mangohud steam -console"
apps["steam"] = f"{FSR} {VKBASALT} {FJG} mangohud steam -console"
apps["telegram"] = f"{PROXY} Telegram"
apps["waterfox"] = "~/Downloads/waterfox/waterfox"
apps["wiremix"] = "xfce4-terminal -e wiremix"

apps["eden"] = (
    f"{MANGOHUD} {FIREJAIL} "
    "~/Downloads/Eden-Linux-v0.2.0-rc2-amd64-gcc-standard.AppImage"
)
apps["m5l"] = (
    "xdotool type m5lNaA32B0SqnaPe2NjRS7r4VvBzoNVOemZ08oc2gzlHnU8r24ESMf1DZkvQ"
)
apps["scale 2k"] = (
    "xrandr --output HDMI-A-0 --panning 1920x1080 --scale-from 1920x1080 "
    f"&& {XGWSF} 1 && {XGCTS} 24"
)
apps["scale 4k"] = (
    "xrandr --output HDMI-A-0 --panning 3840x2160 --scale-from 3840x2160 "
    f"&& {XGWSF} 2 && {XGCTS} 48"
)
apps["tor-browser"] = (
    "dex $HOME/.local/share/torbrowser/tbb/x86_64/tor-browser/start-tor-browser.desktop"
)
apps["yad"] = (
    f'{PROXY} yad --html --browser --file-op --uri="https://goodgame.ru/player?22759"'
)

apps["drakensang"] = f'cd "{DRAKENSANGF}" && {MVFP} {FJGNN} {UMU_RUN} "{DRAKENSANG}"'
apps["ev"] = f'cd "{EVF}" && {MVFP} {FJGNN} {UMU_RUN} "{EV}"'
apps["gta4"] = f'cd "{GTA4F}" && {D3D9} {MVFP} {FJGNN} {UMU_RUN} "{GTA4}"'
apps["h3"] = f'cd "{H3F}" && {MVFP} {FJGNN} {UMU_RUN} "{H3}"'
apps["hf2"] = f'cd "{HF2F}" && {MVFP} {FJGNN} {UMU_RUN} "{HF2}"'
apps["ij"] = f'cd "{IJF}" && {MVFP} {FJGNN} {UMU_RUN} "{IJ}" +com_skipIntroVideo 1'
apps["mw"] = f"MANGOHUD_CONFIGFILE=/mnt/larka/games/tmp/mh {FIREJAIL} mangohud openmw"
apps["re8"] = f'cd "{RE8F}" && {MVFP} {FJGNN} {UMU_RUN} "{RE8}"'
apps["trx2"] = f'cd "{TRX2F}" && {MVFP} {FJGNN} {UMU_RUN} "{TRX2}" -nolegal'

apps = dict(sorted(apps.items()))

for v in ["poweroff", "reboot", "suspend"]:
    apps[v] = f"loginctl {v}"

apps["timer"] = "touch -m ~/tmp/tzj"


def main() -> int:
    global key
    if not key:
        r = run(
            ["rofi", "-dmenu", "-disable-history", "-matching", "prefix"],
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
