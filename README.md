
# Dotfiles

## Overview

Dotfiles are now managed by [chezmoi](https://www.chezmoi.io/). Internally, `chezmoi` uses git for version control. Tracked files should be in `~/.local/share/chezmoi`, or ,more conveniently, `$DOTFILES` if my `zshenv` has been sourced.

`chezmoi` can be directed to ignore files by adding them to `.chezmoiignore`. "Ignore" in this context means `git` will still track the ignored files, but `chezmoi` won't try to copy them on `init` or `apply`, which is what I want for something like README, etc.

## Bootstrapping


### SSH Keys

1. Copy keys into `~/.ssh` directory.
2. [Verify correct permissions](https://superuser.com/questions/215504/permissions-on-private-key-in-ssh-folder)

| Item        | Sample              | Numeric       | Bitwise              |
|-------------|---------------------|---------------|----------------------|
| SSH folder  | `~/.ssh`            | `700`         | `drwx------`         |
| Public key  | `~/.ssh/id_rsa.pub` | `644`         | `-rw-r--r--`         |
| Private key | `~/.ssh/id_rsa`     | `600`         | `-rw-------`         |
| Home folder | `~`                 | `755` at most | `drwxr-xr-x` at most |

3. Add key to agent: `ssh-add ~/.ssh/id_rsa`.
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
chezmoi init --ssh git@github.com:TimCummings/dotfiles.git
chezmoi apply
```

### Install Zsh

```
sudo apt install zsh
chsh -s /usr/bin/zsh
```

Then logout and back in.

### Install [asdf](https://asdf-vm.com/) version manager

1. Download an appropriate pre-compiled binary: https://github.com/asdf-vm/asdf/releases/latest
2. Extract the archive with `tar xzf`.
3. Move the extracted binary to `~/.local/bin`.
4. Setup Zsh shell completions:

```
mkdir -p "${ASDF_DIR}/completions"
asdf completion zsh > "${ASDF_DIR}/completions/_asdf"
```


### Run bootstrap script

**Note:** `chezmoi` may not be in `PATH` yet. Either prefix with it's location, eg. `./.local/bin/chezmoi` or `source .zshenv`.

```
chezmoi cd
./scripts/bootstrap.sh
```
