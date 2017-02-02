#!/bin/bash

# Install
curl -fsSL https://goss.rocks/install \
  | GOSS_VER=v${GOSS_VERSION} sh
