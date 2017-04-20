#!/usr/bin/env bash
TAG="$1"

# Validate parameters
if [ -z "$TAG" ]; then
    echo "ERROR: Missing required tag parameter" >&2
    exit 1
fi

if [[ ! "$TAG" =~ ^v?([0-9\.-]+)(-(alpha|beta|rc))?\.?([0-9]+)?$ ]]; then
    echo "ERROR: Unsupported tag format: \"$TAG\"" >&2
    exit 1
fi

# Retrieve release attributes
RELEASE="${BASH_REMATCH[1]}"

RELEASE_TYPE="${BASH_REMATCH[3]}"
RELEASE_REVISION="${BASH_REMATCH[4]}"

# Parse release attributes into channels
if [ -z "$RELEASE_TYPE" ] && [ -z "$RELEASE_REVISION" ]; then
    CHANNEL=stable
elif [ "$RELEASE_TYPE" == "alpha" ]; then
    CHANNEL=edge
elif [ "$RELEASE_TYPE" == "beta" ]; then
    CHANNEL=beta
elif [ "$RELEASE_TYPE" == "rc" ]; then
    CHANNEL=candidate
else
    echo "ERROR: Unsupported tag format: \"$TAG\"" >&2
    exit 1
fi
