
# QMK Basics

### Only Graphical Configurator

https://config.qmk.fm

I haven't used this yet, no idea if it works. But the layout is decent.


## Background

Full guide here: https://docs.qmk.fm/#/newbs

Requires:
* QMK Toolbox be installed (used to flash firmware)
* QMK Firmware env be setup


NEW Usage (Linux):
* ASSUMES `qmk` has been installed!!
* Symlink keymap directories from dotfiles:
  * `ln -s ~/dotfiles/keybindings/qmk/nyquist-r3/tjc ~/qmk_firmware/keyboards/keebio/nyquist/keymaps/tjc`
  * `ln -s ~/dotfiles/keybindings/qmk/planck/tjc ~/qmk_firmware/keyboards/planck/keymaps/tjc`
  * `ln -s ~/dotfiles/keybindings/qmk/rebound/tjc ~/qmk_firmware/keyboards/montsinger/rebound/rev4/keymaps/tjc`
* Go to the root `qmk_firmware` directory.
* Build and flash via `dfu`:
  * `make planck/rev6:tjc:dfu-util`
  * `make keebio/nyquist/rev3:tjc:dfu`
  * `make montsinger/rebound/rev4:tjc:dfu`

---

OLD Usage (MacOS):
* Create a layout directory in your keyboard's keymap directory, e.g. `mkdir ~/qmk_firmware/keyboards/keebio/iris/keymap/tjc`.
* Copy files (`config.h`, `keymap.c`, `rules,mk`) from the keyboard's default layout directory for a good starting point.
* Edit the `keymap.c` file to your liking.
* Return to the root `qmk_firmware` directory.
* Build your layout (see examples below.) This creates a similarly named `.hex` file in the `qmk_firware` directory.
  * `make planck/rev6:tjc`
  * `make keebio/nyquist/rev3:tjc`
* Provide the `.hex` file to QMK Toolbox.
