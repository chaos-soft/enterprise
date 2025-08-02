#!/bin/bash
list=(
    *amescope*
    *arole*
    *asyeffects*
    *aybar*
    *fce4-genmon-plugin*
    *hunar*
    *inagre*
    *irefox*
    *nome*
    *orectrl*
    *ousepad*
    *volution*
    *wine*
    *yt-dlp*
    grim
    mate*
    mc
)

for v in ${list[@]}
do
    find ~ -depth -name $v -print 2>/dev/null
done
