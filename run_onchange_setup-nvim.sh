#!/bin/bash

set -euo pipefail

BOB_INSTALL_DIR="$HOME/.local/share/bob"
CARGO_DIR="$HOME/.cargo/bin"
NEOVIM_VERSION="0.10.0"
BOB_REPO="https://github.com/MordechaiHadad/bob.git"

echo "Ensuring ~/.local/share directory exists..."
mkdir -p "$HOME/.local/share"

# Check if Rust and Cargo are installed
if ! command -v cargo &> /dev/null
then
    echo "Cargo is not installed. Please install Rust and Cargo (e.g., via rustup.rs) to build bob."
    exit 1
fi

# 1. Install bob using cargo build
if [ ! -f "$CARGO_DIR/bob" ]; then
    echo "Building bob with cargo..."
    cargo install --git $BOB_REPO
    echo "bob installed using cargo build."
else
    echo "bob is already installed."
fi

# 2. Use bob to install nvim 0.10.0
echo "Installing Neovim $NEOVIM_VERSION using bob..."
"$CARGO_DIR/bob" use "$NEOVIM_VERSION"
