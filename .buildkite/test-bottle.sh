#!/bin/bash
set -eo pipefail
GIT_DIR=$(pwd)
DEP=$1

brew tap eosio/eosio
cd /usr/local/Homebrew/Library/Taps/eosio/homebrew-eosio
git pull origin $BUILDKITE_BRANCH && git checkout -f $BUILDKITE_COMMIT
cd $GIT_DIR

brew install --force-bottle eosio/eosio/$DEP

# Logic to ensure we installed via bottle and not by building from source goes here.
