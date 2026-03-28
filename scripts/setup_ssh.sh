#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NONE='\033[0m'

echo
echo -n "Setting up SSH..."

key_file="$1"
# if [[ ! -f "$key_file" ]]; then
#   echo -e "\t\t${RED}Error: key file not found: ${key_file}${NONE}"
#   exit 1
# fi

# ensure .ssh directory exists
mkdir -p "${HOME}/.ssh"
chmod 700 "${HOME}/.ssh"

# handle private key file
file_name=$(basename "$key_file")
umask 077
cp "$key_file" "${HOME}/.ssh/${file_name}"
chmod 600 "${HOME}/.ssh/${file_name}"

# install SSH client if it's missing
if ! command -v ssh-add &>/dev/null; then
  echo -e "${YELLOW}SSH client not found. Installing...${NONE}"
  sudo apt install openssh-client
fi

# start the ssh agent if it's not running
if [[ -z "$SSH_AUTH_SOCK" ]]; then
  eval "$(ssh-agent -s)"
fi

# add the key to the agent unless it's already listed
if ssh-add -l | grep -q "$(ssh-keygen -lf ~/.ssh/"${file_name}" 2>/dev/null | awk '{print $2}')"; then
  echo -e "\t\t${YELLOW}Key already added, skipping.${NONE}"
else
  ssh-add "${HOME}/.ssh/${file_name}"
  echo -e "\t\t${GREEN}Key added.${NONE}"
fi

# copy or generate the public key
if [[ -f "${key_file}.pub" ]]; then
  echo "Copying public key file..."
  cp "${key_file}.pub" "${HOME}/.ssh/${file_name}.pub"
  chmod 644 "${HOME}/.ssh/${file_name}.pub"
else
  echo "Public key not found. Generating..."
  ssh-keygen -y -f "${HOME}/.ssh/${file_name}" > "${HOME}/.ssh/${file_name}.pub"
fi

echo -e "\t\t${GREEN}done!${NONE}"

exit 0
