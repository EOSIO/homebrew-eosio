#!/bin/bash
set -eo pipefail
echo '+++ :evergreen_tree: Configuring Environment' >&2
export ANKA_LAYERS='clean::cicd::git-ssh::nas::brew::buildkite-agent'
export AMKA_VM_MAP='{"mojave":"10.14.6_6C_14G_80G","catalina":"10.15.5_6C_14G_80G","big_sur":"11.2.1_6C_14G_80G"}'
export BIN='nodeos'
export PACKAGE='eosio'
export REPO_UNDER_TEST='git@github.com:EOSIO/eos.git'
export RETRY="$([[ "$BUILDKITE" == 'true' ]] && buildkite-agent meta-data get pipeline-upload-retries --default '0' || echo '0')"
export RUBY_FILE='eosio.rb'
export ROOT_URL="$(cat "$RUBY_FILE" | grep -P '^\s+root_url' | head -1 | awk '{print $2}' | tr -d '"')"
echo "Found root URL \"$ROOT_URL\"." >&2
export TAG="v$(cat "$RUBY_FILE" | grep -P '^\s+version' | awk '{print $2}' | tr -d '"')"
echo "Found git tag '$TAG'." >&2
export TAP='EOSIO/eosio'
[[ "$BUILDKITE" == 'true' ]] && buildkite-agent meta-data set pipeline-upload-retries "$(( $RETRY + 1 ))"
# attach pipeline documentation
echo '+++ :md: Attaching Documentation'
export DOCS_URL="https://github.com/EOSIO/homebrew-eosio/blob/${BUILDKITE_COMMIT:-master}/.ci/README.md"
if [[ "$BUILDKITE" == 'true' && "$RETRY" == '0' ]]; then
    echo "This documentation is also available on [GitHub]($DOCS_URL)." | buildkite-agent annotate --append --style 'info' --context 'documentation'
    cat .ci/README.md | buildkite-agent annotate --append --style 'info' --context 'documentation'
elif [[ "$BUILDKITE" == 'true' ]]; then
    printf "Skipping \033]1339;url=$DOCS_URL;content=documentation\a upload for job retry number $RETRY.\n" >&2
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
    export BOTTLE="eosio-$(echo "$TAG" | tr -d 'v').$OS.bottle.tar.gz"
    export OS="$OS" # for jq env command
    export OS_STYLIZED="$(echo "$OS" | sed -e 's/\b\(.\)/\u\1/g')"
    echo "Found $OS operating system." >&2
    export VM="$(echo "$AMKA_VM_MAP" | jq -r '.[env.OS]')"
    cat .ci/anka.yml | envsubst '$ANKA_LAYERS $BIN $BOTTLE $BUILDKITE_PIPELINE_SLUG $BUILDKITE_REPO $LABEL $OS $OS_STYLIZED $PACKAGE $REPO_UNDER_TEST $ROOT_URL $RUBY_FILE $TAG $TAP $VM'
done
echo '--- :white_check_mark: Done! Good luck :)' >&2
echo 'Done.' >&2
