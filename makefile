#!/bin/make

# Make settings
MAKEFLAGS += --warn-undefined-variables --no-builtin-rules

.ONESHELL:
.SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c

.DEFAULT_GOAL := devhost.check

# Targets

export PROJECT_NAME := iwctl-curses

devhost.swlist := podman buildah

.SILENT .PHONY: devhost.check
devhost.check:
	echo "Checking host system configuration ..."
	missing=""

	for program in $(devhost.swlist) ; do
		command -v $$program >/dev/null && continue
		missing="yes"
		echo "- '$$program' is missing"
	done

	if [ -n "$$missing" ] ; then
		echo 'Some required executables are missing'
		exit 1
	fi

.SILENT .PHONY: devhost.setup
devhost.setup:
	echo "FIXME: not implemented" && exit 

include src/devctn/makefile