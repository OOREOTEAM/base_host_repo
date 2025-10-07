#!/bin/bash

set -eu

sudo apt install -y wget gnupg2 lsb-release


wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list

sudo apt install -y postgresql-14 python3-psycopg2 nginx

sudo systemctl enable postgresql
sudo systemctl start postgresql