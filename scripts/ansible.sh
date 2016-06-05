#!/bin/bash

DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install ansible

cat <<EOF > /etc/ansible/hosts
localhost ansible_connection=local
EOF
