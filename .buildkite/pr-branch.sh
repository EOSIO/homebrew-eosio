#!/bin/bash
set -eo pipefail

# ls -la
# git status

for DEP in $(ls *.rb | grep -v -e eosio -e doxygen); do
    for ARTIFACT in $(ls *.tar.gz | grep -e ${DEP%.*}); do
        HASH=$(shasum -a 256 $ARTIFACT )
        [[ $ARTIFACT =~ 'mojave' ]] && OSX_VERSION='mojave' || OSX_VERSION='catalina'
        LINE="sha256 \"$HASH\" => :$OSX_VERSION"
        echo $DEP $ARTIFACT $LINE
    done
    # Write $LINE to appropriate location in file.
    awk -v awkvar="$LINE" '/cellar/ {print "    "awkvar;} 1' $DEP >> $DEP.tmp
    mv $DEP.tmp $DEP
done

# Push new branch named 'cicd-$BUILDKITE_BRANCH' goes here.
# git status