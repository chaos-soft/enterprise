#!/bin/bash
list=(
    *alacritty*
    *cachyos*
    *dunst*
    *evolution*
    *fish*
    *kvantum*
    *polybar*
    *sqlitebrowser*
)

for v in ${list[@]}
do
    find ~ -depth -iname $v -print 2>/dev/null
done
