#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd ../motd || exit 1

sudo rm -rf /etc/motd /etc/update-motd.d
sudo cp -r update-motd.d /etc/update-motd.d
