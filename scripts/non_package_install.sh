#!/bin/bash

# this should be run from bootstrap.sh;
# be careful about running this directly without first verifying dependencies

RED='\033[0;31m'
GREEN='\033[0;32m'
# YELLOW='\033[0;33m'
NONE='\033[0m'


apt_packages="tldr tmux"
asdf_plugins="direnv fd fzf golang lazygit neovim nodejs ripgrep shellcheck yarn"

echo
echo "Starting non-packages installation..."

########## ASDF ##########
# Periodically check the version number below and update it!
echo -en "\tasdf..."
if type asdf &> /dev/null; then
  echo -e "\t\t${GREEN}found!${NONE}"
else
  echo -e "\t\t${RED}missing!${NONE}"
  echo "Installing asdf..."
  git clone https://github.com/asdf-vm/asdf.git "$XDG_DATA_HOME/asdf"
  cd "$XDG_DATA_HOME/.asdf" || exit
  git checkout "$(git describe --abbrev=0 --tags)"
  # shellcheck source=/dev/null
  source "$ASDF_DIR/asdf.sh"
fi

echo -e "\tplugins..."

for plugin in $asdf_plugins; do
  echo -en "\t\t${plugin}..."
  if asdf current "$plugin" &> /dev/null; then
    echo -e "\t${GREEN}found!${NONE}"
  else
    echo -e "\t${RED}missing!${NONE}"
    echo "Installing ${plugin} plugin..."
    asdf plugin add "$plugin"
    asdf install "$plugin" latest
    asdf global "$plugin" latest
  fi
done

# these take a long time to install; do them manually:
# slow_asdf_plugins = "python ruby"



########## apt installs ##########
for package in $apt_packages; do
  echo -en "\t${package}..."
  if type "$package" &> /dev/null; then
    echo -e "\t${GREEN}found!${NONE}"
  else
    echo -e "\t${RED}missing!${NONE}"
    echo "Installing ${package}..."
    sudo apt install "$package"
  fi
done



########## scripted installs ##########
echo -en "\tstarship prompt..."
if type starship &> /dev/null; then
  echo -e "\t${GREEN}found!${NONE}"
else
  echo -e "\t${RED}missing!${NONE}"
  echo "Installing starship prompt..."
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi



########## manual downloads ##########
# Periodically check the version number below and update it!
echo -en "\tNnn file explorer..."
if type nnn-nerd-static &> /dev/null; then
  echo -e "\t${GREEN}found!${NONE}"
else
  echo -e "\t${RED}missing!${NONE}"
  echo "Installing Nnn file explorer..."
  curl -LO https://github.com/jarun/nnn/releases/download/v4.8/nnn-nerd-static-4.8.x86_64.tar.gz \
    && tar xf ./nnn-nerd-static-4.8.x86_64.tar.gz -C ~/.local/bin \
    && rm -f nnn-nerd-static-4.8.x86_64.tar.gz
fi

# maybe add fonts here?

exit 0
