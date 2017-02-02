#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Ansible Lint
apt-get -y --no-install-recommends install python-yaml python-six
apt-get -y --no-install-recommends install python-pip python-setuptools

# Ansible-lint >=3.4.9 require setuptools>=11.3; wheezy setuptools ignore this requirement.
if [ $(sed 's/\..*//' /etc/debian_version) == '8' ]; then
    pip install --upgrade pip setuptools
fi

pip install ansible-lint==${ANSIBLE_LINT_VERSION}
