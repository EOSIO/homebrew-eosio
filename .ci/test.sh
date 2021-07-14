#!/bin/bash
set -eo pipefail
echo '--- :evergreen_tree: Configuring Environment'
exec 9>&1 # enable tee to write to STDOUT as a file
echo "Using git tag '$REPO_UNDER_TEST:$GIT_TAG'."
CLONE="git clone --recursive --single-branch --branch '${GIT_TAG}' '${REPO_UNDER_TEST}'"
echo "$ $CLONE"
eval $CLONE
BREW_UPDATE='brew update'
echo "$ $BREW_UPDATE"
eval $BREW_UPDATE
if [[ ! -z "$BOTTLE" ]]; then
    echo '+++ :hash: Verify Package Hash - SHA-256'
    cd "$BUILDKITE_PIPELINE_SLUG" # same as repo name
    DOWNLOAD="curl -fsSL -o './$BOTTLE' '$ROOT_URL/$BOTTLE'"
    echo "$ $DOWNLOAD"
    eval $DOWNLOAD
    FILE_HASH="openssl dgst -sha256 '$BOTTLE'"
    echo "$ $FILE_HASH"
    BOTTLE_HASH="$(eval $FILE_HASH | tee >(cat - >&9) | awk '{print $2}')"
    RUBY_LINE="cat '$RUBY_FILE' | grep 'sha256' | grep '$OS'"
    echo "$ $RUBY_LINE"
    RUBY_HASH="$(eval $RUBY_LINE | tee >(cat - >&9) | awk '{print $3}' | tr -d '"')"
    if [[ "$BOTTLE_HASH" == "$RUBY_HASH" ]]; then
        echo "Pass: $BOTTLE_HASH = $RUBY_HASH"
    else
        echo "+++ :x: Failed to Verify Bottle Hash"
        FAIL_MSG="$BOTTLE hash $BOTTLE_HASH ≠ $RUBY_FILE::$OS hash $RUBY_HASH"'!'
        echo "FAILURE: $FAIL_MSG"
        [[ "$BUILDKITE" == 'true' ]] && echo "**FAILURE:** $FAIL_MSG" | buildkite-agent annotate --style 'error' --context "wrong-hash-$OS"
        exit 2
    fi
    cd ..
fi
echo '+++ :beer: Homebrew Tap and Install'
BREW_TAP="brew tap '$TAP'"
echo "$ $BREW_TAP"
eval $BREW_TAP
BREW_INSTALL="brew install '$PACKAGE'"
echo "$ $BREW_INSTALL"
eval $BREW_INSTALL
echo '+++ :label: Full Version Label Test'
cd eos
WHICH_BIN="which '$BIN'"
echo "$ $WHICH_BIN"
export BUILD_ROOT="$(eval $WHICH_BIN | tee >(cat - >&9) | sed "s_/bin/${BIN}__g")"
if [[ -z "$BUILD_ROOT" ]]; then
    FAIL_MSG="'$BIN' binary not found after homebrew installation on $OS_STYLIZED"'!'
    echo "FAILURE: $FAIL_MSG"
    [[ "$BUILDKITE" == 'true' ]] && echo "**FAILURE:** $FAIL_MSG" | buildkite-agent annotate --style 'error' --context "no-binary-$OS"
    exit 3
else
    echo "Found '$BIN' at \"$BUILD_ROOT/bin/$BIN\"."
fi
export BUILDKITE_COMMIT="$(git rev-parse HEAD)" # override homebrew-eosio commit with eos tag commit
echo "Found git commit '$REPO_UNDER_TEST:$BUILDKITE_COMMIT'."
unset BUILDKITE_TAG
export CMAKE_SOURCE_DIR="$(pwd)"
echo "Set CMAKE_SOURCE_DIR to \"$CMAKE_SOURCE_DIR\"."
TEST="./tests/full-version-label.sh '$GIT_TAG'"
echo "$ $TEST"
set +e
eval $TEST
EXIT_STATUS="$?"
set -e
if [[ "$EXIT_STATUS" != '0' ]]; then
    FAIL_MSG="Version label test failed on $OS_STYLIZED"'!'
    echo "FAILURE: $FAIL_MSG"
    [[ "$BUILDKITE" == 'true' ]] && echo "**FAILURE:** $FAIL_MSG" | buildkite-agent annotate --style 'error' --context "test-failure-$OS"
    exit "$EXIT_STATUS"
fi
echo '--- :white_check_mark: Done!'
echo 'Done.'
