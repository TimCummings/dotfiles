#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

if [[ -f id_rsa ]]; then
  "${SCRIPT_DIR}/setup_ssh.sh" || exit
else
  echo -e "\t\t${YELLOW}SSH key not found. Skipping SSH setup!${NONE}"
  exit 1
fi

"${SCRIPT_DIR}/setup_dependencies.sh" || exit

if command -v zsh &>/dev/null; then
  zsh -c "source '${SCRIPT_DIR}/setup_env.sh'" || exit
  zsh -c "${SCRIPT_DIR}/install_software.sh" || exit
else
  echo -e "${RED}Zsh not found, skipping env setup and software installation!"
fi
