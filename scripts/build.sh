#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

brew install jfrog-cli

jfrog c add artifactory \
    --url="${artifactory_base_url}" \
    --user="${artifactory_username}" \
    --apikey="${artifactory_password}" \
    --artifactory-url="${artifactory_base_url}/artifactory" \
    --interactive=false

jfrog rt \
    gradle clean \
    artifactoryPublish -b build.gradle \
    --build-name=vdsfsda \
    --build-number=1 \
    -Pversion=1.1.0-SNAPSHOT
