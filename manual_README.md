# Mac Terminal Switcher (x86_64 & ARM64) 🚀

Easily switch between **ARM64** and **x86_64** environments on Apple Silicon Macs (M1, M2, M3) using simple commands.

## 📌 Features
- Seamlessly switch between **ARM64 (Native)** and **x86_64 (via Rosetta 2)**.
- One-command alias for quick switching.
- Open new terminal sessions in **x86_64** mode.
- Troubleshooting guide included.

---

## 🛠 Installation & Setup

### **1️⃣ Install Rosetta 2 (If Not Installed)**
Rosetta 2 is required to run x86_64 applications. To install it, run:
```sh
softwareupdate --install-rosetta --agree-to-license
```
Check if Rosetta is installed:
```sh
/usr/bin/pgrep oahd
```
If it returns a **number (PID)**, Rosetta is running.

### **2️⃣ Add Switching Aliases**
Edit your shell configuration file (`~/.zshrc` or `~/.bashrc`) and add:
```sh
# Switch to x86_64 mode
alias x86="arch -x86_64 /usr/bin/env zsh"

# Switch back to ARM64 mode
alias arm="exec /bin/zsh"
```
Apply the changes:
```sh
source ~/.zshrc  # or source ~/.bashrc
```

### **3️⃣ Open Terminal in x86_64 Mode (Alternative)**
To open a new terminal session in **x86_64 mode**, run:
```sh
osascript -e 'tell application "Terminal" to do script "arch -x86_64 /bin/zsh"'
```

---

## 🚀 Usage

- **Switch to x86_64 Mode:**
  ```sh
  x86
  ```
- **Switch Back to ARM64 Mode:**
  ```sh
  arm
  ```
- **Verify Current Architecture:**
  ```sh
  arch  # Output will be 'arm64' or 'x86_64'
  ```

---

## 🛠 Troubleshooting

### **1️⃣ Error: `Bad CPU type in executable`**
- Ensure Rosetta 2 is installed (`/usr/bin/pgrep oahd`).
- Some binaries may not support x86_64. Try:
  ```sh
  arch -x86_64 /usr/bin/env
  ```

### **2️⃣ Commands Not Working?**
- Restart your terminal or run `source ~/.zshrc`.
- Ensure you are using the correct shell (`echo $SHELL`).

### **3️⃣ Open a Dedicated x86_64 Terminal Window**
1. Open **Finder** → **Applications** → **Utilities**.
2. Right-click on **Terminal.app** → **Get Info**.
3. Check **"Open using Rosetta"**.
4. Open a new terminal instance.

