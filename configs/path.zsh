# Homebrew (has its own logic for updating $PATH, so just run that)
eval "$(/opt/homebrew/bin/brew shellenv)"

# Rust (has its own logic for updating $PATH, so just run that)
source "$HOME/.cargo/env"

# Python default virtual environment (via uv)
export PATH="$HOME/.local/uv-default/.venv/bin:$PATH"

# TeXLive manual local install (update each year)
export PATH="$PATH:$HOME/.local/texlive/2025basic/bin/universal-darwin"
export TEXMFHOME="$HOME/.local/texlive/2025basic/texmf"
export TEXMFCONFIG="$HOME/.local/texlive/2025basic/texmf-config"
export TEXMFVAR="$HOME/.local/texlive/2025basic/texmf-var"

# Flutter
# export PATH="$PATH:$HOME/Library/flutter/bin"

# Android
# export ANDROID_HOME="$HOME/Library/Android"
# export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
# export PATH="$PATH:$ANDROID_HOME/emulator"
# export PATH="$PATH:$ANDROID_HOME/platform-tools"

# VS Code
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
