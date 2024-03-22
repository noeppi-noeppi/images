#!/bin/bash

function publish {
  docker tag "localhost/images/${1}:latest" "ghcr.io/noeppi-noeppi/images/${1}:latest"
  docker push "ghcr.io/noeppi-noeppi/images/${1}:latest"
  local COMMIT_COUNT="$(git rev-list HEAD --count)"
  if [[ "$(git rev-parse --symbolic-full-name HEAD)" == "refs/heads/master" && ! -z "${COMMIT_COUNT}" ]]; then
    docker tag "localhost/images/${1}:latest" "ghcr.io/noeppi-noeppi/images/${1}:${COMMIT_COUNT}"
    docker push "ghcr.io/noeppi-noeppi/images/${1}:${COMMIT_COUNT}"
  fi
}

set -e

publish 'actions'
publish 'java17'
publish 'java21'
publish 'texlive'
