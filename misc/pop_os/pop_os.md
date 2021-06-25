# Notes and Observations from Installing Pop!_OS

## Things to Install

### Packages

`xargs -a packages.txt sudo apt-get install`

### Other

* `nnn` file manager
  * For icon support, you have to download a pre-compiled binary or compile it yourself.
    * Download pre-compiled binary from https://github.com/jarun/nnn/releases (`nnn-nerd-static...` for Nerd Font version.)
    * Extract binary to `/usr/bin`
    * Add symlink that points to this binary: `sudo ln -s /usr/bin/nnn-nerd-static /usr/bin/nnn`.

* [dotfiles](https://github.com/TimCummings/dotfiles)
* ssh keys

* install Gnome Tweaks and set:
  * Miscellaneous compatibility options
    * Both Shift together enable Caps Lock
  * Layout of numeric keypad (to properly produce QMK numpad codes in terminal)
    * Unicode additions (arrows and math operators; math operators on default level)

* Gnome Shell Extensions browser extension

* Logitech mouse driver (middle click and side buttons don't work)
  * backend/service: https://github.com/libratbag/libratbag
  * GUI: https://github.com/libratbag/piper/

* Spotify

* Discord?
* GIMP?
* Malwarebytes?
* Navicat?
* Postman?
* QMK Toolbox?
* Skype?
* Veracrypt?
* Zoom?

## Settings to change

* increase key repeat speed
  * Settings
  * Universal Access
  * Repeat Keys

## Keybindings

* toggle maiximization state: Super + z
* Move window to workspace n: Shift + Super + n
* Switch to workspace n: Super + n
* Next track: AudioForward (from QMK)
* Previous track: Audio rewind (from QMK)

### [dconf](https://askubuntu.com/questions/22313/what-is-dconf-what-is-its-function-and-how-do-i-use-it) changes
* org.gnome.shell.keybindings
  * switch-to-application-1..9 (set to empty array [])

## Bugs to Fix

* won't wake after suspend; fix with `sudo kernelstub -a "nomodeset"`

## Old:

*Thumbdrive format cannot be `exFAT`; Pop!_OS does not provide `exFAT` reading functionality by default due to patent/rights issues.

### Display

**Update**: This was fixed by disabling the Auto HiDPI in Gnome's Settings.
Changes to display settings are lost on logout/reboot. Still working on this. Settings can be applied from terminal with:
* single display: `xrandr --output eDP-1 --mode 1920x1200`
* dual display (Samsung 27): `xrandr --output eDP-1 --mode 1920x1200`
