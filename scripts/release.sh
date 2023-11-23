#!/bin/bash
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VERSION=$1
MAPBOX_COMMON_VERSION=$2

XCFRAMEWORK_ZIP=$(mktemp).zip

# artifact can be not available immediately, so here we try to wait for it's availability
# 60 minutes
TIMEOUT=3600
INTERVAL=60
TIME=0
URL="https://api.mapbox.com/downloads/v2/dash-native/snapshots/ios/packages/${VERSION}/MapboxNavigationNative.xcframework.zip"
while [[ "$(curl -s -w ''%{http_code}'' --netrc ${URL} --output $XCFRAMEWORK_ZIP)" != "200" ]]; do 
    >&2 echo "Artifact is not available yet. Waiting ${INTERVAL} seconds..."
    sleep ${INTERVAL}
    TIME=$((TIME+${INTERVAL}))
    if [[ "$TIME" -gt "$TIMEOUT" ]]; then
        >&2 echo "Timeout..."
        exit 1
    fi
done

CHECKSUM=$(swift package compute-checksum ${XCFRAMEWORK_ZIP})
python3 ${DIR}/change_version.py --version ${VERSION} --common-version ${MAPBOX_COMMON_VERSION} --checksum ${CHECKSUM}
