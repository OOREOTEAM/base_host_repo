#!/usr/bin/env bash
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y --no-install-recommends \
  ca-certificates curl gnupg lsb-release software-properties-common

add-apt-repository -y universe || true
add-apt-repository -y multiverse || true


apt-get update -y
