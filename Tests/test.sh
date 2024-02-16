#!/usr/bin/env sh
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="${DIR}/.."

echo "Testing SPM..."
${ROOT_DIR}/Tests/test_spm.sh

# TODO: remove Carthage from this repo and mapbox-native-internal.
# It is not supported by maps and NavSDK for a long time already.
# echo "Testing Carthage..."
# ${ROOT_DIR}/Tests/test_carthage.sh

# We don't currently publish snapshots to CocoaPods
# echo "Testing CocoaPods..."
# ${ROOT_DIR}/Tests/test_cocoapods.sh

