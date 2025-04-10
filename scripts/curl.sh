#!/bin/bash
rm -rf cinelerra.AppImage
rm -rf DuckStation-x64.AppImage
rm -rf freetube.AppImage

curl -LJ -o freetube.AppImage https://github.com/FreeTubeApp/FreeTube/releases/download/v0.23.3-beta/FreeTube-0.23.3-amd64.AppImage
curl -LOJ https://aka.ms/vs/17/release/vc_redist.x64.exe
curl -LOJ https://archive.org/download/psx-usa-jap-eu_bios/psx-usa-jap-eu_bios/scph1001.7z
curl -LOJ https://cdn1.waterfox.net/waterfox/releases/6.5.6/Linux_x86_64/waterfox-6.5.6.tar.bz2
curl -LOJ https://fluffyquack.com/tools/modmanager.zip
curl -LOJ https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton9-26/GE-Proton9-26.tar.gz
curl -LOJ https://github.com/Open-Wine-Components/umu-launcher/releases/download/1.2.5/umu-launcher-1.2.5-zipapp.tar
curl -LOJ https://github.com/stenzek/duckstation/releases/download/latest/DuckStation-x64.AppImage
curl -LOJ https://github.com/yt-dlp/yt-dlp/releases/download/2025.03.27/yt-dlp_linux
curl -LJ -o cinelerra.AppImage https://cinelerra-gg.org/download/images/CinGG-20250331-x86_64.AppImage

chmod +x cinelerra.AppImage
chmod +x DuckStation-x64.AppImage
chmod +x freetube.AppImage
