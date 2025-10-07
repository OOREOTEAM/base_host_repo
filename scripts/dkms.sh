#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install dkms

sudo apt install ufw fail2ban unattended-upgrades
sudo dpkg-reconfigure unattended-upgrades

sudo apt install -y vim
