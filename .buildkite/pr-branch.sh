#!/bin/bash
set -eo pipefail

for DEP in $(ls *.rb | grep -v -e eosio -e doxygen); do
    for ARTIFACT in $(ls *.tar.gz | grep -e ${DEP%.*}); do
        HASH=$(shasum -a 256 $ARTIFACT | cut -f 1 -d ' ' )
        [[ $ARTIFACT =~ 'mojave' ]] && OSX_VERSION='mojave' || OSX_VERSION='catalina'
        LINE="sha256 \"$HASH\" => :$OSX_VERSION"
        echo $DEP $ARTIFACT $LINE
        awk -v awkvar="$LINE" '/cellar/ {print "    "awkvar;} 1' $DEP >> $DEP.tmp
        mv $DEP.tmp $DEP
    done
done

# Push new branch named 'cicd-$BUILDKITE_BRANCH' goes here.
cat *.rb
git status