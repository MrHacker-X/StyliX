#!/data/data/com.termux/files/usr/bin/env bash
# github.com/MrHacker-X
# StyliX installer - zsh edition, fully transparent, no obfuscation, no self-deletion.
set -u

STYLIX_VERSION="2.0.0"
HOME_T="/data/data/com.termux/files/home"
STYLIX_DIR="$HOME_T/.stylix"
ZSHRC="$HOME_T/.zshrc"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"

# ---------- colors ----------
if [ -t 1 ] && [ -z "${NO_COLOR:-}" ]; then
    RD=$'\e[31m'; GR=$'\e[32m'; CY=$'\e[36m'; BW=$'\e[1m'; DM=$'\e[2m'; XX=$'\e[0m'
else
    RD=""; GR=""; CY=""; BW=""; DM=""; XX=""
fi

info() { printf '%s[*]%s %s\n' "$CY" "$XX" "$1"; }
ok()   { printf '%s[+]%s %s\n' "$GR" "$XX" "$1"; }
warn() { printf '%s[!]%s %s\n' "$CY" "$XX" "$1"; }
err()  { printf '%s[x]%s %s\n' "$RD" "$XX" "$1" >&2; }
fail() { err "$1"; exit 1; }

WH=$'\e[1;97m'
GN=$'\e[1;32m'

# ---------- Termux guard ----------
[ -n "${TERMUX_VERSION:-}" ] || fail "StyliX runs ONLY inside Termux."
[ -d "$HOME_T" ] || fail "Termux home not found at $HOME_T."

# ---------- heading ----------
printf '\n'
printf '%s\n' "  ${GN}╭──────────────────────────────────────────────────╮${XX}"
printf '%s\n' "  ${GN}│${XX}                                                  ${GN}│${XX}"
printf '%s\n' "  ${GN}│${XX}  ${WH}███████╗████████╗██╗   ██╗██╗      ██╗${CY}██╗  ██╗${XX}   ${GN}│${XX}"
printf '%s\n' "  ${GN}│${XX}  ${WH}██╔════╝╚══██╔══╝╚██╗ ██╔╝██║      ██║${CY}╚██╗██╔╝${XX}   ${GN}│${XX}"
printf '%s\n' "  ${GN}│${XX}  ${WH}███████╗   ██║    ╚████╔╝ ██║  ███╗██║${CY} ╚███╔╝${XX}   ${GN}│${XX}"
printf '%s\n' "  ${GN}│${XX}  ${WH}╚════██║   ██║     ╚██╔╝  ██║   ██║██║${CY} ██╔██╗${XX}   ${GN}│${XX}"
printf '%s\n' "  ${GN}│${XX}  ${WH}███████║   ██║      ██║   ╚██████╔╝██║${CY}██╔╝ ██╗${XX}  ${GN}│${XX}"
printf '%s\n' "  ${GN}│${XX}  ${WH}╚══════╝   ╚═╝      ╚═╝    ╚═════╝ ╚═╝${CY}╚═╝  ╚═╝${XX}  ${GN}│${XX}"
printf '%s\n' "  ${GN}│${XX}                                                  ${GN}│${XX}"
printf '%s\n' "  ${GN}├──────────────────────────────────────────────────┤${XX}"
printf '%s\n' "  ${GN}│${XX}    ${CY}>${XX} styled zsh for Termux  ${DM}·${XX}  ${BW}v${STYLIX_VERSION}${XX}  ${CY}<${XX}         ${GN}│${XX}"
printf '%s\n' "  ${GN}╰──────────────────────────────────────────────────╯${XX}"
echo

# ---------- uninstall mode ----------
if [ "${1:-}" = "--uninstall" ]; then
    if [ -x "$PREFIX/bin/unstylixx" ]; then
        "$PREFIX/bin/unstylixx"
    elif [ -f "$STYLIX_DIR/uninstall.sh" ]; then
        bash "$STYLIX_DIR/uninstall.sh"
    else
        err "StyliX is not installed."
    fi
    exit 0
fi

# ---------- required core files ----------
for f in zshrc load.sh bans helpx; do
    [ -f "$REPO_DIR/core/$f" ] || fail "Missing core/$f - re-clone the repository."
done

# ---------- ensure zsh (no prompts - required) ----------
if ! command -v zsh >/dev/null 2>&1; then
    info "Installing zsh (required)..."
    apt update -y && apt install zsh -y || fail "Could not install zsh. Run: apt install zsh - then re-run this installer."
    ok "zsh installed."
fi

# ---------- set default shell to zsh (no prompts - required) ----------
case "${SHELL:-}" in
    */zsh) ok "Default shell is already zsh." ;;
    *)
        info "Switching default shell to zsh..."
        if command -v chsh >/dev/null 2>&1 && chsh -s zsh 2>/dev/null; then
            ok "Default shell set to zsh (applies after Termux restart)."
        else
            fail "Could not switch shell automatically. Run: chsh -s zsh - then re-run this installer."
        fi
        ;;
esac

# ---------- silence Termux default MOTD ----------
info "Disabling default Termux MOTD..."
touch "$HOME_T/.hushlogin"
for motd in \
    "$PREFIX/etc/motd" \
    "$PREFIX/etc/motd-playstore" \
    "$PREFIX/etc/motd.sh"
do
    if [ -e "$motd" ] && [ ! -e "${motd}.stylix-bak" ]; then
        cp -a "$motd" "${motd}.stylix-bak" 2>/dev/null || true
    fi
    if [ -f "$motd" ]; then
        : > "$motd"
    elif [ -e "$motd" ]; then
        rm -f "$motd"
        : > "$motd"
    fi
done
ok "Default MOTD silenced (backed up as *.stylix-bak)."

# ---------- backup existing zshrc (once) ----------
touch "$ZSHRC"
if [ -f "$ZSHRC" ] && [ ! -f "$ZSHRC.pre-stylix" ]; then
    cp "$ZSHRC" "$ZSHRC.pre-stylix"
    ok "Original ~/.zshrc backed up to ~/.zshrc.pre-stylix"
fi

# ---------- install core files ----------
info "Installing core files..."
mkdir -p "$STYLIX_DIR"
rm -f "$STYLIX_DIR/disabled"

cp "$REPO_DIR/core/zshrc"   "$STYLIX_DIR/zshrc"
cp "$REPO_DIR/core/load.sh" "$STYLIX_DIR/load.sh"
cp "$REPO_DIR/core/bans"    "$STYLIX_DIR/bans"
cp "$REPO_DIR/core/helpx"   "$STYLIX_DIR/helpx"
chmod +x "$STYLIX_DIR/load.sh" "$STYLIX_DIR/helpx"
ok "Core files in $STYLIX_DIR"

# ---------- zsh-autosuggestions (vendored via git - not on Termux apt) ----------
AS_DIR="$STYLIX_DIR/zsh-autosuggestions"
AS_URL="https://github.com/zsh-users/zsh-autosuggestions"
if [ ! -f "$AS_DIR/zsh-autosuggestions.zsh" ]; then
    info "Installing zsh-autosuggestions..."
    rm -rf "$AS_DIR"
    if command -v git >/dev/null 2>&1; then
        git clone --depth 1 "$AS_URL.git" "$AS_DIR" \
            || fail "Could not clone zsh-autosuggestions. Check network and re-run."
    elif command -v curl >/dev/null 2>&1; then
        mkdir -p "$AS_DIR"
        curl -fsSL "$AS_URL/archive/refs/heads/master.tar.gz" \
            | tar xz -C "$AS_DIR" --strip-components=1 \
            || fail "Could not download zsh-autosuggestions. Check network and re-run."
    else
        fail "Need git or curl to install zsh-autosuggestions."
    fi
    ok "zsh-autosuggestions installed to ~/.stylix/zsh-autosuggestions"
else
    ok "zsh-autosuggestions already present."
fi

# ---------- hook into ~/.zshrc (source, don't inline) ----------
if grep -q "# >>> stylix >>>" "$ZSHRC" 2>/dev/null; then
    # portable strip of previous block (GNU sed on Termux)
    sed -i '/# >>> stylix >>>/,/# <<< stylix <<</d' "$ZSHRC"
fi
# also strip legacy bash hook if present
if grep -q "# >>> stylix >>>" "$HOME_T/.bashrc" 2>/dev/null; then
    sed -i '/# >>> stylix >>>/,/# <<< stylix <<</d' "$HOME_T/.bashrc"
    ok "Removed legacy StyliX bash hook from ~/.bashrc"
fi

{
    echo ""
    echo "# >>> stylix >>>"
    echo "[ -f \"$STYLIX_DIR/zshrc\" ] && source \"$STYLIX_DIR/zshrc\""
    echo "# <<< stylix <<<"
} >> "$ZSHRC"
ok "Styled zsh environment hooked into ~/.zshrc"

# ---------- management commands ----------
cat > "$PREFIX/bin/stylixx" <<'EOF'
#!/data/data/com.termux/files/usr/bin/env bash
# StyliX manager
STYLIX_DIR="${HOME}/.stylix"
case "${1:-help}" in
    on)
        rm -f "$STYLIX_DIR/disabled"
        echo "[+] StyliX enabled. Restart your shell."
        ;;
    off)
        mkdir -p "$STYLIX_DIR"
        touch "$STYLIX_DIR/disabled"
        echo "[-] StyliX disabled. Restart your shell."
        ;;
    status)
        if [ ! -f "$STYLIX_DIR/zshrc" ]; then
            echo "[-] StyliX is not installed."
        elif [ -f "$STYLIX_DIR/disabled" ]; then
            echo "[-] StyliX is disabled."
        else
            echo "[+] StyliX is enabled."
        fi
        ;;
    *)
        echo "StyliX manager"
        echo "  stylixx on       enable the styled shell"
        echo "  stylixx off      disable it temporarily"
        echo "  stylixx status   show current state"
        echo "  unstylixx        uninstall completely"
        ;;
esac
EOF
chmod +x "$PREFIX/bin/stylixx"

cat > "$PREFIX/bin/unstylixx" <<'EOF'
#!/data/data/com.termux/files/usr/bin/env bash
# StyliX uninstaller
set -u
HOME_T="${HOME:-/data/data/com.termux/files/home}"
ZSHRC="$HOME_T/.zshrc"
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"

echo "[+] Removing StyliX..."
if [ -f "$ZSHRC" ]; then
    sed -i '/# >>> stylix >>>/,/# <<< stylix <<</d' "$ZSHRC"
fi
# clean legacy bash hook too
if [ -f "$HOME_T/.bashrc" ]; then
    sed -i '/# >>> stylix >>>/,/# <<< stylix <<</d' "$HOME_T/.bashrc" 2>/dev/null || true
fi
rm -rf "$HOME_T/.stylix"
rm -f "$PREFIX/bin/stylixx" "$PREFIX/bin/unstylixx" "$PREFIX/bin/helpx"
rm -f "$HOME_T/.hushlogin"

# restore Termux MOTD backups
for bak in \
    "$PREFIX/etc/motd.stylix-bak" \
    "$PREFIX/etc/motd-playstore.stylix-bak" \
    "$PREFIX/etc/motd.sh.stylix-bak"
do
    if [ -e "$bak" ]; then
        dest="${bak%.stylix-bak}"
        mv -f "$bak" "$dest"
        echo "[+] Restored $(basename "$dest")"
    fi
done

if [ -f "$ZSHRC.pre-stylix" ]; then
    cp "$ZSHRC.pre-stylix" "$ZSHRC"
    echo "[+] Restored ~/.zshrc from ~/.zshrc.pre-stylix"
fi

echo "[+] StyliX removed. Restart your shell."
EOF
chmod +x "$PREFIX/bin/unstylixx"

# keep a copy for: bash install.sh --uninstall
cp "$PREFIX/bin/unstylixx" "$STYLIX_DIR/uninstall.sh"
chmod +x "$STYLIX_DIR/uninstall.sh"

cp "$REPO_DIR/core/helpx" "$PREFIX/bin/helpx"
chmod +x "$PREFIX/bin/helpx"
ok "Commands installed: stylixx · unstylixx · helpx"

# ---------- optional login gate ----------
echo
printf '%s[?]%s Set up a login screen? %s[y/N]%s ' "$CY" "$XX" "$BW" "$XX"
read -r want_login
if [ "${want_login:-n}" = "y" ] || [ "${want_login:-n}" = "Y" ]; then
    while true; do
        printf '%s[?]%s Username: ' "$CY" "$XX"; read -r u1
        printf '%s[?]%s Password: ' "$CY" "$XX"; read -r -s p1; echo
        printf '%s[?]%s Confirm password: ' "$CY" "$XX"; read -r -s p2; echo
        if [ -n "$u1" ] && [ -n "$p1" ] && [ "$p1" = "$p2" ]; then
            break
        fi
        warn "Empty or mismatched credentials - try again."
    done
    printf '%s\n%s\n' "$u1" "$(printf '%s' "$p1" | sha256sum | cut -d' ' -f1)" \
        > "$STYLIX_DIR/login"
    chmod 600 "$STYLIX_DIR/login"
    ok "Login gate enabled - password stored as SHA-256 hash (chmod 600)."
else
    rm -f "$STYLIX_DIR/login"
    ok "Login skipped - shell opens directly."
fi

# ---------- done ----------
echo
printf '%s\n' "  ${GN}╭──────────────────────────────────────────────────╮${XX}"
printf '%s\n' "  ${GN}│${XX}  ${GR}✔  StyliX installed${XX}                             ${GN}│${XX}"
printf '%s\n' "  ${GN}│${XX}  ${BW}Restart Termux to enter your styled zsh shell${XX}   ${GN}│${XX}"
printf '%s\n' "  ${GN}├──────────────────────────────────────────────────┤${XX}"
printf '%s\n' "  ${GN}│${XX}  ${DM}created by${XX} ${BW}MrHacker-X${XX}                           ${GN}│${XX}"
printf '%s\n' "  ${GN}╰──────────────────────────────────────────────────╯${XX}"
echo
info "After restart type ${BW}helpx${XX} to see all shortcuts."
info "Manage: ${BW}stylixx on | off | status${XX}   Uninstall: ${BW}unstylixx${XX}"
echo
