#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd ../Misc || exit 1
dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ < terminal-profile.dconf
