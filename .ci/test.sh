#!/bin/bash
set -eo pipefail
echo '--- :evergreen_tree: Configuring Environment'
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
INSTALL="brew install '$INSTALL'"
echo "$ $INSTALL"
eval $INSTALL
echo '+++ :label: Full Version Label Test'
cd eos
export BUILD_ROOT="$(which nodeos | sed 's_/bin/nodeos__g')"
export BUILDKITE_COMMIT="$(git rev-parse HEAD)" # override homebrew-eosio commit with eos tag commit
unset BUILDKITE_TAG
export CMAKE_SOURCE_DIR="$(pwd)"
TEST="./tests/full-version-label '$GIT_TAG'"
echo "$ $TEST"
eval $TEST
echo '--- :white_check_mark: Done!'
