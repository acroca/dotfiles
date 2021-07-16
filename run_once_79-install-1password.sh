#!/bin/sh

TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" 'https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb' &&
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"
