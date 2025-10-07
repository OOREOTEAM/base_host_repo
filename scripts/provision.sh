#!/bin/bash

KEYS_DIR="/home/ubuntu/vm_keys"
AUTHORIZED_KEYS="/home/ubuntu/.ssh/authorized_keys"

mkdir -p /home/ubuntu/.ssh
AUTHORIZED_KEYS="/home/ubuntu/.ssh/authorized_keys"
chmod 600 "$AUTHORIZED_KEYS"

for key in "$KEYS_DIR"/*; do
  if [ -f "$key" ]; then
    cat "$key" >> "$AUTHORIZED_KEYS"
  fi
done

chown ubuntu:ubuntu "$AUTHORIZED_KEYS"