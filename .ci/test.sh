#!/bin/bash
set -eo pipefail
echo '--- :evergreen_tree: Configuring Environment'
echo "Using git tag 'eos:$GIT_TAG'."
CLONE="git clone --recursive --single-branch --branch '${GIT_TAG}' 'git@github.com:EOSIO/eos.git'"
echo "$ $CLONE"
eval $CLONE
UPDATE='brew update'
echo "$ $UPDATE"
eval $UPDATE
echo '+++ :beer: Homebrew Tap and Install'
TAP="brew tap '$TAP'"
echo "$ $TAP"
eval $TAP
INSTALL="brew install '$PACKAGE'"
echo "$ $INSTALL"
eval $INSTALL
echo '+++ :label: Full Version Label Test'
cd eos
export BUILD_ROOT="$(which nodeos | sed 's_/bin/nodeos__g')"
echo "Found nodeos at \"$BUILD_ROOT/bin/nodeos\"."
export BUILDKITE_COMMIT="$(git rev-parse HEAD)" # override homebrew-eosio commit with eos tag commit
echo "Found 'eos:$BUILDKITE_COMMIT'."
unset BUILDKITE_TAG
export CMAKE_SOURCE_DIR="$(pwd)"
echo "Set CMAKE_SOURCE_DIR to \"$CMAKE_SOURCE_DIR\"."
TEST="./tests/full-version-label '$GIT_TAG'"
echo "$ $TEST"
eval $TEST
echo '--- :white_check_mark: Done!'
echo 'Done.'
