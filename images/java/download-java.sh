#!/bin/bash

# A script to fetch the latest eclipse temurin jdk for a java version from the foojay disco API
# and install it in /opt/java/jdk-{version}

set -e -o pipefail

JAVA_VERSION="${1}"
FOOJAY_URL="https://api.foojay.io/disco/v3.0/packages?package_type=jdk&version=${JAVA_VERSION}&operating_system=linux&architecture=x64&archive_type=tar.gz&distribution=temurin&lib_c_type=glibc"
if IFS=$'\n' read -rd "" -a DL_URLS <<< "$(curl -L "${FOOJAY_URL}" | jq -r '.result|.[]|.links|.pkg_download_redirect')"; then true; fi

if [[ "${#DL_URLS[@]}" == 0 ]]; then
  echo "No installation candidate for java ${JAVA_VERSION}"
  exit 1
elif [[ "${#DL_URLS[@]}" != 1 ]]; then
  echo "Multiple installation candidates for java ${JAVA_VERSION}"
  exit 1
else
  mkdir -p "/opt/java/jdk-${JAVA_VERSION}"
  cd "/opt/java/jdk-${JAVA_VERSION}"
  curl -L "${DL_URLS[0]}" | tar -xz --strip-components=1
fi
