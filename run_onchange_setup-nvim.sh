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

# 3. Install homebrew in current user's home if not installed
#
# Define the custom installation path
BREW_PATH="$HOME/.homebrew"

# Check if the 'brew' executable exists in the custom path
if [ ! -f "$BREW_PATH/bin/brew" ]; then
    echo "Homebrew not found at $BREW_PATH. Attempting custom installation..."
    mkdir $BREW_PATH \
        && curl -L https://github.com/Homebrew/brew/tarball/master \
        | tar xz --strip 1 -C $BREW_PATH

    brew install neofetch ripgrep zoxide || true
else
    echo "Homebrew is already installed at $BREW_PATH."
fi

# download and extract bitwarden cli to ~/.local/bin if it wasn't in PATH
#
# Define the installation directory
INSTALL_DIR="$HOME/.local/bin"
# Define the URL for the latest Linux x64 release
DOWNLOAD_URL="https://vault.bitwarden.com/download/?platform=linux&app=cli"
TEMP_FILE="/tmp/bw_cli_temp.zip"

# 1. Check if Bitwarden CLI (bw) is already executable
if command -v bw &> /dev/null; then
    echo "Bitwarden CLI is already installed and executable."
else
    # 2. Check for required dependencies
    if ! command -v curl &> /dev/null; then
        echo "Error: 'curl' is required for downloading."
        exit 1
    fi
    if ! command -v unzip &> /dev/null; then
        echo "Error: 'unzip' is required for extraction."
        exit 1
    fi

    echo "Bitwarden CLI (bw) not found. Starting installation..."

    # 3. Create the installation directory if it doesn't exist
    mkdir -p "$INSTALL_DIR"

    # 4. Download, unzip, and clean up
    echo "Downloading Bitwarden CLI from GitHub..."
    curl -L "$DOWNLOAD_URL" -o "$TEMP_FILE"

    if [ $? -ne 0 ]; then
        echo "Error: Failed to download the Bitwarden CLI."
        rm -f "$TEMP_FILE"
        exit 1
    fi

    echo "Extracting to $INSTALL_DIR..."
    # Unzip the contents directly into the target directory
    unzip -o "$TEMP_FILE" -d "$INSTALL_DIR"

    # Ensure the executable has permissions
    chmod +x "$INSTALL_DIR/bw"

    # Clean up the temporary file
    rm "$TEMP_FILE"

    echo "Installation complete. 'bw' is available in $INSTALL_DIR"
    echo "Note: Ensure $HOME/.local/bin is in your \$PATH for direct execution."
fi
