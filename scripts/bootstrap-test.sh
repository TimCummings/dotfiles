#!/bin/bash

IMAGE_NAME="test-ubuntu-ssh"
MOUNT_SSH_KEY=false
REMOTE=false

usage() {
  echo "Usage: $0 [-hkr]"
  echo -e "\t-h\tShow help"
  echo -e "\t-k\tMount SSH key"
  echo -e "\t-r\tRemote: pull remote dotfiles instead of copying local"
  exit 0
}

while getopts "hkr" opt; do
  case $opt in
    h) usage ;;
    k) MOUNT_SSH_KEY=true ;;
    r) REMOTE=true ;;
    *) usage ;;
  esac
done

podman build -t "$IMAGE_NAME" -f ./scripts/Dockerfile.test $PWD

MOUNT_SSH_KEY_FLAG=()
if [[ "$MOUNT_SSH_KEY" = true ]]; then
  MOUNT_SSH_KEY_FLAG=(-v "$PWD/id_rsa:/home/testuser/id_rsa:ro")
fi

BASE_CMD=(
  podman run --rm -it
    "${MOUNT_SSH_KEY_FLAG[@]}"
    -w /home/testuser
    "$IMAGE_NAME"
    bash -c
)

if [[ "$REMOTE" = true ]]; then
  # pull remote dotfiles for chezmoi init
  CONTAINER_CMD='sh -c "$(curl -fsLS get.chezmoi.io/lb)" \
    -- init --apply https://github.com/TimCummings/dotfiles.git; \
    exec bash'
else
  # copy local dotfiles for chezmoi apply (to test local changes before pushing)
  CONTAINER_CMD='sh -c "$(curl -fsLS get.chezmoi.io/lb)"; \
    ~/.local/bin/chezmoi apply; \
    exec bash'
fi

"${BASE_CMD[@]}" "${CONTAINER_CMD}"
