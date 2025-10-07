#!/bin/bash
set -e


sudo apt-get update
sudo apt-get install -y wget gnupg2 lsb-release


wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list


sudo apt-get update


sudo apt-get install -y postgresql-14


sudo systemctl enable postgresql
sudo systemctl start postgresql


psql --version

sudo apt install -y python3-psycopg2

sudo apt install nginx -y