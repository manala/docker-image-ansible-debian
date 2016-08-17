#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Ansible
apt-get -y --no-install-recommends install python-yaml python-crypto
apt-get -y --no-install-recommends install python-pip gcc python-dev libffi-dev libssl-dev

pip install ansible==2.1.1.0

apt-get -y purge python-pip gcc python-dev libffi-dev libssl-dev
apt-get -y --purge autoremove

# Ansible - Hosts
mkdir -p /etc/ansible
cat <<EOF > /etc/ansible/hosts
localhost ansible_connection=local
EOF
