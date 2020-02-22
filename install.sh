#!/bin/bash
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )

buildPackage() {
  if which sed > /dev/null 2>&1; then
    echo "Enter the new version number: (Leave blank to only build package)"
    read newVersion
    sed "s|.*Version:.*|Version: $newVersion|" debian/DEBIAN/control > debian/DEBIAN/control.temp
    mv -v debian/DEBIAN/control.temp debian/DEBIAN/control
  else
    echo "Sed not installed or not in path, please correct the error and try again"
  fi

  if which dpkg > /dev/null 2>&1; then
    #Setup package structure
    #componentPath="debian/usr/share/"
    mkdir -v debian/usr/
    mkdir -v debian/usr/bin/

    #Make update-themes executable
    chmod -v +x update-themes

    #Copy files into directories using componentPath
    cp -v component $componentPath/

    cp -v update-themes debian/usr/bin/

    #Build the package and rename
    dpkg --build debian/ && mv debian.deb ./mollusc-themes_all.deb

    #Cleanup debian packaging
    rm -rfv package/debian/usr/

    echo "Done"
  else
    echo "Building Debian packages not supported on this system"
    exit
  fi
}

while [[ "$#" -gt 0 ]]; do case $1 in
  -h|--help) echo "Mollusc-themes Copyright (C) 2020 Stuart Hayhurst"; echo "This program comes with ABSOLUTELY NO WARRANTY."; echo "This is free software; see the source for copying conditions."; echo ""; echo "Usage: ./install.sh [-OPTION]"; echo "Help:"; echo "-h | --help          : Display this help page"; echo "-b | --build         : Build and prepare the program for release"; echo "-d | --debian        : Build the .deb and install"; echo ""; echo "Program written by: Dragon8oy"; exit;;
  -d|--debian) buildPackage; echo "Installing package:"; sudo dpkg -i "mollusc-themes_all.deb"; exit;;
  -b|--build) buildPackage; exit;;
  *) echo "Unknown parameter passed: $1"; exit 1;;
esac; shift; done
