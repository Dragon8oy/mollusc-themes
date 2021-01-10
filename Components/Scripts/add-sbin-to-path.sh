#!/bin/bash
#shellcheck disable=SC2016
if [[ ! "$(cat ~/.bashrc)" =~ "#Add /sbin to \$PATH" ]]; then
  echo "" >> ~/.bashrc
  echo '#Add /sbin to $PATH' >> ~/.bashrc
  echo 'PATH="$PATH:/sbin:/usr/sbin"' >> ~/.bashrc
fi
