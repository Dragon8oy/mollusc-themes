#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd ../Wallpapers || exit 1

mkdir -p ~/Pictures/Wallpapers/
cp ./*.png ~/Pictures/Wallpapers/

ls ./*.png
echo "Enter the filename of the wallpaper to use:"
read -r wallpaper
if [[ -f "$wallpaper" ]]; then
  gsettings set org.gnome.desktop.background picture-uri "file:///home/$USER/Pictures/Wallpapers/$wallpaper"
  gsettings set org.gnome.desktop.background picture-options 'zoom'
else
  echo "Invalid filename"
fi
