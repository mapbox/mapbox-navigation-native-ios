#!/usr/bin/env sh
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="${DIR}/.."
pushd "${ROOT_DIR}/Tests/CocoaPods"

xcodegen generate
bundle install
bundle exec pod repo update
bundle exec pod install
xcodebuild -workspace PodInstall.xcworkspace -scheme PodInstall -destination 'platform=iOS Simulator,name=iPhone 13,OS=15.5' build \
    CODE_SIGN_IDENTITY="" \
    CODE_SIGNING_REQUIRED=NO \
    CODE_SIGNING_ALLOWED=NO

popd
