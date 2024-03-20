#!/bin/bash

function build {
  local IMG="${1}"
  shift
  docker build -t "localhost/images/${IMG}:latest" "$@"
}

set -e

build 'actions' images/actions
build 'java17' --build-arg="JDK=jdk-17.0.10%2B7/OpenJDK17U-jdk_x64_linux_hotspot_17.0.10_7.tar.gz" images/java
build 'java21' --build-arg="JDK=jdk-21.0.2%2B13/OpenJDK21U-jdk_x64_linux_hotspot_21.0.2_13.tar.gz" images/java
#build 'texlive' images/texlive
