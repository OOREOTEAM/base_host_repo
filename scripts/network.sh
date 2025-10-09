#!/usr/bin/env bash

set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y \
  iputils-ping \
  bind9-dnsutils \
  netcat-openbsd \
  tcpdump \
  net-tools \
  iotop \
  sysstat