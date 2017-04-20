#!/usr/bin/env bash
TAG="$1"

CHANNEL=edge

# Parse tag (if provided)
if [ ! -z "$TAG" ]; then
    . $(dirname "$0")/channel.sh $TAG

    if [ -z "$CHANNEL" ]; then
        echo "ERROR: Unable to parse tag (no channel returned)"
        exit 1
    fi
fi

# Validate channel
if [[ ! "$CHANNEL" =~ ^(stable|candidate|beta|edge)$ ]]; then
    echo "ERROR: Invalid channel: $CHANNEL (expected: stable, candidate, beta, or edge)"
    exit 1
fi

# Initialize environment
$(dirname "$0")/initialize.sh || {
    echo "ERROR: Unable to initialize environment"
    exit 1
}

# Push snap
snapcraft push *.snap --release $CHANNEL
