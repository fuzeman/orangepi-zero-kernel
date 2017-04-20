#!/usr/bin/env bash

# Install dependencies
apt-get update -qq
apt-get install -qq -y python2.7 snapcraft

# Ensure "python2" symbolic link exists
ln -s /usr/bin/python2.7 /usr/bin/python2 || true
