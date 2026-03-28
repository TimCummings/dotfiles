#!/bin/bash

# mounted volumes are owned by root as default; change ownership to testuser
sudo chown testuser:testuser /home/testuser/.local
sudo chown testuser:testuser /home/testuser/.local/share

# pass execution control back to input command from `podman run`
exec "$@"
