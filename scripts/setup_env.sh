#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NONE='\033[0m'

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
  echo -e "\t\t${YELLOW}missing!${NONE}"
  mkdir -pv "$XDG_DATA_HOME"
fi

echo -n "XDG CACHE HOME..."
if [ -d "$XDG_CACHE_HOME" ]; then
  echo -e "\t\t${GREEN}found!${NONE}"
else
  echo -e "\t\t${YELLOW}missing!${NONE}"
  mkdir -pv "$XDG_CACHE_HOME"
fi

echo -n "XDG CONFIG HOME..."
if [ -d "$XDG_CONFIG_HOME" ]; then
  echo -e "\t\t${GREEN}found!${NONE}"
else
  echo -e "\t\t${YELLOW}missing!${NONE}"
  mkdir -pv "$XDG_CONFIG_HOME"
fi

echo

exit 0
