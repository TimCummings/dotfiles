#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
# YELLOW=$(tput setaf 3)
NONE=$(tput sgr0)

echo
echo "Starting software installation..."

########## apt installs ##########
echo
echo -e "\tapt packages..."
xargs -a "$XDG_DATA_HOME/chezmoi/scripts/apt_packages" sudo apt install -y

# tldr isn't useful until you update its offline cache of pages
if type tldr &> /dev/null; then
  tldr --update
fi

########## Mise ##########
printf '    %-20s' mise...
if type mise &> /dev/null; then
  printf '\t%-10s\n' "${GREEN}found!${NONE}"
else
  printf '\t%-10s\n' "${RED}missing!${NONE}"
  echo "Installing mise..."
  curl https://mise.run | sh
fi

echo -e "    tools..."
mise trust ~/.config/mise/config.toml
mise trust ~/.local/share/chezmoi/mise.toml
mise install

printf '\t%-20s' "Installing ESlint..."
yarn global add eslint

########## manual downloads ##########
# Periodically check the version number below and update it!
printf '\t%-20s' "Nnn file explorer..."
if type nnn-nerd-static &> /dev/null; then
  printf '    %-10s\n' "${GREEN}found!${NONE}"
else
  printf '    %-10s\n' "${RED}missing!${NONE}"
  echo "Installing Nnn file explorer..."
  curl -L -o /tmp/nnn-nerd-static-5.2.x86_64.tar.gz \
       https://github.com/jarun/nnn/releases/download/v5.2/nnn-nerd-static-5.2.x86_64.tar.gz \
    && tar xf /tmp/nnn-nerd-static-5.2.x86_64.tar.gz -C ~/.local/bin \
    && rm -f /tmp/nnn-nerd-static-5.2.x86_64.tar.gz
fi

# maybe add fonts here?

echo '\nREMINDER: Consult `misc/manual_adjustments.md`.'
exit 0
