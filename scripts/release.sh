#!/bin/bash
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VERSION=$1
MAPBOX_COMMON_VERSION=$2

XCFRAMEWORK_ZIP=$(mktemp).zip
curl --netrc https://api.mapbox.com/downloads/v2/mobile-navigation-native/releases/ios/packages/${VERSION}/MapboxNavigationNative.xcframework.zip --output $XCFRAMEWORK_ZIP
CHECKSUM=$(swift package compute-checksum ${XCFRAMEWORK_ZIP})

python3 ${DIR}/change_version.py --version ${VERSION} --common-version ${MAPBOX_COMMON_VERSION} --checksum ${CHECKSUM}
