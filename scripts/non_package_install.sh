#!/bin/zsh

# this should be run from bootstrap.sh;
# be careful about running this directly without first verifying dependencies

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NONE='\033[0m'

echo
echo "Starting non-packages installation..."

# Periodically check the version number below and update it!
echo -en "\tasdf..."
if type asdf &> /dev/null; then
  echo -e "\t\t${GREEN}found!${NONE}"
else
  echo -e "\t\t${RED}missing!${NONE}"
  echo "Installing asdf..."
  git clone https://github.com/asdf-vm/asdf.git "$XDG_DATA_HOME/asdf" --branch v0.8.1
  source $ASDF_DIR/asdf.sh
fi

echo -e "\t\tplugins..."
echo -en "\t\t\tdirenv..."
if asdf which direnv &> /dev/null; then
  echo -e "\t${GREEN}found!${NONE}"
else
  echo -e "\t${RED}missing!${NONE}"
  echo "Installing direnv plugin..."
  asdf plugin add direnv
  asdf install direnv latest
  asdf global direnv latest
fi

echo -en "\t\t\truby..."
if asdf which ruby &> /dev/null; then
  echo -e "\t\t${GREEN}found!${NONE}"
else
  echo -e "\t\t${RED}missing!${NONE}"
  echo "Installing ruby plugin..."
  asdf plugin add ruby
  asdf install ruby latest
  asdf global ruby latest
fi

echo -en "\t\t\tnodejs..."
if asdf which node &> /dev/null; then
  echo -e "\t${GREEN}found!${NONE}"
else
  echo -e "\t${RED}missing!${NONE}"
  echo "Installing nodejs plugin..."
  asdf plugin add nodejs
  asdf install nodejs latest
  asdf global nodejs latest
fi

echo -en "\t\t\tyarn..."
if asdf which yarn &> /dev/null; then
  echo -e "\t\t${GREEN}found!${NONE}"
else
  echo -e "\t\t${RED}missing!${NONE}"
  echo "Installing yarn plugin..."
  asdf plugin add yarn
  asdf install yarn latest
  asdf global yarn latest
fi

echo -en "\t\t\tpython..."
if asdf which python &> /dev/null; then
  echo -e "\t${GREEN}found!${NONE}"
else
  echo -e "\t${RED}missing!${NONE}"
  echo "Installing python plugin..."
  asdf plugin add python
  asdf install python latest
  asdf global python latest
fi

echo -en "\tstarship prompt..."
if type starship &> /dev/null; then
  echo -e "\t${GREEN}found!${NONE}"
else
  echo -e "\t${RED}missing!${NONE}"
  echo "Installing starship prompt..."
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi

# maybe add fonts and nnn here?

exit 0
