#!/bin/bash

set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y --no-install-recommends software-properties-common apt-transport-https ca-certificates gnupg

add-apt-repository -y universe
add-apt-repository -y multiverse
apt-get update