#!/bin/bash -e
export PUPPET_ENV=development
export PUPPET_HOST=dev
VAGRANT_LOG=debug
vagrant up
