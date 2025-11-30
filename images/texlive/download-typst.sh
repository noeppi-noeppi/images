#!/bin/bash

# A script to install typst in /opt/typst

set -euo pipefail

TYPST_VERSION="${1}"
DOWNLOAD_URL="https://github.com/typst/typst/releases/download/v${TYPST_VERSION}/typst-x86_64-unknown-linux-musl.tar.xz"

mkdir -p "/opt/typst"
cd "/opt/typst"
curl -L --proto-redir "=https" "${DOWNLOAD_URL}" | tar -xJ --strip-components=1
