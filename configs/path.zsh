# for homebrew
export PATH="/usr/local/sbin:$PATH"

# for python environment
export PYTHONPATH="$PYTHONPATH:/usr/local/opt/python/bin"
export PATH="$PATH:/usr/local/opt/python/bin"

# for flutter environment
export PATH="$PATH:$HOME/Library/flutter/bin"

# for android environment
export ANDROID_HOME="$HOME/Library/Android"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# for rust (has its own logic for updating $PATH, so just run that)
source "$HOME/.cargo/env"
