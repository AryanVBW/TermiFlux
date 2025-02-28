#!/bin/bash
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

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' 

echo -e "${YELLOW}Checking Homebrew installation...${NC}"
if ! command -v brew &>/dev/null; then
    echo -e "${RED}Homebrew not found! Installing...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -e "${GREEN}Homebrew is already installed!${NC}"
fi

echo -e "${YELLOW}Checking wget installation...${NC}"
if ! command -v wget &>/dev/null; then
    echo -e "${RED}wget not found! Installing...${NC}"
    brew install wget
else
    echo -e "${GREEN}wget is already installed!${NC}"
fi

# Define the TermiFlux script URL
TERMI_FLUX_URL="https://raw.githubusercontent.com/AryanVBW/TermiFlux/refs/heads/main/TermiFlux.sh"
TERMI_FLUX_PATH="/usr/local/bin/TermiFlux"

echo -e "${YELLOW}Downloading TermiFlux...${NC}"
wget -O "$TERMI_FLUX_PATH" "$TERMI_FLUX_URL" && echo -e "${GREEN}TermiFlux downloaded successfully!${NC}"

echo -e "${YELLOW}Setting permissions...${NC}"
chmod 777 "$TERMI_FLUX_PATH"
echo -e "${GREEN}Permissions set to 777 for TermiFlux!${NC}"

# Detect default shell
DEFAULT_SHELL=$(dscl . -read ~/ UserShell | awk '{print $2}')

echo -e "${YELLOW}Setting up TermiFlux auto-launch...${NC}"
if [[ "$DEFAULT_SHELL" == *"zsh"* ]]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [[ "$DEFAULT_SHELL" == *"bash"* ]]; then
    SHELL_CONFIG="$HOME/.bashrc"
else
    echo -e "${RED}Unknown shell detected! Defaulting to zsh.${NC}"
    SHELL_CONFIG="$HOME/.zshrc"
fi

# Add TermiFlux to shell startup
if ! grep -q "TermiFlux" "$SHELL_CONFIG"; then
    echo "bash $TERMI_FLUX_PATH" >> "$SHELL_CONFIG"
    echo -e "${GREEN}TermiFlux auto-launch configured in $SHELL_CONFIG!${NC}"
else
    echo -e "${GREEN}TermiFlux auto-launch already set up!${NC}"
fi

echo -e "${GREEN}Installation complete! Restart your terminal to launch TermiFlux.${NC}"
