# homebrew-eosio
The [homebrew-eosio](https://buildkite.com/EOSIO/homebrew-eosio) pipeline verifies that [EOSIO](https://github.com/EOSIO/eos) [Homebrew](https://brew.sh) packages for macOS are functional.

<details>
<summary>See More</summary>

## Index
1. [Test](README.md#test)
1. [Configuration](README.md#configuration)
   1. [Variables](README.md#variables)
   1. [Examples](README.md#examples)
1. [Pipelines](README.md#pipelines)
1. [See Also](README.md#see-also)

# Test
This pipeline will parse the [eosio.rb](https://github.com/EOSIO/homebrew-eosio/blob/master/eosio.rb) ruby file in the root of this repo and generate a pipeline step to run a clean Anka VM for each macOS version found. Each step performs the following:
1. Verify the SHA-256 of the bottle attached to the release on GitHub at `root_url` in the ruby file matches the hash defined in the ruby file
1. Tap EOSIO
   1. On master branch:
      ```bash
      brew tap EOSIO/eosio
      ```
   1. On any non-master branch:
      ```bash
      <configure local tap>
      brew tap <local repo>
      ```
1. Install EOSIO
   ```bash
   brew install eosio
   ```
1. Look for the `nodeos` binary
   ```bash
   which nodeos
   ```
1. Invoke the [full-version-label.sh](https://github.com/EOSIO/eos/blob/master/tests/full-version-label.sh) test on that binary.

All of these must pass for the Buildkite job step to pass.

# Configuration
There are no user-configurable options for this pipeline at this time.

## Variables
There are no configurable variables intended for the end-user at this time.

# See Also
- Buildkite
  - [DevDocs](https://github.com/EOSIO/devdocs/wiki/Buildkite)
  - [EOSIO Pipelines](https://github.com/EOSIO/eos/blob/master/.cicd/README.md)
  - [Run Your First Build](https://buildkite.com/docs/tutorials/getting-started#run-your-first-build)
- [#help-automation](https://blockone.slack.com/archives/CMTAZ9L4D) Slack Channel

</details>
