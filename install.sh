#!/usr/bin/env bash
set -e

INSTALL_DIR="${1:-$HOME/.local/bin}"
SCRIPT_NAME="ghostty-theme-picker"

if ! command -v ghostty &>/dev/null; then
    echo "Warning: ghostty not found in PATH"
fi

if ! command -v fzf &>/dev/null; then
    echo "Warning: fzf not found. Install with: brew install fzf"
fi

mkdir -p "$INSTALL_DIR"
cp "$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

echo "Installed to $INSTALL_DIR/$SCRIPT_NAME"

if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo ""
    echo "Note: $INSTALL_DIR is not in your PATH."
    echo "Add this to your ~/.zshrc or ~/.bashrc:"
    echo "  export PATH=\"$INSTALL_DIR:\$PATH\""
fi
