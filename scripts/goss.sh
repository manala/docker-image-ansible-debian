#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Goss
apt-get -y --no-install-recommends install curl ca-certificates

curl -L https://github.com/aelsabbahy/goss/releases/download/v0.2.3/goss-linux-amd64 > /usr/local/bin/goss
chmod +rx /usr/local/bin/goss

apt-get -y purge curl ca-certificates
apt-get -y --purge autoremove
