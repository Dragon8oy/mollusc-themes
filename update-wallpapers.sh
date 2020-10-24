#!/bin/bash
cd Components || exit 1
rm -rf Wallpapers
git clone https://github.com/Dragon8oy/argon-wallpapers.git
mv argon-wallpapers Wallpapers
rm -rf Wallpapers/README.md Wallpapers/compress-wallpapers.sh
