#!/usr/bin/env sh
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="${DIR}/.."
pushd "${ROOT_DIR}/Tests/SPM"

function find_pattern {
    FILE=$1
    PATTERN=$2
    MATCH=$(python3 -c "import re; import sys; print(re.findall('$PATTERN', open(sys.argv[1]).read())[0])" $FILE)
    echo $MATCH
}

# test that we have correct checksum in Package.swift
VERSION=$(find_pattern $ROOT_DIR/Package.swift "let version = \"(.+)\"")
ACTUAL_CHECKSUM=$(find_pattern $ROOT_DIR/Package.swift "let checksum = \"(.+)\"")
echo "Current version in Package.swift: ${VERSION}"
echo "Current checksum in Package.swift: ${ACTUAL_CHECKSUM}"

URL="https://api.mapbox.com/downloads/v2/mobile-navigation-native/releases/ios/packages/${VERSION}/MapboxNavigationNative.xcframework.zip"
XCFRAMEWORK_ZIP=$(mktemp).zip
curl -s --retry 3 --netrc ${URL} --output ${XCFRAMEWORK_ZIP}
EXPECTED_CHECKSUM=$(swift package compute-checksum ${XCFRAMEWORK_ZIP})

if [[ "$ACTUAL_CHECKSUM" != "$EXPECTED_CHECKSUM" ]]; then
    >&2 echo "Actual cheksum is ${ACTUAL_CHECKSUM} and expected checksum is ${EXPECTED_CHECKSUM}. SPM checksum test failed."
    exit 1
fi

# try to build test project
xcodegen generate
xcodebuild -project SPMTest.xcodeproj -scheme SPMTest -destination "generic/platform=iOS Simulator" build

popd
