#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NONE='\033[0m'

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

usage() {
  echo "Usage: $0 [-h] [-k <key-file>]"
  echo -e "\t-h\tShow help"
  echo -e "\t-k\tMount SSH key"
}

while getopts "hk:" opt; do
  case $opt in
    h) usage; exit 0 ;;
    k) SSH_KEY_FILE="$OPTARG" ;;
    *) usage; exit 1 ;;
  esac
done

if [[ -n "$SSH_KEY_FILE" ]]; then
  if [[ -f "$SSH_KEY_FILE" ]]; then
    "${SCRIPT_DIR}/setup_ssh.sh" "${SSH_KEY_FILE}" || exit
  else
    echo -e "\t\t${RED}SSH key not found!${NONE}"
    exit 1
  fi
else
  echo -e "\t\t${YELLOW}No SSH key provided. Skipping SSH setup!${NONE}"
fi

"${SCRIPT_DIR}/setup_dependencies.sh" || exit

if command -v zsh &>/dev/null; then
  zsh -c "source '${SCRIPT_DIR}/setup_env.sh'" || exit
  zsh -c "${SCRIPT_DIR}/install_software.sh" || exit
  echo -e "${YELLOW}REMINDER: logout for default shell change to be effective.${NONE}"
else
  echo -e "${RED}Zsh not found, skipping env setup and software installation!"
fi
