#!/bin/bash

function publish {
  docker tag "localhost/images/${1}:latest" "ghcr.io/noeppi-noeppi/images/${1}:latest"
  docker push "ghcr.io/noeppi-noeppi/images/${1}:latest"
}

set -e

publish 'actions'
publish 'java17'
publish 'java21'
#publish 'texlive'
