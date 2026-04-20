#!/bin/bash
rm -rf cinelerra
rm -rf DuckStation-x64.AppImage
rm -rf freetube.AppImage
rm -rf yt-dlp_linux

# curl -LOJ https://aka.ms/vs/17/release/vc_redist.x64.exe
# curl -LOJ https://archive.org/download/psx-usa-jap-eu_bios/psx-usa-jap-eu_bios/scph1001.7z
curl -LJ -o freetube.AppImage https://github.com/FreeTubeApp/FreeTube/releases/download/v0.24.0-beta/freetube-0.24.0-beta-amd64.AppImage
curl -LOJ --socks5 127.0.0.1:9150 https://git.eden-emu.dev/eden-emu/eden/releases/download/v0.2.0-rc2/Eden-Linux-v0.2.0-rc2-amd64-gcc-standard.AppImage
curl -LOJ https://cdn.waterfox.com/waterfox/releases/6.6.9/Linux_x86_64/waterfox-6.6.9.tar.bz2
curl -LOJ https://cdnweb.sberbank.ru/appdistr/SberbankOnline.apk
curl -LOJ https://download.cinelerra-gg.org/download.php?file=images%2FCinGG-20260228-x86_64.AppImage
curl -LOJ https://fluffyquack.com/tools/modmanager.zip
curl -LOJ https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton10-32/GE-Proton10-32.tar.gz
curl -LOJ https://github.com/Open-Wine-Components/umu-launcher/releases/download/1.3.0/umu-launcher-1.3.0-zipapp.tar
curl -LOJ https://github.com/optiscaler/OptiScaler/releases/download/v0.9/Optiscaler_0.9.0-final.20260401._AF.7z
curl -LOJ https://github.com/stenzek/duckstation/releases/download/latest/DuckStation-x64.AppImage
curl -LOJ https://github.com/yt-dlp/yt-dlp/releases/download/2026.03.03/yt-dlp_linux

chmod +x CinGG-20260228-x86_64.AppImage
chmod +x DuckStation-x64.AppImage
chmod +x Eden-Linux-v0.2.0-rc2-amd64-gcc-standard.AppImage
chmod +x freetube.AppImage
chmod +x yt-dlp_linux

./CinGG-20260228-x86_64.AppImage --appimage-extract
mv -n squashfs-root cinelerra
rm -rf cinelerra/usr/lib/libva*
