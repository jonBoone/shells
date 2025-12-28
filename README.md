# Portable *nix Shell Template Structure

## 2025-12-27

The goal is to have a portable template structure for configuration of multiple *nix shells.  I got the idea and initial structure from https://heptapod.host/flowblok/shell-startup.

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symbolic links to shell configuration files. Stow simplifies the process of maintaining dotfiles and allows you to selectively enable or disable shell configurations per machine.

### Prerequisites

Ensure GNU Stow is installed on your system:

```shell
# macOS
brew install stow

# Ubuntu/Debian
sudo apt install stow

# Fedora/RHEL
sudo dnf install stow

# Alpine
apk add stow
```

### Installation

After cloning this repository, use Stow to create the necessary symbolic links in your home directory:

```shell
cd /path/to/shells
# Install all packages
stow bash shell zsh sh

# Or selectively install packages
stow bash shell  # Install only bash and shell
stow zsh         # Install only zsh
```

Stow will create symlinks in your home directory:
- `~/.bashrc` → `shells/bash/.bashrc`
- `~/.bash_profile` → `shells/bash/.bash_profile`
- `~/.bash_logout` → `shells/bash/.bash_logout`
- `~/.shell` → `shells/shell/.shell`
- `~/.zshenv` → `shells/zsh/.zshenv`
- `~/.zshrc` → `shells/zsh/.zshrc`
- `~/.zshprofile` → `shells/zsh/.zshprofile`
- `~/.zlogin` → `shells/zsh/.zlogin`
- `~/.zlogout` → `shells/zsh/.zlogout`
- `~/.profile` → `shells/sh/.profile`

### Uninstall

To remove the symlinks created by Stow:

```shell
cd /path/to/shells
stow -D bash shell zsh sh
```

### Adding Prezto Support (Optional)

If you use [Prezto](https://github.com/sorin-ionescu/prezto), you can still manage it separately:

```shell
ln -s ${HOME}/.zprezto/runcoms/zpreztorc ${HOME}/.zpreztorc
```

### Directory Structure

Each top-level directory (bash, shell, zsh, sh) is a Stow package containing a mirrored home directory structure:

```
bash/
├── .bash/
│   ├── bashrc
│   ├── bash_profile
│   ├── env
│   ├── interactive
│   ├── login
│   └── logout
├── .bashrc → .bash/bashrc
├── .bash_profile → .bash/bash_profile
└── .bash_logout → .bash/logout
```

### History

The repository was initially inspired by https://heptapod.host/flowblok/shell-startup and has since been refactored to use GNU Stow for cleaner, more maintainable dotfile management.
