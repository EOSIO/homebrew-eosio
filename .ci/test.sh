#!/bin/bash
set -eo pipefail
echo '--- :evergreen_tree: Configuring Environment'
echo "Using git tag '$REPO_UNDER_TEST:$GIT_TAG'."
CLONE="git clone --recursive --single-branch --branch '${GIT_TAG}' '${REPO_UNDER_TEST}'"
echo "$ $CLONE"
eval $CLONE
BREW_UPDATE='brew update'
echo "$ $BREW_UPDATE"
eval $BREW_UPDATE
echo '+++ :beer: Homebrew Tap and Install'
BREW_TAP="brew tap '$TAP'"
echo "$ $BREW_TAP"
eval $BREW_TAP
BREW_INSTALL="brew install '$PACKAGE'"
echo "$ $BREW_INSTALL"
eval $BREW_INSTALL
echo '+++ :label: Full Version Label Test'
cd eos
export BUILD_ROOT="$(which nodeos | sed 's_/bin/nodeos__g')"
echo "Found nodeos at \"$BUILD_ROOT/bin/nodeos\"."
export BUILDKITE_COMMIT="$(git rev-parse HEAD)" # override homebrew-eosio commit with eos tag commit
echo "Found git commit '$REPO_UNDER_TEST:$BUILDKITE_COMMIT'."
unset BUILDKITE_TAG
export CMAKE_SOURCE_DIR="$(pwd)"
echo "Set CMAKE_SOURCE_DIR to \"$CMAKE_SOURCE_DIR\"."
TEST="./tests/full-version-label.sh '$GIT_TAG'"
echo "$ $TEST"
eval $TEST
echo '--- :white_check_mark: Done!'
echo 'Done.'
