#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Ansible
apt-get -y --no-install-recommends install python-yaml python-crypto
apt-get -y --no-install-recommends install python-pip gcc python-dev libffi-dev libssl-dev

pip install ansible==2.2.0.0

apt-get -y purge python-pip gcc python-dev libffi-dev libssl-dev
apt-get -y --purge autoremove

# Get debian version (wheezy,jessie,...)
VERSION=$(cat /etc/os-release | sed -n 's/.*VERSION="[0-9] (\(.*\))"/\1/p')

# Ansible - Hosts
mkdir -p /etc/ansible
cat <<EOF > /etc/ansible/hosts
$VERSION ansible_connection=local
EOF
