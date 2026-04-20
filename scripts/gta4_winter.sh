#!/bin/bash
of=/mnt/larka/games/games/GTAIV/

rsync --archive --stats --itemize-changes \
    '/mnt/larka/games/.local/share/Steam/steamapps/common/Grand Theft Auto IV/GTAIV/' \
    "$of" \
    --exclude Redistributables \
    --exclude TBoGT \
    --exclude TLAD

rsync --archive --stats --itemize-changes \
    'gta-iv-1-0-7-0-downgrade-patch_1687355143_513265/GTA IV 1.0.7.0 Ultimate Downgrader/GTA IV 1.0.7.0 Ultimate Downgrader/' \
    "$of" \
    --exclude common/GTAIV.EFLC.FusionFix.img \
    --exclude d3d10.dll \
    --exclude d3d10_1.dll \
    --exclude d3d10core.dll \
    --exclude d3d11.dll \
    --exclude d3d9.dll \
    --exclude dxgi.dll \
    --exclude GTAIV.dxvk-cache \
    --exclude GTAIV_d3d9.log \
    --exclude plugins \
    --exclude ScriptHook.dll \
    --exclude SteamAchievements.asi \
    --exclude TBoGT \
    --exclude TLAD \
    --exclude xlive.dll \
    --exclude ZolikaPatch.asi \
    --exclude ZolikaPatch.ini

rsync --archive --stats --itemize-changes \
    'Grand Theft Auto IV Winter Edition/2. Grand Theft Auto IV Winter Edition/' \
    "$of" \
    --exclude AdvancedHook.dll \
    --exclude CarjackProject.asi \
    --exclude CarjackProject.ini \
    --exclude commandline.txt \
    --exclude d3d9.dll \
    --exclude dinput8.dll \
    --exclude DrugDealerFix.asi \
    --exclude dsound.dll \
    --exclude enbbloom.fx \
    --exclude enbclouds.fx \
    --exclude enbclouds.png \
    --exclude enbdetail.dds \
    --exclude enbeffect.fx \
    --exclude enbseries.ini \
    --exclude enbstars.png \
    --exclude Fxaa3_11.h \
    --exclude injFX_Settings.h \
    --exclude injFX_Shaders \
    --exclude IVLodLights.asi \
    --exclude IVLodLights.dat \
    --exclude IVLodLights.ini \
    --exclude pc/models/cdimages/vehicles.img \
    --exclude ScenariosBlockedZones.ini \
    --exclude ScenariosMod.asi \
    --exclude ScenariosMod.ini \
    --exclude ScriptHookDotNet.asi \
    --exclude scripts \
    --exclude shader.fx \
    --exclude shaderinput \
    --exclude Sharpen.h \
    --exclude SimpleTrafficLoader.asi \
    --exclude SimpleTrafficLoader.ini \
    --exclude ZMenu.h \
    --exclude ZMenuAssets \
    --exclude ZMenuIV.asi \
    --exclude ZMenuIV.img \
    --exclude ZMenuIV.ini \
    --exclude ZMenuIV.lib \
    --exclude zmods_twitch.dll

rsync --archive --stats --itemize-changes \
    'GTAIV.EFLC.FusionFix/' \
    "$of" \
    --exclude d3d9.dll \
    --exclude dinput8.dll \
    --exclude vulkan.dll

rsync --archive --stats --itemize-changes \
    'GTAIV.EFLC.FusionFixLegacyAddon/' \
    "$of"

rsync --archive --stats --itemize-changes \
    'IV.Project2DFXv4.2/' \
    "$of" \
    --exclude readme.txt

rsync --archive --stats --itemize-changes \
    "Liberty's Legacy Trainer 2.4-100-2-4-1724674666/" \
    "$of" \
    --exclude 'Read Me.pdf'

rsync --archive --stats --itemize-changes \
    "DayL's Natural Timecycle-396-1-1-6-1761805106/Main Files/" \
    "$of"
