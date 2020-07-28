#!/bin/bash
#shellcheck disable=SC2086
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd ../Misc || exit 1

while IFS='' read -r line || [ -n "$line" ]; do
  if [[ "$line" != "" ]]; then
    gsettings set $line
  fi
done < "./gsettings.list"
