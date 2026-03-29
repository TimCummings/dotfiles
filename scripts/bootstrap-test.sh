#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NONE='\033[0m'

IMAGE_NAME="test-ubuntu-ssh"
REMOTE=false

usage() {
  echo "Usage: $0 [-hr] [-k <key-file>]"
  echo -e "\t-h\tShow help"
  echo -e "\t-k\tMount SSH key"
  echo -e "\t-r\tRemote: pull remote dotfiles instead of copying local"
}

while getopts "hk:r" opt; do
  case $opt in
    h) usage; exit 0 ;;
    k) SSH_KEY_FILE=$OPTARG ;;
    r) REMOTE=true ;;
    *) usage; exit 1 ;;
  esac
done

BASE_CMD=(
  podman run --rm -it
    -w /home/testuser
    "$IMAGE_NAME"
    bash -c
)

BUILD_ARGS=()

if [[ -n "$SSH_KEY_FILE" ]]; then
  if [[ -f "$SSH_KEY_FILE" ]]; then
    STAGED_KEY=".staged_ssh_key"
    cp "$SSH_KEY_FILE" "$PWD/$STAGED_KEY"
    BUILD_ARGS+=(--build-arg SSH_KEY_FILE="$STAGED_KEY")
  else
    echo -e "${RED}SSH key not found!${NONE}"
    exit 1
  fi
fi

if [[ "$REMOTE" = true ]]; then
  BUILD_ARGS+=(--build-arg REMOTE=true)
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

podman build "${BUILD_ARGS[@]}" \
       -t "$IMAGE_NAME" \
       -f ./scripts/Dockerfile.test "$PWD"

[[ -n "$STAGED_KEY" ]] && rm -f "$PWD/$STAGED_KEY"

"${BASE_CMD[@]}" "${CONTAINER_CMD}"
