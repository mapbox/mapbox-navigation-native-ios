#!/usr/bin/env sh
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="${DIR}/.."
pushd "${ROOT_DIR}/Tests/Carthage"

xcodegen generate
carthage update --platform iOS --use-netrc --use-xcframeworks
xcodebuild -project CarthageTest.xcodeproj -scheme CarthageTest -destination 'platform=iOS Simulator,name=iPhone 15 Pro' build \
    CODE_SIGN_IDENTITY="" \
    CODE_SIGNING_REQUIRED=NO \
    CODE_SIGNING_ALLOWED=NO

popd
