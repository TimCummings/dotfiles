#!/bin/bash

# this should be run from bootstrap.sh;
# be careful about running this directly without first verifying dependencies

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
# YELLOW=$(tput setaf 3)
NONE=$(tput sgr0)

apt_packages="tldr tmux"
asdf_plugins="direnv fd fzf golang lazygit neovim nodejs ripgrep shellcheck yarn"

echo
echo "Starting non-packages installation..."

########## ASDF ##########
# Periodically check the version number below and update it!
printf '    %-20s' asdf...
if type asdf &> /dev/null; then
  printf '\t%-10s\n' "${GREEN}found!${NONE}"
else
  printf '\t%-10s\n' "${RED}missing!${NONE}"
  echo "Installing asdf..."
  git clone https://github.com/asdf-vm/asdf.git "$XDG_DATA_HOME/asdf"
  cd "$XDG_DATA_HOME/.asdf" || exit
  git checkout "$(git describe --abbrev=0 --tags)"
  # shellcheck source=/dev/null
  source "$ASDF_DIR/asdf.sh"
fi

echo -e "    plugins..."

for plugin in $asdf_plugins; do
  printf '\t%-20s' "${plugin}..."
  if asdf current "$plugin" &> /dev/null; then
    printf '    %-10s\n' "${GREEN}found!${NONE}"
  else
    printf '    %-10s\n' "${RED}missing!${NONE}"
    echo "Installing ${plugin} plugin..."
    asdf plugin add "$plugin"
    asdf install "$plugin" latest
    asdf global "$plugin" latest
  fi
done

# these take a long time to install; do them manually:
# slow_asdf_plugins = "python ruby"



########## apt installs ##########
echo
echo -e "    apt packages..."
for package in $apt_packages; do
  printf '\t%-20s' "${package}..."
  if type "$package" &> /dev/null; then
    printf '    %-10s\n' "${GREEN}found!${NONE}"
  else
    printf '    %-10s\n' "${RED}missing!${NONE}"
    echo "Installing ${package}..."
    sudo apt install "$package"
  fi
done



echo
echo -e "    other..."
########## scripted installs ##########
printf '\t%-20s' "Starship prompt..."
if type starship &> /dev/null; then
  printf '    %-10s\n' "${GREEN}found!${NONE}"
else
  printf '    %-10s\n' "${RED}missing!${NONE}"
  echo "Installing starship prompt..."
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi



########## manual downloads ##########
# Periodically check the version number below and update it!
printf '\t%-20s' "Nnn file explorer..."
if type nnn-nerd-static &> /dev/null; then
  printf '    %-10s\n' "${GREEN}found!${NONE}"
else
  printf '    %-10s\n' "${RED}missing!${NONE}"
  echo "Installing Nnn file explorer..."
  curl -LO https://github.com/jarun/nnn/releases/download/v4.8/nnn-nerd-static-4.8.x86_64.tar.gz \
    && tar xf ./nnn-nerd-static-4.8.x86_64.tar.gz -C ~/.local/bin \
    && rm -f nnn-nerd-static-4.8.x86_64.tar.gz
fi

# maybe add fonts here?

exit 0
