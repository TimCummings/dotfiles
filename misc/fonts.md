
[comment]: #(fonts.md)

# Fonts

## Download

### Current Favorites

From Wezterm:

- JetBrains Mono: https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip
  - use the "NL" (no ligature) version
- Symbols Nerd Font Mono (symbols only): https://github.com/wez/wezterm/blob/main/assets/fonts/Symbols-Nerd-Font-Mono.ttf

### Previous Favorites

- FiraMono Nerd Font: https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip
- SauceCodePro Nerd Font: https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip

## Installation

- extract zipped files to `~/.local/share/fonts`
- rebuild font info: `fc-cache -f -v`
- Alternatively, fonts can be extract to `/usr/share/fonts/` to make them available system wide.
- Test fonts in terminal with:
  - bold `echo -e "\e[1mbold\e[0m"`
  - italic `echo -e "\e[3mitalic\e[0m"`
  - bold italic `echo -e "\e[3m\e[1mbold italic\e[0m"`
  - underline `echo -e "\e[4munderline\e[0m"`
  - strikethrough `echo -e "\e[9mstrikethrough\e[0m"`
  - ??? `echo -e "\e[31mHello World\e[0m"`
  - ??? `echo -e "\x1B[31mHello World\e[0m"`

## Tips For Finding Correct Names

- various Vim GUIs: `:set guifont=*` or `:GuiFont *`
- Wezterm: use `wezterm ls-fonts --list-system` to find exact font names

# Fonts I Like (old)

- fairly standard
  - Monaco
  - Source Code Pro
  - Fira Mono
  - Anonymous Pro
  - JetBrains Mono (default in Wezterm)

- fun
  - Inconsolata (~ look like -)
  - ProFont

- maybes
  - Hack
