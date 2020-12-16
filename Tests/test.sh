#!/usr/bin/env sh
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="${DIR}/.."

${ROOT_DIR}/Tests/test_carthage.sh
${ROOT_DIR}/Tests/test_cocoapods.sh
${ROOT_DIR}/Tests/test_spm.sh

