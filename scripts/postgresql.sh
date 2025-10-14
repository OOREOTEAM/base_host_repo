#!/bin/bash

set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

apt install -y wget gnupg2 lsb-release 


wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list

apt install -y postgresql-14 nginx postgresql-client

systemctl enable postgresql
systemctl start postgresql