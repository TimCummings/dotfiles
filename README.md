
# Dotfiles

## Overview

Dotfiles are managed by [chezmoi](https://www.chezmoi.io/).

## Dependencies

curl

```bash
sudo apt-get update
sudo apt-get install -y curl
```

## Bootstrapping

### 1) Setup chezmoi

```bash
mkdir -p ~/.local/bin
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply https://github.com/TimCummings/dotfiles.git
```

### 2) (optional) SSH Setup

Copy relevant SSH key to chezmoi directory (`~/.local/share/chezmoi`) as `id_rsa` for optional automated setup. This will enable writing/pushing to this repo.

For reference:

[Correct permissions](https://superuser.com/questions/215504/permissions-on-private-key-in-ssh-folder)

| Item        | Sample              | Numeric       | Bitwise              |
|-------------|---------------------|---------------|----------------------|
| SSH folder  | `~/.ssh`            | `700`         | `drwx------`         |
| Public key  | `~/.ssh/id_rsa.pub` | `644`         | `-rw-r--r--`         |
| Private key | `~/.ssh/id_rsa`     | `600`         | `-rw-------`         |
| Home folder | `~`                 | `755` at most | `drwxr-xr-x` at most |


### 3) Bootstrap

```bash
~/.local/bin/chezmoi cd
./scripts/bootstrap.sh
```
