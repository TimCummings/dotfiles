#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
# YELLOW='\033[0;33m'
NONE='\033[0m'

echo
echo "Checking dependencies..."

echo -en "\tchezmoi?"
if type chezmoi &> /dev/null; then
  echo -e "\t\t${GREEN}found!${NONE}"
else
  echo -e "\t\t${RED}missing!${NONE}"
  echo "Install chezmoi, then try again - see dotfiles README."
fi
echo -en "\tchezmoi config?"
if [ -d ~/.local/share/chezmoi ]; then
  echo -e "\t\t${GREEN}found!${NONE}"
else
  echo -e "\t\t${RED}missing!${NONE}"
  echo "Init and apply chezmoi, then try again - see dotfiles README."
  exit 1
fi

echo -en "\tzsh?"
if type zsh &> /dev/null; then
  echo -e "\t\t\t${GREEN}found!${NONE}"
else
  echo -e "\t\t\t${RED}missing!${NONE}"
  echo "Install zsh, then try again."
  exit 1
fi

# setup environment
echo
echo -n "Checking environment..."
# shellcheck source=/dev/null
source ~/.zshenv

echo
echo "Checking XDG directories..."
echo -n "XDG DATA HOME..."
if [ -d "$XDG_DATA_HOME" ]; then
  echo -e "\t\t${GREEN}found!${NONE}"
else
  echo -e "\t\t${RED}missing!${NONE}"
  mkdir -pv "$XDG_DATA_HOME"
fi

echo -n "XDG CACHE HOME..."
if [ -d "$XDG_CACHE_HOME" ]; then
  echo -e "\t\t${GREEN}found!${NONE}"
else
  echo -e "\t\t${RED}missing!${NONE}"
  mkdir -pv "$XDG_CACHE_HOME"
fi

echo -n "XDG CONFIG HOME..."
if [ -d "$XDG_CONFIG_HOME" ]; then
  echo -e "\t\t${GREEN}found!${NONE}"
else
  echo -e "\t\t${RED}missing!${NONE}"
  mkdir -pv "$XDG_CONFIG_HOME"
fi

echo
echo -e "${GREEN}Bootstrapping successful!${NONE}"

echo
echo "Handing off to non-package installation script..."
# shellcheck source=/dev/null
source ./scripts/non_package_install.sh

exit 0
