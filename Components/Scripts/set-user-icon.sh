#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd ../Misc || exit 1
if [[ "$USER" != "root" ]]; then
  sudo cp UserIcon.png "/var/lib/AccountsService/icons/$USER"
  sudo sed "s|.*Icon=.*|Icon=/var/lib/AccountsService/icons/$USER|" "user-AccountsService" | sudo tee "/var/lib/AccountsService/users/$USER" > /dev/null
  sudo chmod 600 "/var/lib/AccountsService/users/$USER"
fi
