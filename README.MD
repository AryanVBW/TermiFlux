# Mac Terminal Switcher (x86_64 & ARM64)

This script automates the setup of essential tools on macOS, including Homebrew, `wget`, and TermiFlux. It ensures compatibility with both Intel (x86_64) and Apple Silicon (ARM64) architectures.

## Installation

To set up everything with a single command, simply copy and paste the following `curl` command into your terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/AryanVBW/TermiFlux/refs/heads/main/install_TermiFlux.sh)"
```

### What This Script Does
- Checks if **Homebrew** is installed; if not, installs it.
- Installs **wget** if missing.
- Downloads **TermiFlux** from GitHub.
- Moves the script to `/usr/local/bin/` (or `/opt/homebrew/bin/` for ARM64 Macs).
- Sets executable permissions (`777`) for the script.
- Detects the user's default shell (`bash` or `zsh`).
- Automatically launches TermiFlux on every new terminal session.

### Prerequisites
- macOS (Intel or Apple Silicon)
- Internet Connection

## Usage
Once installed, restart your terminal, and **TermiFlux** will automatically launch.

## Uninstallation
To remove TermiFlux, simply delete the script and remove its entry from your shell configuration file:

```bash
rm /usr/local/bin/TermiFlux
sed -i '' '/TermiFlux/d' ~/.zshrc ~/.bashrc
```

