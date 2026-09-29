#!/data/data/com.termux/files/usr/bin/env bash
# StyliX boot animation - short and honest
frames=(
"Initializing StyliX shell..."
"Loading aliases and helpers..."
"Applying theme and prompt..."
"Ready."
)
for f in "${frames[@]}"; do
    printf '\e[1;32m%s\e[0m\n' "$f"
    sleep 0.12
done
