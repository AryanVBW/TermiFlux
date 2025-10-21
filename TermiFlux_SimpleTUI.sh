#!/bin/bash

# [Keep all the same functions and banner from original...]

# Clear screen and show banner
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

# ========== SIMPLE TEXT TUI ==========
while true; do
    echo -e "\n\033[1;36m╔══════════════════════════════════════╗\033[0m"
    echo -e "\033[1;36m║         TERMIFLUX - MAIN MENU         ║\033[0m"  
    echo -e "\033[1;36m╠══════════════════════════════════════╣\033[0m"
    echo -e "\033[1;36m║   1. 🚀 ARM64 (Native Apple Silicon)  ║\033[0m"
    echo -e "\033[1;36m║   2. 🔄 x86_64 (Intel via Rosetta 2)  ║\033[0m"
    echo -e "\033[1;36m║   3. ❌ Exit                          ║\033[0m"
    echo -e "\033[1;36m╚══════════════════════════════════════╝\033[0m"
    
    read -p "Select option (1-3): " choice
    
    case $choice in
        1)
            echo -e "\033[1;32m✅ Switching to ARM64 shell...\033[0m"
            exec /bin/zsh
            ;;
        2)
            echo -e "\033[1;32m✅ Switching to x86_64 shell...\033[0m"
            arch -x86_64 /bin/zsh
            ;;
        3)
            echo -e "\033[1;33m👋 Thank you for using TermiFlux!\033[0m"
            exit 0
            ;;
        *)
            echo -e "\033[1;31m❌ Invalid choice! Please enter 1, 2, or 3.\033[0m"
            sleep 1
            ;;
    esac
done
