#!/bin/bash
cd Components || exit 1
sudo cp update-themes /usr/bin/update-themes
sudo update-themes --unstable

cd Scripts || exit 1
for script in *.sh; do
  echo "Running $script..."
  bash "$script" -H
done
echo -e "\nInstall complete"
