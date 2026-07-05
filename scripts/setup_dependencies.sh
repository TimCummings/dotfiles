#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NONE='\033[0m'

echo
echo "Checking dependencies..."

# echo -e "\tchezmoi..."
# if ! type "${HOME}/.local/bin/chezmoi" &> /dev/null; then
#   echo -e "\t\t${YELLOW}Chezmoi not found. Installing...${NONE}\n"
#   sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply git@github.com:TimCummings/dotfiles.git
#   echo -e "\t\t${GREEN}Done!${NONE}"
# fi

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

# echo -en "\tfish?"
# if type fish &> /dev/null; then
#   echo -e "\t\t\t${GREEN}found!${NONE}"
# else
#   echo -e "\t\t\t${RED}missing!${NONE}"
#   echo "Install fish, then try again."
#   exit 1
# fi
