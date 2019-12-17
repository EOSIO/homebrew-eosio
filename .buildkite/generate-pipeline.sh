#!/bin/bash
set -eo pipefail

echo '  - wait'
echo ''
for DEP in $(ls *.rb | grep -v -e eosio -e doxygen); do
    cat <<EOF 
  - label: ":hammer: Mojave Bottle | ${DEP%.*}"
    command:
      - "git clone $BUILDKITE_REPO homebrew-eosio && cd homebrew-eosio && git checkout -f $BUILDKITE_COMMIT"
      - "cd homebrew-eosio && ./.buildkite/build-bottle.sh ${DEP%.*}"
      - "cd homebrew-eosio && buildkite-agent artifact upload *.tar.gz"
    if: build.branch !~ /^cicd-/
    plugins:
      - chef/anka#v0.5.5:
          no-volume: true
          inherit-environment-vars: true
          vm-name: "10.14.6_6C_14G_40G"
          vm-registry-tag: "clean::cicd::git-ssh::nas::brew::buildkite-agent"
          always-pull: true
          debug: true
          wait-network: true
          failover-registries:
            - 'registry_1'
            - 'registry_2'
          pre-execute-sleep: 10
      - thedyrt/skip-checkout#v0.1.1:
          cd: ~
    agents:
      queue: mac-anka-node-fleet

  - label: ":hammer: Catalina Bottle | ${DEP%.*}"
    command:
      - "git clone $BUILDKITE_REPO homebrew-eosio && cd homebrew-eosio && git checkout -f $BUILDKITE_COMMIT"
      - "cd homebrew-eosio && ./.buildkite/build-bottle.sh ${DEP%.*}"
      - "cd homebrew-eosio && buildkite-agent artifact upload *.tar.gz"
    if: build.branch !~ /^cicd-/
    plugins:
      - chef/anka#v0.5.5:
          no-volume: true
          inherit-environment-vars: true
          vm-name: "10.15.1_6C_14G_40G"
          vm-registry-tag: "clean::cicd::git-ssh::nas::brew::buildkite-agent"
          always-pull: true
          debug: true
          wait-network: true
          failover-registries:
            - 'registry_1'
            - 'registry_2'
          pre-execute-sleep: 10
      - thedyrt/skip-checkout#v0.1.1:
          cd: ~
    agents:
      queue: mac-anka-node-fleet

EOF
done

echo '  - wait'
echo ''
cat <<EOF 
  - label: ":rocket: Create Branch for PR"
    command:
      - "git clone $BUILDKITE_REPO homebrew-eosio && cd homebrew-eosio && git checkout $BUILDKITE_BRANCH"
EOF
for DEP in $(ls *.rb | grep -v -e eosio -e doxygen); do
    cat <<EOF
      - "cd homebrew-eosio && buildkite-agent artifact download *.tar.gz . --step ':hammer: Mojave Bottle | ${DEP%.*}'"
      - "cd homebrew-eosio && buildkite-agent artifact download *.tar.gz . --step ':hammer: Catalina Bottle | ${DEP%.*}'"
EOF
done
cat <<EOF
      - "cd homebrew-eosio && ./.buildkite/pr-branch.sh"
    if: build.branch !~ /^cicd-/
    plugins:
      - chef/anka#v0.5.5:
          no-volume: true
          inherit-environment-vars: true
          vm-name: "10.15.1_6C_14G_40G"
          vm-registry-tag: "clean::cicd::git-ssh::nas::brew::buildkite-agent"
          always-pull: true
          debug: true
          wait-network: true
          failover-registries:
            - 'registry_1'
            - 'registry_2'
          pre-execute-sleep: 10
      - thedyrt/skip-checkout#v0.1.1:
          cd: ~
    agents:
      queue: mac-anka-node-fleet

EOF

echo '  - wait'
echo ''
for DEP in $(ls *.rb | grep -v -e eosio -e doxygen); do
    cat <<EOF
  - label: ":llama: Test Mojave Bottle | ${DEP%.*}"
    command:
      - "git clone $BUILDKITE_REPO homebrew-eosio && cd homebrew-eosio && git checkout -f $BUILDKITE_COMMIT"
      - "cd homebrew-eosio && ./.buildkite/test-bottle.sh ${DEP%.*}"
    if: build.branch =~ /^cicd-/
    plugins:
      - chef/anka#v0.5.5:
          no-volume: true
          inherit-environment-vars: true
          vm-name: "10.14.6_6C_14G_40G"
          vm-registry-tag: "clean::cicd::git-ssh::nas::brew::buildkite-agent"
          always-pull: true
          debug: true
          wait-network: true
          failover-registries:
            - 'registry_1'
            - 'registry_2'
          pre-execute-sleep: 10
      - thedyrt/skip-checkout#v0.1.1:
          cd: ~
    agents:
      queue: mac-anka-node-fleet

  - label: ":llama: Test Catalina Bottle | ${DEP%.*}"
    command:
      - "git clone $BUILDKITE_REPO homebrew-eosio && cd homebrew-eosio && git checkout -f $BUILDKITE_COMMIT"
      - "cd homebrew-eosio && ./.buildkite/test-bottle.sh ${DEP%.*}"
    if: build.branch =~ /^cicd-/
    plugins:
      - chef/anka#v0.5.5:
          no-volume: true
          inherit-environment-vars: true
          vm-name: "10.15.1_6C_14G_40G"
          vm-registry-tag: "clean::cicd::git-ssh::nas::brew::buildkite-agent"
          always-pull: true
          debug: true
          wait-network: true
          failover-registries:
            - 'registry_1'
            - 'registry_2'
          pre-execute-sleep: 10
      - thedyrt/skip-checkout#v0.1.1:
          cd: ~
    agents:
      queue: mac-anka-node-fleet
EOF
done