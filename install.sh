#!/bin/sh

# Check running as sudo
if ! [ $(id -u) = 0 ]
then
  echo "Please rerun as root"
  exit
fi

# Install script
chmod +x ./src/treeshot
cp ./src/treeshot /usr/bin/treeshot

# Install man page
! [ -d "/usr/local/man/man1" ] && echo "Creating '/usr/local/man/man1'" && mkdir /usr/local/man/man1

echo "Coping and compressing man page"
cp ./man/treeshot.1 /usr/local/man/man1/treeshot.1
gzip -f /usr/local/man/man1/treeshot.1 1> /dev/null

echo "Updating man database"
mandb 1> /dev/null
