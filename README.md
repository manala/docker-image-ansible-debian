# Docker Image - Ansible - Debian [![Build Status](https://travis-ci.org/manala/docker-image-ansible-debian.svg?branch=master)](https://travis-ci.org/manala/docker-image-ansible-debian)

[![Docker Stars](https://img.shields.io/docker/stars/manala/ansible-debian.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/manala/ansible-debian.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/manala/ansible-debian.svg)]()

Provides ansible, and related tools.

## Development

Requirements:
- Docker
- Make

Build
```
make build
make build@wheezy
make build@jessie
```

Dev
```
make dev@wheezy
make dev@jessie
```

Test
```
make test
make test@wheezy
make test@jessie
```

Updates:
- Check for new [ansible](https://github.com/ansible/ansible/releases) release and update Dockerfiles and goss.yaml accordingly
- Check for new [ansible-lint](https://github.com/willthames/ansible-lint/releases) release and update Dockerfiles and goss.yaml accordingly
- Check for new [goss](https://github.com/aelsabbahy/goss/releases) release and update Dockerfiles accordingly

## Todo

* Starting from version 1.4, pip install only stable versions. The version
  released with wheezy is 1.1 (1.5 for jessie), so we have to find a way to
  update or install new versions.
