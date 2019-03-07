#!/usr/bin/env bash

# Store the RubyGems password in the credentials file
# when doing the CI build.  Assumes the CI build has
# a RUBYGEMS_API_KEY value setup.

mkdir -p ~/.gem
echo -e "---\r\n:rubygems_api_key: $RUBYGEMS_API_KEY" > ~/.gem/credentials
chmod 0600 /home/circleci/.gem/credentials
