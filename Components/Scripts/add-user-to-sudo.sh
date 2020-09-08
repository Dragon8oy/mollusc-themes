#!/bin/bash
if [[ "$USER" != "" ]]; then
  sudo usermod -aG sudo "$USER"
  echo "Done"
else
  echo "\$USER is not set"
fi
