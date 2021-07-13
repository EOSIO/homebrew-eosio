#!/bin/bash
set -eo pipefail
echo '+++ :evergreen_tree: Configuring Environment' >&2
export ANKA_LAYERS='clean::cicd::git-ssh::nas::brew::buildkite-agent'
export AMKA_VM_MAP='{"mojave":"10.14.6_6C_14G_80G","catalina":"10.15.5_6C_14G_80G","big_sur":"11.2.1_6C_14G_80G"}'
export PACKAGE='eosio'
export RETRY="$([[ "$BUILDKITE" == 'true' ]] && buildkite-agent meta-data get pipeline-upload-retries --default '0' || echo '0')"
export RUBY_FILE='eosio.rb'
export TAG="v$(cat "$RUBY_FILE" | grep -P '^\s+version' | awk '{print $2}' | tr -d '"')"
export TAP='EOSIO/eosio'
[[ "$BUILDKITE" == 'true' ]] && buildkite-agent meta-data set pipeline-upload-retries "$(( $RETRY + 1 ))"
# only run on master
if [[ "$BUILDKITE_BRANCH" != 'master' && "$DEBUG" != 'true' ]]; then
    ERROR_MSG='This pipeline currently does nothing on branches besides `master`!'
    echo "ERROR: $ERROR_MSG" | tr -d '`' | cat >&2
    [[ "$BUILDKITE" == 'true' && "$RETRY" == '0' ]] && echo "**ERROR:** $ERROR_MSG" | buildkite-agent annotate --style 'error' --context 'not-master'
    exit 1
elif [[ "$DEBUG" == 'true' ]]; then
    WARNING_MSG='Running on non-`master` branch because `DEBUG` is set to "true".'
    echo "WARNING: $WARNING_MSG" | tr -d '`' | cat >&2
    [[ "$BUILDKITE" == 'true' && "$RETRY" == '0' ]] && echo "**WARNING:** $WARNING_MSG" | tr '"' '`' | buildkite-agent annotate --style 'warning' --context 'not-master'
fi
echo '+++ :yaml: Generating Pipeline Steps' >&2
# yaml header
cat <<EOF
steps:
  - wait

EOF
# parse ruby file and generate pipeline steps
export LABEL='Homebrew Package Validation'
for OS in $(cat "$RUBY_FILE" | grep -P '^\s+sha256' | awk '{print $2}' | tr -d ':'); do
    export OS="$OS" # for jq env command
    export OS_STYLIZED="$(echo "$OS" | sed -e 's/\b\(.\)/\u\1/g')"
    echo "Found $OS operating system." >&2
    export VM="$(echo "$AMKA_VM_MAP" | jq -r '.[env.OS]')"
    cat .ci/anka.yml | envsubst '$ANKA_LAYERS $BUILDKITE_PIPELINE_SLUG $BUILDKITE_REPO $LABEL $OS_STYLIZED $PACKAGE $TAG $TAP $VM'
done
echo '--- :white_check_mark: Done! Good luck :)' >&2
