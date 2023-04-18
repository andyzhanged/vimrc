#!/bin/sh

if [ -f /etc/redhat-release ]; then
  sudo yum install ncurses-devel
  tar xzvf global-6.6.2.tar.gz
  cd global
  ./config
  make
  sudo make install
fi

if [ -f /etc/lsb-release ]; then
  sudo apt-get install -y global
fi

