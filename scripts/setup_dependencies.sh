#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NONE='\033[0m'

echo
echo "Checking dependencies..."

echo -e "\tzsh..."
if type zsh &> /dev/null; then
  echo -e "\t\t${GREEN}Found!${NONE}"
else
  echo -e "\t\t${YELLOW}Zsh not found. Installing...${NONE}\n"
  sudo apt-get update
  sudo apt-get install -y zsh
fi

if [[ "$(basename "$SHELL")" != "zsh" ]]; then
  echo -e "\t\t${YELLOW}Zsh not default login shell. Setting...${NONE}"
  sudo chsh -s "$(command -v zsh)" "$(whoami)"
fi
