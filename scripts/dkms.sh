#!/bin/bash

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
  build-essential dkms linux-headers-$(uname -r) \
  bash-completion sudo vim nano less tree tar unzip jq wget curl ca-certificates \
  gnupg software-properties-common lsb-release man-db manpages


sudo apt-get install -y --no-install-recommends cloud-guest-utils cloud-initramfs-growroot gdisk nvme-cli


sudo apt-get install -y --no-install-recommends ufw fail2ban unattended-upgrades
sudo dpkg-reconfigure unattended-upgrades

wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install consul

sudo apt-get update

sudo apt-get install nano