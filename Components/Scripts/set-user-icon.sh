#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")"
cd ../Misc
sudo cp UserIcon.png "/var/lib/AccountsService/icons/$USER"
sudo sed "s|.*Icon=.*|Icon=/var/lib/AccountsService/icons/$USER|" "user-AccountsService" | sudo tee "/var/lib/AccountsService/users/$USER" > /dev/null
