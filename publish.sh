#!/bin/bash

function publish {
  docker tag "localhost/images/${1}:latest" "ghcr.io/noeppi-noeppi/images/${1}:latest"
  docker push "ghcr.io/noeppi-noeppi/images/${1}:latest"
  local COMMIT="$(git rev-parse --short HEAD)"
  if [[ ! -z "${COMMIT}" ]]; then
    docker tag "localhost/images/${1}:latest" "ghcr.io(noeppi-noeppi/images/${1}:${COMMIT}"
    docker push "ghcr.io/noeppi-noeppi/images/${1}:${COMMIT}"
  fi
}

set -e

publish 'actions'
publish 'java17'
publish 'java21'
publish 'texlive'
