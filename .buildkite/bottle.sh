#!/bin/bash
set -eo pipefail
GIT_DIR=$(pwd)

brew tap eosio/eosio
cd /usr/local/Homebrew/Library/Taps/eosio/homebrew-eosio
git pull origin $BUILDKITE_BRANCH && git checkout -f $BUILDKITE_COMMIT
cd $GIT_DIR

for dep in $(ls *.rb | grep -v -e eosio -e doxygen); do
    brew install --build-bottle eosio/eosio/${dep%.*}
    brew bottle eosio/eosio/${dep%.*}
    brew postinstall eosio/eosio/${dep%.*}
done

for file in *.tar.gz; do 
    mv $file ${file/-/}
done
