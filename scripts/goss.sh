#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Goss
apt-get -y --no-install-recommends install curl

curl -L https://github.com/aelsabbahy/goss/releases/download/v${GOSS_VERSION}/goss-linux-amd64 > /usr/local/bin/goss
chmod +rx /usr/local/bin/goss

apt-get -y purge curl
apt-get -y --purge autoremove
