#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")"
cd ../Misc

while IFS='' read -r line || [ -n "$line" ]; do
  if [[ "$line" != "" ]]; then
    gsettings set $line
  fi
done < "./gsettings.list"
