#!/bin/bash
cd Components || exit 1
rm -rf Wallpapers
git clone https://github.com/Dragon8oy/argon-wallpapers.git
mv argon-wallpapers Wallpapers
for file in Wallpapers/*; do
  if [[ "$file" != *".png" ]] || [[ "$file" == *"Banner.png"* ]]; then
    rm -rf "./$file"
  fi
done
