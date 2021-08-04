#!/bin/bash
set -eo pipefail

. "${0%/*}/libfunctions.sh"

echo '--- :evergreen_tree: Configuring Environment'
exec 9>&1 # enable tee to write to STDOUT as a file
[[ -n "$BOTTLE" ]] && test_bottle

echo '+++ :beer: Homebrew Tap and Install'
perform 'brew update'
perform "brew tap eosio/eosio ${BUILDKITE_PIPELINE_SLUG}"
perform "brew install '$PACKAGE'"

echo '+++ :label: Full Version Label Test'
test_binary_exists
test_full_version_matches

echo '--- :white_check_mark: Done!'
echo 'Done.'
