#!/bin/bash

function build {
  local IMG="${1}"
  shift
  docker build -t "localhost/images/${IMG}:latest" "$@"
}

set -e

build 'actions' images/actions
build 'java17' --build-arg="JDK=17" images/java
build 'java21' --build-arg="JDK=21" images/java
build 'texlive' images/texlive
