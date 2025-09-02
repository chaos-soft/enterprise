#!/bin/bash
rm -rf DuckStation-x64.AppImage
rm -rf freetube.AppImage
rm -rf squashfs-root
rm -rf yt-dlp_linux

# curl -LOJ https://aka.ms/vs/17/release/vc_redist.x64.exe
# curl -LOJ https://archive.org/download/psx-usa-jap-eu_bios/psx-usa-jap-eu_bios/scph1001.7z
curl -LJ -o cinelerra.AppImage https://cinelerra-gg.org/download/images/CinGG-20250630-x86_64.AppImage
curl -LJ -o freetube.AppImage https://github.com/FreeTubeApp/FreeTube/releases/download/v0.23.8-beta/freetube-0.23.8-beta-amd64.AppImage
curl -LOJ https://cdn1.waterfox.net/waterfox/releases/6.6.2/Linux_x86_64/waterfox-6.6.2.tar.bz2
curl -LOJ https://fluffyquack.com/tools/modmanager.zip
curl -LOJ https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton10-10/GE-Proton10-10.tar.gz
curl -LOJ https://github.com/Open-Wine-Components/umu-launcher/releases/download/1.2.9/umu-launcher-1.2.9-zipapp.tar
curl -LOJ https://github.com/stenzek/duckstation/releases/download/latest/DuckStation-x64.AppImage
curl -LOJ https://github.com/yt-dlp/yt-dlp/releases/download/2025.07.21/yt-dlp_linux

chmod +x cinelerra.AppImage
chmod +x DuckStation-x64.AppImage
chmod +x freetube.AppImage
chmod +x yt-dlp_linux

./cinelerra.AppImage --appimage-extract
rm -rf cinelerra.AppImage
rm -rf squashfs-root/usr/lib/libva*
