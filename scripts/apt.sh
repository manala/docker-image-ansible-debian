#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Get debian version (wheezy,jessie,...)
VERSION=$(cat /etc/os-release | sed -n 's/.*VERSION="[0-9] (\(.*\))"/\1/p')

# Debian - Sources
cat <<EOF > /etc/apt/sources.list
deb http://httpredir.debian.org/debian $VERSION main non-free contrib
deb-src http://httpredir.debian.org/debian $VERSION main non-free contrib
deb http://security.debian.org/ $VERSION/updates main contrib non-free
deb-src http://security.debian.org/ $VERSION/updates main contrib non-free
# $VERSION-updates, previously known as 'volatile'
deb http://httpredir.debian.org/debian $VERSION-updates main contrib non-free
deb-src http://httpredir.debian.org/debian $VERSION-updates main contrib non-free
EOF

apt-get update
apt-get -y dist-upgrade
