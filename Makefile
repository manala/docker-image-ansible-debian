.SILENT:
.PHONY: help

# Versions
ANSIBLE_VERSION      = 2.2.0.0
ANSIBLE_LINT_VERSION = 3.4.7
GOSS_VERSION         = 0.2.4

## Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m
COLOR_ERROR   = \033[31m

## Help
help:
	printf "${COLOR_COMMENT}Usage:${COLOR_RESET}\n"
	printf " make [target]\n\n"
	printf "${COLOR_COMMENT}Available targets:${COLOR_RESET}\n"
	awk '/^[a-zA-Z\-\_0-9\.@]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf " ${COLOR_INFO}%-16s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

#######
# Dev #
#######

## Dev - Wheezy
dev@wheezy:
	docker run \
		--rm \
		--volume `pwd`:/srv \
		--tty --interactive \
		manala/ansible-debian:wheezy \
		/bin/bash

## Dev - Jessie
dev@jessie:
	docker run \
		--rm \
		--volume `pwd`:/srv \
		--tty --interactive \
		manala/ansible-debian:jessie \
		/bin/bash

#########
# Build #
#########

## Build
build: build@wheezy build@jessie

## Build - Wheezy
build@wheezy:
	docker build \
		--pull \
		--rm \
		--force-rm \
		--no-cache \
		--tag manala/ansible-debian:wheezy \
		--file Dockerfile.wheezy \
		--build-arg ANSIBLE_VERSION=${ANSIBLE_VERSION} \
		--build-arg ANSIBLE_LINT_VERSION=${ANSIBLE_LINT_VERSION} \
		--build-arg GOSS_VERSION=${GOSS_VERSION} \
		.

## Build - Jessie
build@jessie:
	docker build \
		--pull \
		--rm \
		--force-rm \
		--no-cache \
		--tag manala/ansible-debian:jessie \
		--file Dockerfile.jessie \
		--build-arg ANSIBLE_VERSION=${ANSIBLE_VERSION} \
		--build-arg ANSIBLE_LINT_VERSION=${ANSIBLE_LINT_VERSION} \
		--build-arg GOSS_VERSION=${GOSS_VERSION} \
		.

########
# Push #
########

## Push
push: push@wheezy push@jessie

## Push - Wheezy
push@wheezy:
	docker push manala/ansible-debian:wheezy

## Push - Jessie
push@jessie:
	docker push manala/ansible-debian:jessie
