#!/bin/bash

# Function to check if Rosetta 2 is installed
check_rosetta() {
    echo "Checking if Rosetta 2 is installed..."
    if /usr/bin/pgrep oahd >/dev/null 2>&1; then
        echo " Rosetta 2 is already installed."
    else
        echo " Rosetta 2 is not installed. Installing now..."
        softwareupdate --install-rosetta --agree-to-license
        if [ $? -eq 0 ]; then
            echo " Rosetta 2 installation successful."
        else
            echo " Rosetta 2 installation failed. Please install manually."
            exit 1
        fi
    fi
}

# Function to check current architecture
check_arch() {
    arch_output=$(arch)
    echo "Current architecture: $arch_output"
}

# Function to open a new terminal in x86_64 mode
open_x86_terminal() {
    echo "Opening a new x86_64 terminal..."
    osascript -e 'tell application "Terminal" to do script "arch -x86_64 /bin/zsh"'
}

# Function to create shell aliases for easy switching
setup_aliases() {
    echo "Setting up aliases for easy switching..."
    SHELL_CONFIG="$HOME/.zshrc"
    if [ -f "$HOME/.bashrc" ]; then
        SHELL_CONFIG="$HOME/.bashrc"
    fi
    
    echo "alias x86=\"arch -x86_64 /usr/bin/env zsh\"" >> "$SHELL_CONFIG"
    echo "alias arm=\"exec /bin/zsh\"" >> "$SHELL_CONFIG"
    source "$SHELL_CONFIG"
    echo " Aliases added successfully! Use 'x86' to switch to x86_64 and 'arm' to switch back to ARM64."
}

# Main execution starts here
clear
echo -e "\033[96m+===========================================================================+\033[0m"
echo -e "\033[96m| █████   █████  ███                       █████         █████   ███   █████ |\033[0m"
echo -e "\033[96m|░░███   ░░███  ░░░                       ░░███         ░░███   ░███  ░░███  |\033[0m"
echo -e "\033[96m| ░███    ░███  ████  █████ █████  ██████  ░███ █████    ░███   ░███   ░███  |\033[0m"
echo -e "\033[96m| ░███    ░███ ░░███ ░░███ ░░███  ███░░███ ░███░░███     ░███   ░███   ░███  |\033[0m"
echo -e "\033[96m| ░░███   ███   ░███  ░███  ░███ ░███████  ░██████░      ░░███  █████  ███   |\033[0m"
echo -e "\033[96m|  ░░░█████░    ░███  ░░███ ███  ░███░░░   ░███░░███      ░░░█████░█████░    |\033[0m"
echo -e "\033[96m|    ░░███      █████  ░░█████   ░░██████  ████ █████       ░░███ ░░███      |\033[0m"
echo -e "\033[96m|     ░░░      ░░░░░    ░░░░░     ░░░░░░  ░░░░ ░░░░░         ░░░   ░░░       |\033[0m"
echo -e "\033[95m|                                                                            |\033[0m"
echo -e "\033[95m|                           🔥GitHub: github.com/AryanVBW                    |\033[0m"
echo -e "\033[95m|                           📧Email: admin@aryanvbw.live                     |\033[0m"
echo -e "\033[95m|                                     TermiFlux                              |\033[0m"
echo -e "\033[32m+===========================================================================+\033[0m"
echo -e "\033[93m|                            Welcome to Vivek's Coding World!                |\033[0m"
echo -e "\033[32m+===========================================================================+\033[0m"
echo -e "\033[93m|                    MacOS Architecture Switcher - ARM64 & x86_64            |\033[0m"
echo -e "\033[32m+===========================================================================+\033[0m"
# Step 1: Check Rosetta Installation
check_rosetta

# Step 2: Verify Current Architecture
check_arch

# Step 3: Choose architecture to switch to
echo "\nSelect the architecture mode to switch to:"
echo "1) ARM64 (Default)"
echo "2) x86_64 (via Rosetta 2)"
read -p "Enter your choice (1 or 2): " choice

case $choice in
    1)
        echo "Switching to ARM64 shell..."
        exec /bin/zsh
        ;;
    2)
        echo "Switching to x86_64 shell..."
        arch -x86_64 /bin/zsh
        ;;
    *)
        echo "Invalid choice! Exiting..."
        exit 1
        ;;
esac
