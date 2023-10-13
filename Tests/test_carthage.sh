#!/usr/bin/env sh
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="${DIR}/.."
pushd "${ROOT_DIR}/Tests/Carthage"

xcodegen generate
carthage update --platform iOS --use-netrc --use-xcframeworks
xcodebuild -project CarthageTest.xcodeproj -scheme CarthageTest -destination 'platform=iOS Simulator,name=iPhone 13,OS=15.5' build

popd
