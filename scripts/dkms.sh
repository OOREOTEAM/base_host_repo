#!/bin/bash

set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get install -y --no-install-recommends software-properties-common apt-transport-https ca-certificates gnupg

sudo add-apt-repository -y universe
sudo add-apt-repository -y multiverse
sudo apt-get update