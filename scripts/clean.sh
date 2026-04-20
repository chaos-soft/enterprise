#!/bin/bash
list=(
    # *amd*
    *corectrl*
    *easyeffects*
    *evolution*
    *firefox*
    *gamescope*
    *gdm*
    *gnome*
    *luanti*
    *minetest*
    *mousepad*
    *nexus*
    *parole*
    *proton*
    *qtile*
    *ryubing*
    *ryujinx*
    *steam*
    *umu*
    *vinagre*
    *vlc*
    *waybar*
    *wine*
    *xfce4-genmon-plugin*
    *zeitgeist*
    grim
    mate*
    mc
)

for v in ${list[@]}
do
    find ~ -depth -iname $v -print 2>/dev/null
done
