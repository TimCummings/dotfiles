#!/bin/bash

IMAGE_NAME="test-ubuntu-ssh"
REMOTE=false

while getopts "rh" opt; do
  case $opt in
    r) REMOTE=true ;;
    h) echo "Usage: $0 [-r]"; exit 0 ;;
    *) echo "Usage: $0 [-r]"; exit 1 ;;
  esac
done

if [[ ! -f "./id_rsa" ]]; then
  echo "Error: no SSH key provided."
  exit 1
fi

podman build -t "$IMAGE_NAME" -f ./scripts/test-container.dockerfile $PWD

if [[ "$REMOTE" = true ]]; then
  podman run --rm -it \
    -v "$PWD/id_rsa:/home/testuser/id_rsa:ro" \
    -w /home/testuser \
    "$IMAGE_NAME" \
    bash -c 'sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply https://github.com/TimCummings/dotfiles.git; exec bash'
else
  podman run --rm -it \
    -v "$PWD/id_rsa:/home/testuser/id_rsa:ro" \
    -w /home/testuser \
    "$IMAGE_NAME" \
    bash -c 'sh -c "$(curl -fsLS get.chezmoi.io/lb)"; ~/.local/bin/chezmoi apply; exec bash'
fi
