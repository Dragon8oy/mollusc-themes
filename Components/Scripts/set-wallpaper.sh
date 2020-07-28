#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd ../Wallpapers || exit 1

mkdir -p ~/Pictures/Wallpapers/
cp ./*.png ~/Pictures/Wallpapers/

wallpaper="$(ls ./*.png)"
gsettings set org.gnome.desktop.background picture-uri "file:///home/$USER/Pictures/Wallpapers/$wallpaper"
gsettings set org.gnome.desktop.background picture-options 'zoom'
