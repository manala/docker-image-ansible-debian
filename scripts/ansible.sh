#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Ansible
apt-get -y --no-install-recommends install python-pip gcc python-dev libffi-dev libssl-dev
apt-get -y --no-install-recommends install python-yaml python-crypto

pip install ansible

apt-get -y purge python-pip gcc python-dev libffi-dev libssl-dev
apt-get -y --purge autoremove

# Ansible - Hosts
mkdir -p /etc/ansible
cat <<EOF > /etc/ansible/hosts
localhost ansible_connection=local
EOF
