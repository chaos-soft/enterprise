#!/bin/bash
list=(
    *corectrl*
    *easyeffects*
    *evolution*
    *firefox*
    *gamescope*
    *gnome*
    *mednafen*
    *mousepad*
    *parole*
    *thunar*
    *vinagre*
    *waybar*
    *wine*
    *xfce4-genmon-plugin*
    *yt-dlp*
    grim
    mate*
    mc
)

for v in ${list[@]}
do
    find ~ -depth -iname $v -print 2>/dev/null
done
