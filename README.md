# homebrew-eosio
This repository is a "[tap](https://docs.brew.sh/Taps)" for [Homebrew](https://brew.sh), a macOS package manager. When you run `brew install eosio` or `brew upgrade`, `brew` will look here to determine where to find the latest macOS binaries for [EOSIO](https://github.com/EOSIO/eos).

The [homebrew-eosio](https://buildkite.com/EOSIO/homebrew-eosio) pipeline runs against the `master` branch of this repo to verify that the [EOSIO](https://github.com/EOSIO/eos) packages we are providing via `brew` can be installed and invoked without errors on clean installations of their respective macOS versions. It also verifies the SHA-256 of the bottle matches the tap here, and the version string of the binary matches our CMake.

## Automation
The [eosioBrewAutoPR](https://github.com/EOSIO/auto-events-subscribers/blob/master/lambdas/eosioBrewAutoPR.js) [lambda](https://en.wikipedia.org/wiki/AWS_Lambda) recieves a [webhook](https://en.wikipedia.org/wiki/Webhook) (event notification) any time a Buildkite step finishes across the [EOSIO organization](http://buildkite.com/EOSIO).

If the following conditions are met by a Buildkite step...
- The job step [passed](https://github.com/EOSIO/auto-events-subscribers/blob/eb88bc9ea9f1ea32d56ee7151b87a9d08a4b4458/lambdas/eosioBrewAutoPR.js#L44)
- The step label [includes](https://github.com/EOSIO/auto-events-subscribers/blob/eb88bc9ea9f1ea32d56ee7151b87a9d08a4b4458/lambdas/eosioBrewAutoPR.js#L56) "brew updater", case-insensitive
- The [`BUILDKITE_TAG`](https://github.com/EOSIO/auto-events-subscribers/blob/eb88bc9ea9f1ea32d56ee7151b87a9d08a4b4458/lambdas/eosioBrewAutoPR.js#L65) environment variable is [equivalent](https://github.com/EOSIO/auto-events-subscribers/blob/eb88bc9ea9f1ea32d56ee7151b87a9d08a4b4458/lambdas/eosioBrewAutoPR.js#L92) to the [latest tag](https://github.com/EOSIO/auto-events-subscribers/blob/eb88bc9ea9f1ea32d56ee7151b87a9d08a4b4458/lambdas/eosioBrewAutoPR.js#L88) on [GitHub](https://github.com/EOSIO/auto-events-subscribers/blob/eb88bc9ea9f1ea32d56ee7151b87a9d08a4b4458/lambdas/eosioBrewAutoPR.js#L78) that [matches](https://github.com/EOSIO/auto-events-subscribers/blob/eb88bc9ea9f1ea32d56ee7151b87a9d08a4b4458/lambdas/eosioBrewAutoPR.js#L84) the pearl-compatible regular expression (PCRE) `^v[0-9]+\.[0-9]+\.[0-9]+$`
  - The regular expression is intended to filter out release candidates (`v2.1.0-rc1`), alphas (`v2.1.0-alpha`), betas (`v2.1.0-beta`), etc.

...then the lambda will attempt to:
1. [Download](https://github.com/EOSIO/auto-events-subscribers/blob/eb88bc9ea9f1ea32d56ee7151b87a9d08a4b4458/lambdas/eosioBrewAutoPR.js#L95) an artifact from the step called `eosio.rb`
2. [Checkout](https://github.com/EOSIO/auto-events-subscribers/blob/eb88bc9ea9f1ea32d56ee7151b87a9d08a4b4458/lambdas/eosioBrewAutoPR.js#L116) a new branch
3. [Update](https://github.com/EOSIO/auto-events-subscribers/blob/eb88bc9ea9f1ea32d56ee7151b87a9d08a4b4458/lambdas/eosioBrewAutoPR.js#L142) the `eosio.rb` file [here](https://github.com/EOSIO/homebrew-eosio/blob/master/eosio.rb) in this repo on the feature branch
4. [Open](https://github.com/EOSIO/auto-events-subscribers/blob/eb88bc9ea9f1ea32d56ee7151b87a9d08a4b4458/lambdas/eosioBrewAutoPR.js#L153) a pull request using the @blockone-devops account, like [this](https://github.com/EOSIO/homebrew-eosio/pull/45)
5. [Request](https://github.com/EOSIO/auto-events-subscribers/blob/eb88bc9ea9f1ea32d56ee7151b87a9d08a4b4458/lambdas/eosioBrewAutoPR.js#L164) a peer-review on the pull request

Once the pull request is merged to `master`, `brew` will use the new version indicated by the `root_url` field in the `eosio.rb` file.

## Manual
Every once in a while something might go wrong, such as a tagged build being run against the wrong commit or degraded service from one of our service providers. In these cases, this repo will have to be updated manually following the process above.

Simply download the `eosio.rb` file from the [Brew Updater](https://buildkite.com/EOSIO/eosio/builds/27244#7a324456-6482-4208-8ed4-07c0fdb5f25b) step in the [tagged eosio build](https://buildkite.com/EOSIO/eosio/builds/27244), checkout a new branch in this repo, update the [`eosio.rb` file](https://github.com/EOSIO/homebrew-eosio/blob/master/eosio.rb) in the root of this repo, open a pull request like [this](https://github.com/EOSIO/homebrew-eosio/pull/47), obtain peer-review, and get it [merged](https://github.com/EOSIO/homebrew-eosio/commit/ca60382ff69a513ae452178cda6ac4536564b52e).
