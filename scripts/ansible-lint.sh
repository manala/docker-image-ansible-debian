#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Ansible Lint
apt-get -y --no-install-recommends install python-pip

pip install ansible-lint

apt-get -y purge python-pip
apt-get -y --purge autoremove
