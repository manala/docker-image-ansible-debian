#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Goss
apt-get -y --no-install-recommends install curl

curl -L https://github.com/aelsabbahy/goss/releases/download/v0.2.4/goss-linux-amd64 > /usr/local/bin/goss
chmod +rx /usr/local/bin/goss

apt-get -y purge curl
apt-get -y --purge autoremove
