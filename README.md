
# Dotfiles

## Overview

Dotfiles are now managed by [chezmoi](https://www.chezmoi.io/). Internally, `chezmoi` uses git for version control. Tracked files should be in `~/.local/share/chezmoi`, or ,more conveniently, `$DOTFILES` if my `zshenv` has been sourced.

`chezmoi` can be directed to ignore files by adding them to `.chezmoiignore`. "Ignore" in this context means `git` will still track the ignored files, but `chezmoi` won't try to copy them on `init` or `apply`, which is what I want for something like README, etc.

## Bootstrapping

### Install [chezmoi](https://www.chezmoi.io/)

Create `~/.local` if it doesn't yet exist.

```
mkdir ~/.local
```

```
cd ~/.local
sh -c "$(curl -fsLS chezmoi.io/get)"
```

### Initialize Existing Repo

```
chezmoi init https://github.com/TimCummings/chezmoi_dotfiles.git
chezmoi apply
```

### Install zsh

```
sudo apt install zsh
chsh -s /usr/bin/zsh
```

Then logout and back in.

### Run bootstrap script

**Note:** `chezmoi` may not be in `PATH` yet. Either prefix with it's location, eg. `./.local/bin/chezmoi` or `source .zshenv`.

```
chezmoi cd
./scripts/bootstrap.sh
```
