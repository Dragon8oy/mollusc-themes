#!/bin/bash
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )

buildPackage() {
  if which sed > /dev/null 2>&1; then
    echo "Enter the new version number: (Leave blank to only build package)"
    read newVersion
    if [[ "$newVersion" != "" ]]; then
      sed "s|.*Version:.*|Version: $newVersion|" debian/DEBIAN/control > debian/DEBIAN/control.temp
      mv -v debian/DEBIAN/control.temp debian/DEBIAN/control
    fi
  else
    echo "Sed not installed or not in path, please correct the error and try again"
  fi

  echo "Enter the relative path to yaru.tar.gz: (Leave blank to try to find yaru)"
  read yaruFile
  if [[ "$yaruFile" == "" ]]; then
    yaruFile=$(ls ./ |grep yaru*.tar.gz)
  fi
  if ! ls "$yaruFile" > /dev/null 2>&1; then
    echo "$yaruFile not found"
    exit
  fi

  if which dpkg > /dev/null 2>&1; then
    molluscPath="debian/usr/share/mollusc-themes"
    mkdir -v debian/usr/
    mkdir -v debian/usr/bin/
    mkdir -v debian/usr/share/
    mkdir -v debian/usr/share/mollusc-themes/
    mkdir -v debian/usr/share/plymouth/
    mkdir -v debian/usr/share/plymouth/themes/

    mkdir -v debian/etc/
    mkdir -v debian/etc/dconf/
    mkdir -v debian/etc/dconf/profile/
    mkdir -v debian/etc/dconf/db/
    mkdir -v debian/etc/dconf/db/local.d/

    mkdir -v debian/boot/
    mkdir -v debian/boot/grub/
    mkdir -v debian/boot/grub/themes/
    mkdir -v debian/boot/grub/themes/Tela/

    chmod -v +x update-themes

    cp -v update-themes debian/usr/bin/
    cp -v Components/Wallpapers/DesktopWallpaper.jpg    "$molluscPath"
    cp -v Components/Wallpapers/LockScreenWallpaper.jpg "$molluscPath"
    cp -Rv Components/Plymouth/linux-mac-plymouth debian/usr/share/plymouth/themes/
    cp -v Components/GRUB/Tela/* debian/boot/grub/themes/Tela/
    cp -v Components/GRUB/splash.jpg debian/boot/grub/splash.jpg

    cp -v Components/dconf/terminal-profile.dconf "$molluscPath"

    cp -v "$yaruFile" "$molluscPath"

    dpkg --build debian/ ./mollusc-themes_all.deb

    rm -rfv debian/usr/
    rm -rfv debian/etc/
    rm -rfv debian/boot/

    echo "Done"
  else
    echo "Building Debian packages not supported on this system"
    exit
  fi
}

if [[ "$@" != "" ]]; then
  case $1 in
    -h|--help) echo "Mollusc-themes Copyright (C) 2020 Stuart Hayhurst"; echo "This program comes with ABSOLUTELY NO WARRANTY."; echo "This is free software; see the source for copying conditions."; echo ""; echo "Usage: ./build.sh [-OPTION]"; echo "Help:"; echo "-h | --help          : Display this help page"; echo "-b | --build         : Build and prepare the program for release"; echo "-d | --debian        : Build the .deb and install"; echo ""; echo "Program written by: Dragon8oy"; exit;;
    -i|-d|--install|--debian) buildPackage; echo "Installing package:"; sudo dpkg -i "mollusc-themes_all.deb"; exit;;
    -b|--build) buildPackage; exit;;
    *) echo "Unknown parameter passed: $1"; exit 1;;
  esac
else
  echo "Usage: ./build.sh [-OPTION]"
fi

