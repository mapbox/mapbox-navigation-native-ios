#!/usr/bin/env sh
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="${DIR}/.."

echo "Testing SPM..."
${ROOT_DIR}/Tests/test_spm.sh >/dev/null

echo "Testing Carthage..."
${ROOT_DIR}/Tests/test_carthage.sh >/dev/null

echo "Testing CocoaPods..."
${ROOT_DIR}/Tests/test_cocoapods.sh >/dev/null

