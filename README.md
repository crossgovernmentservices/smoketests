[![Build Status](https://travis-ci.org/crossgovernmentservices/smoketests.svg?branch=master)](https://travis-ci.org/crossgovernmentservices/smoketests)

# Service Tests

Tests for cross government services.

## Prerequisites
1. Ruby
2. [PhantomJS](http://phantomjs.org/)

## Installing

First install phantomjs. (brew, npm or even just download binary from site above)

Install all dependencies with [Bundler](http://bundler.io/):

    bundle install

# Running the tests

Export the necessary BasicAuth credentials to your environment before you start:

    export HTTPBASICAUTH_USERNAME='redacted'
    export HTTPBASICAUTH_PASSWORD='redacted'

Run the test tasks with [Rake](https://github.com/jimweirich/rake):

    rake # defaults to 'devenv'
    rake features:devenv
    rake features:heroku
    rake features:aws

Or to run a specific feature:

    cucumber features/sample.feature

## Fixtures

You can add fixtures to [fixtures](fixtures/), or pull it from the web.

Add your fixture mappings to the [fixture mapping configuration](config/fixtures-lookup.txt).
