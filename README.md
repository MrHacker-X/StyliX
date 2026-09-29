<div align="center">

# ⃤ S T Y L I X ⃤

🎨 **Your Termux, styled.** Login screen, shortcuts, autosuggestions — zero bloat, fully on **zsh**.

<img src="https://img.shields.io/badge/version-2.0.0-green?style=for-the-badge">
<img src="https://img.shields.io/github/stars/MrHacker-X/StyliX?style=for-the-badge&color=orange">
<img src="https://img.shields.io/github/forks/MrHacker-X/StyliX?style=for-the-badge&color=purple">
<img src="https://img.shields.io/github/watchers/MrHacker-X/StyliX?style=for-the-badge&color=cyan">
<img src="https://img.shields.io/github/issues/MrHacker-X/StyliX?style=for-the-badge&color=red">
<img src="https://img.shields.io/github/license/MrHacker-X/StyliX?style=for-the-badge&color=blue"><br>
 
<img src="https://img.shields.io/badge/Author-MrHacker--X-purple?style=flat-square">
<img src="https://img.shields.io/badge/Open%20Source-Yes-cyan?style=flat-square">
<img src="https://img.shields.io/badge/Shell-Zsh-blue?style=flat-square">
<img src="https://img.shields.io/badge/Platform-Termux-green?style=flat-square">

</div>

---

## 📋 Table of Contents

- [🎯 Why StyliX?](#-why-stylix)
- [✨ Features](#-features)
- [🖥️ Preview](#️-preview)
- [🚀 Quick Start](#-quick-start)
- [📦 Installation](#-installation)
- [🧩 After Install](#-after-install)
- [❓ FAQ](#-faq)
- [🧰 Tech Stack](#-tech-stack)
- [⚠️ Disclaimer](#️-disclaimer)
- [🤝 Contributing](#-contributing)
- [📜 License](#-license)
- [👤 Developer](#-developer)

---

## 🎯 Why StyliX?

> A stock Termux shell looks like everyone else's. **StyliX v2** gives yours a framed banner, an optional login gate, fish-like autosuggestions, and shortcuts that actually save typing — with a fully transparent installer you can read in one sitting.
>
> No fake loading bars. No plaintext passwords. No self-deleting scripts. Just a clean, styled **zsh** shell you can switch off any time with one command.

---

## ✨ Features

| | Feature | Description |
|---|---------|-------------|
| 🔐 | **Login screen** | Optional framed username + password gate — password stored only as a **SHA-256 hash**, never in plaintext · 3 attempts |
| 🎨 | **Styled zsh** | Banner, welcome card, and custom prompt the moment Termux starts |
| 💡 | **Autosuggestions** | Fish-like grey ghost text from history (vendored into `~/.stylix/`, not via apt) |
| ⚡ | **Shell upgrades** | `AUTO_CD`, `EXTENDED_GLOB`, `CORRECT`, shared history, 10k/20k history size |
| ⌨️ | **Shortcuts** | `..`, `...`, `ll`, `cls`, `h`, `p`, `ports`, colored `grep` / `ls` |
| 🧰 | **Helpers** | `mkcd`, `backup`, `extract` (tar / zip / 7z / rar), `weather` |
| 🔇 | **MOTD silenced** | Termux default MOTD is cleared (backed up as `*.stylix-bak`) |
| 🎛️ | **stylixx manager** | `stylixx on` / `off` / `status` — toggle without uninstalling |
| 🧹 | **Safe uninstall** | `unstylixx` restores `~/.zshrc` + MOTD backups and removes everything |
| 📖 | **helpx** | One command prints every shortcut and helper |
| 🛡️ | **Transparent** | Plain readable shell — no obfuscation, no self-deletion |

---

## 🖥️ Preview

<div align="center">

![StyliX Terminal](https://i.ibb.co/RGmRkfQJ/IMG-20260929-075338.jpg)

</div>

```text
$ bash install.sh

  ╭──────────────────────────────────────────────────╮
  │                                                  │
  │  ███████╗████████╗██╗   ██╗██╗     ██╗██╗  ██╗   │
  │  ██╔════╝╚══██╔══╝╚██╗ ██╔╝██║     ██║╚██╗██╔╝   │
  │  ███████╗   ██║    ╚████╔╝ ██║  ███╗██║ ╚███╔╝   │
  │  ╚════██║   ██║     ╚██╔╝  ██║   ██║██║ ██╔██╗   │
  │  ███████║   ██║      ██║   ╚██████╔╝██║██╔╝ ██╗  │
  │  ╚══════╝   ╚═╝      ╚═╝    ╚═════╝ ╚═╝╚═╝  ╚═╝  │
  │                                                  │
  ├──────────────────────────────────────────────────┤
  │    > styled zsh for Termux  ·  v2.0.0  <         │
  ╰──────────────────────────────────────────────────╯

[+] Default shell set to zsh
[+] Default MOTD silenced
[+] zsh-autosuggestions installed to ~/.stylix/zsh-autosuggestions
[?] Set up a login screen? [y/N] y
[?] Username: hacker
[?] Password: ••••••••
[+] Login gate enabled — password stored as SHA-256 hash (chmod 600).

  ╭──────────────────────────────────────────────────╮
  │  ✔  StyliX installed                             │
  │  Restart Termux to enter your styled zsh shell   │
  ╰──────────────────────────────────────────────────╯
```

---

## 🚀 Quick Start

```bash
apt update -y && apt upgrade -y
apt install git zsh -y
git clone https://github.com/MrHacker-X/StyliX.git
cd StyliX
bash install.sh
```

Restart Termux — styled zsh takes over. Done.

---

## 📦 Installation

### Supported Systems

| System | Supported | Notes |
|--------|-----------|-------|
| 🤖 **Termux (Android)** | ✅ | `apt` / `pkg` |
| 🐧 **Linux** | ❌ | Refused — Termux-only |
| 🍎 **macOS** | ❌ | Refused — Termux-only |
| 🪟 **Windows** | ❌ | Refused — Termux-only |

### Steps

1. **Update Termux**
    ```bash
    apt update -y && apt upgrade -y
    ```
2. **Install Git + zsh**
    ```bash
    apt install git zsh -y
    ```
3. **Clone the repository**
    ```bash
    git clone https://github.com/MrHacker-X/StyliX.git
    cd StyliX
    ```
4. **Run the installer**
    ```bash
    bash install.sh
    ```
5. The installer will:
   - Install **zsh** if missing
   - Switch your default shell to zsh automatically (`chsh` — no prompt)
   - Silence Termux’s default MOTD
   - Clone **zsh-autosuggestions** into `~/.stylix/`
   - Ask about an optional **login screen** (`y` / `N`)
6. **Restart Termux.**

<details>
<summary><b>🔍 What exactly does the installer do?</b></summary>

- Backs up your original `~/.zshrc` to `~/.zshrc.pre-stylix` (once — never overwritten on re-installs)
- Installs zsh if missing and switches default shell with `chsh -s zsh` (required, no ask)
- Clones [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) into `~/.stylix/zsh-autosuggestions` (git, or curl tarball fallback — not available via Termux apt)
- Silences Termux MOTD via `~/.hushlogin` + emptied `$PREFIX/etc/motd*` (originals kept as `*.stylix-bak`)
- Copies core files (`zshrc`, `bans`, `load.sh`, `helpx`) into `~/.stylix/`
- Hooks StyliX into `~/.zshrc` by sourcing `~/.stylix/zshrc` between `# >>> stylix >>>` / `# <<< stylix <<<` markers
- Installs commands into `$PREFIX/bin`: `stylixx`, `unstylixx`, `helpx`
- Optionally stores a SHA-256 password hash in `~/.stylix/login` (`chmod 600`)
- Strips any legacy bash StyliX hook from `~/.bashrc` if present
- Does **not** delete your files and does **not** obfuscate a single line

</details>

<details>
<summary><b>🔐 How the login screen works</b></summary>

On install you can set a username and password. The password is never saved — only its **SHA-256 hash**, in `~/.stylix/login` with `chmod 600`. Each Termux start shows a framed login UI with **3 attempts**; the hash is compared each time. Password input is hidden. If you forget it, run `unstylixx` and reinstall without the gate.

</details>

<details>
<summary><b>📁 Layout after install</b></summary>

```text
~/.stylix/
  zshrc                 # styled zsh environment (sourced by ~/.zshrc)
  bans                  # boot banner art
  load.sh               # short boot animation
  helpx                 # shortcut reference
  login                 # optional user + SHA-256 hash (chmod 600)
  zsh-autosuggestions/  # vendored plugin
  .zsh_history          # StyliX history file
  disabled              # present when stylixx off

$PREFIX/bin/
  stylixx · unstylixx · helpx
```

</details>

---

## 🧩 After Install

| Command | What it does |
|---------|--------------|
| `helpx` | Print all shortcuts and helpers |
| `stylixx on` | Re-enable the styled shell |
| `stylixx off` | Disable it temporarily |
| `stylixx status` | Check whether StyliX is active |
| `unstylixx` | Uninstall completely; restore zshrc + MOTD |
| `bash install.sh --uninstall` | Same as above, from the repo folder |

### Shortcut cheat-sheet

| Shortcut | Action | | Helper | Action |
|----------|--------|-|--------|--------|
| `ll` | long listing | | `mkcd` | make dir + cd into it |
| `..` / `...` | go up 1 / 2 dirs | | `backup <file>` | timestamped copy |
| `cls` | clear screen | | `extract <file>` | tar / zip / 7z / rar |
| `h` | history | | `weather` | current weather |
| `p` | current directory | | `ports` | listening ports |
| `update` | pkg update + upgrade | | `instax <pkg>` | pkg install |

Autosuggestions: grey ghost text appears as you type — accept with `→` or `End`.

---

## ❓ FAQ

**Is my password stored somewhere I can read it?**
No. Only its SHA-256 hash is stored, in a `chmod 600` file. Plaintext never touches disk.

**I set a login password and forgot it. Am I locked out?**
No — run `unstylixx` (or reinstall with `bash install.sh` and skip the gate), and the shell opens normally.

**Will it break my existing `.zshrc`?**
It's backed up to `~/.zshrc.pre-stylix` before anything changes, and `unstylixx` restores it byte-for-byte.

**How do I turn it off without uninstalling?**
`stylixx off`, restart your shell. Turn it back on with `stylixx on`.

**Will the installer ask before switching my shell to zsh?**
No. StyliX requires zsh — it installs zsh if needed and runs `chsh -s zsh` automatically.

**Where do autosuggestions come from?**
They are cloned from GitHub into `~/.stylix/zsh-autosuggestions` during install. Termux does not ship this plugin via apt.

**I still have the old bash version installed.**
Run `bash install.sh` again — it migrates you to zsh and strips any legacy bash hook from `~/.bashrc`.

**Does it work on Linux or macOS?**
No. StyliX is built for Termux paths and Termux tooling — the installer refuses to run anywhere else.

---

## 🧰 Tech Stack

| | Technology |
|---|-----------|
| 🐚 | **Zsh 5+** — styled shell environment |
| 📜 | **Bash** — installer + small helpers only |
| 💡 | **zsh-autosuggestions** — vendored under `~/.stylix/` |
| 🔐 | **SHA-256** (`sha256sum`) — password hashing |
| 🤖 | **Termux** — target platform |
| 📦 | **Version** — `2.0.0` (see [`VERSION`](VERSION)) |

---

## ⚠️ Disclaimer

> StyliX is intended **for educational and personal-customization purposes only**. You are responsible for the credentials you set and for changes made to your own environment. Always keep your `~/.zshrc.pre-stylix` backup until you're happy with the setup. The author is **not responsible** for any misuse or damage caused by this tool.

---

## 🤝 Contributing

Contributions are always welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📜 License

Distributed under the **MIT License**. See [`LICENSE`](LICENSE) for more information.

---

## 👤 Developer

| | |
|---|---|
| 👨‍💻 **Dev** | MrHacker-X |
| 🐙 **GitHub** | [github.com/MrHacker-X](https://github.com/MrHacker-X) |
| 📧 **Email** | [contact@vritrasec.com](mailto:contact@vritrasec.com) |
| 🌐 **Website** | [vritrasec.com](https://vritrasec.com) |
| 🔗 **Network** | [link.vritrasec.com](https://link.vritrasec.com) |

---

<div align="center">

**⭐ Star this repository if StyliX made your Termux yours! ⭐**

Made with 🎨 by **MrHacker-X** · **v2.0.0**

</div>
