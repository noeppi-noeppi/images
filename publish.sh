#!/bin/bash

function publish {
  local DATE="$(date +'%Y%m%d')"
  local DISCRIMINATOR=0
  local TAG_NAME="${DATE}"
  while docker manifest inspect "ghcr.io/noeppi-noeppi/images/${1}:${TAG_NAME}" > /dev/null 2> /dev/null; do
    DISCRIMINATOR=$((DISCRIMINATOR+1))
    TAG_NAME="${DATE}-${DISCRIMINATOR}"
  done
  docker tag "localhost/images/${1}:latest" "ghcr.io/noeppi-noeppi/images/${1}:${TAG_NAME}"
  docker push "ghcr.io/noeppi-noeppi/images/${1}:${TAG_NAME}"
  docker tag "localhost/images/${1}:latest" "ghcr.io/noeppi-noeppi/images/${1}:latest"
  docker push "ghcr.io/noeppi-noeppi/images/${1}:latest"
}

set -e

publish 'actions'
publish 'java17'
publish 'java21'
publish 'texlive'
