#!/usr/bin/env sh
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="${DIR}/.."
pushd "${ROOT_DIR}/Tests/Carthage"

xcodegen generate
carthage update --platform iOS --use-netrc
xcodebuild -project CarthageTest.xcodeproj -scheme CarthageTest -destination "generic/platform=iOS Simulator" build

popd
