#!/bin/bash

set -e -o pipefail

DATE="$(date +'%Y%m%d')"
ACTIONS=("$@")

function arrayContains {
  local ELEM MATCH="${1}"
  shift
  for ELEM; do [[ "${ELEM}" == "${MATCH}" ]] && return 0; done
  return 1
}

function build {
  local IMG="${1}"
  shift
  if arrayContains "build" "${ACTIONS[@]}"; then
    docker build --pull -t "ghcr.io/noeppi-noeppi/images/${IMG}:latest" "$@"
  fi
  if arrayContains "publish" "${ACTIONS[@]}"; then
    local DISCRIMINATOR=0
    local TAG_NAME="${DATE}"
    while docker manifest inspect "ghcr.io/noeppi-noeppi/images/${IMG}:${TAG_NAME}" > /dev/null 2> /dev/null; do
      DISCRIMINATOR=$((DISCRIMINATOR+1))
      TAG_NAME="${DATE}-${DISCRIMINATOR}"
    done
    docker tag "ghcr.io/noeppi-noeppi/images/${IMG}:latest" "ghcr.io/noeppi-noeppi/images/${IMG}:${TAG_NAME}"
    docker push "ghcr.io/noeppi-noeppi/images/${IMG}:${TAG_NAME}"
    docker push "ghcr.io/noeppi-noeppi/images/${IMG}:latest"
  fi
}

if [[ "${#ACTIONS[@]}" -eq 0 ]]; then
  echo "No action."
  echo "Usage: ${0} <build|publish>..."
  exit 1
fi
for ACTION in "${ACTIONS[@]}"; do
  if [[ "${ACTION}" != "build" && "${ACTION}" != "publish" ]]; then
    echo "Usage: ${0} <build|publish>..."
    exit 1
  fi
done

build 'actions' images/actions
build 'java17' --build-arg="JDK=17" images/java
build 'java21' --build-arg="JDK=21" images/java
build 'java25' --build-arg="JDK=25" images/java
build 'texlive' images/texlive
