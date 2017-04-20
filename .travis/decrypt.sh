#!/usr/bin/env bash

# Ensure .snapcraft/ directory exists
mkdir .snapcraft/

# Decrypt snapcraft credentials
openssl aes-256-cbc \
  -K $encrypted_8486fa726954_key \
  -iv $encrypted_8486fa726954_iv \
  -in .travis/snapcraft.cfg \
  -out .snapcraft/snapcraft.cfg -d
