#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")"
cd ../Wallpapers

mkdir -p ~/Pictures/Wallpapers/
cp *.png ~/Pictures/Wallpapers/

gsettings set org.gnome.desktop.background picture-uri 'file:///home/ratus5/Pictures/Wallpapers/NightMountains.png'
gsettings set org.gnome.desktop.background picture-options 'zoom'
