
[comment]: #(fonts.md)

# Fonts

## Download

* FiraMono Nerd Font: https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip
* SauceCodePro Nerd Font: https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip

## Installation

* extract zipped files to `~/.local/share/fonts`
* rebuild font info: `fc-cache -f -v`
* Alternatively, fonts can be extract to `/usr/share/fonts/` to make them available system wide.
* Test fonts in terminal with:
  * bold `echo -e "\e[1mbold\e[0m"`
  * italic `echo -e "\e[3mitalic\e[0m"`
  * bold italic `echo -e "\e[3m\e[1mbold italic\e[0m"`
  * underline `echo -e "\e[4munderline\e[0m"`
  * strikethrough `echo -e "\e[9mstrikethrough\e[0m"`
  * ??? `echo -e "\e[31mHello World\e[0m"`
  * ??? `echo -e "\x1B[31mHello World\e[0m"`

# Fonts I Like

* fairly standard
  * Monaco
  * Source Code Pro
  * Fira Mono
  * Anonymous Pro

* fun
  * Inconsolata (~ look like -)
  * ProFont

* maybes
  * Hack
