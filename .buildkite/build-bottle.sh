#!/bin/bash
set -eo pipefail
GIT_DIR=$(pwd)
DEP=$1

brew tap eosio/eosio
cd /usr/local/Homebrew/Library/Taps/eosio/homebrew-eosio
git pull origin $BUILDKITE_BRANCH && git checkout -f $BUILDKITE_COMMIT
cd $GIT_DIR

brew install --build-bottle eosio/eosio/$DEP
brew bottle eosio/eosio/$DEP

for FILE in *.tar.gz; do 
    mv $FILE ${FILE/-/}
done
