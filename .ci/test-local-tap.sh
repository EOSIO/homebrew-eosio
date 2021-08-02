#!/bin/bash
set -eo pipefail

. "${0%/*}/libfunctions.sh"

echo '--- :evergreen_tree: Configuring Environment'
exec 9>&1 # enable tee to write to STDOUT as a file
test_bottle

echo '+++ :beer: Homebrew Tap and Install'
perform 'brew update'
if [[ ! $(python3 --version 2>/dev/null) ]]; then
   perform 'brew install python3'
fi
perform "sed -i.bk -e 's/url \".*\"/url \"http:\/\/127.0.0.1:7800\"/' ${BUILDKITE_PIPELINE_SLUG}/*.rb"
perform "pushd ${BUILDKITE_PIPELINE_SLUG} && git add *.rb && git commit -m 'test it!' && popd"
perform "brew tap eosio/eosio ${BUILDKITE_PIPELINE_SLUG}"
perform '{ python3 -m http.server 7800 & } && export HTTP_SERVER_PID=$!'
perform 'sleep 20s'
perform 'brew install eosio'
perform 'kill $HTTP_SERVER_PID'

echo '+++ :label: Full Version Label Test'
test_binary_exists
test_full_version_matches

echo '--- :white_check_mark: Done!'
echo 'Done.'
