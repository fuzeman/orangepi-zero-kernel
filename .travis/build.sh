#!/usr/bin/env bash
ARCH="$1"

# Validate parameters
if [ -z "$ARCH" ]; then
    echo "ERROR: Missing required arch parameter" >&2
    exit 1
fi

if [[ ! "$ARCH" =~ ^(arm64|armhf)$ ]]; then
    echo "ERROR: Invalid arch: $ARCH (expected: arm64, or armhf)"
    exit 1
fi

# Initialize environment
$(dirname "$0")/initialize.sh || {
    echo "ERROR: Unable to initialize environment"
    exit 1
}

# Build snap
snapcraft snap --target-arch $ARCH
