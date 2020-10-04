#!/bin/bash

#Install fonts
sudo apt install fonts-ubuntu-console fonts-ubuntu-font-family-console fonts-ubuntu ttf-ubuntu-font-family

#Set fonts
gsettings set org.gnome.desktop.interface font-name 'Ubuntu 11'
gsettings set org.gnome.desktop.interface document-font-name 'Ubuntu 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono 13'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu Bold 11'
