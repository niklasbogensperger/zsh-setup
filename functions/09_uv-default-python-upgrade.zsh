function uv-default-python-upgrade() {
  echo "\n\033[34m==>\033[0m Deleting current uv lock file and .venv in $HOME/.local/uv-default..."
  rm -rf $HOME/.local/uv-default/uv.lock
  rm -rf $HOME/.local/uv-default/.venv

  echo "\n\033[34m==>\033[0m Generating new uv lock file from leftover pyproject.toml..."
  uv-default lock

  echo "\n\033[34m==>\033[0m Re-adding packages to environment..."
  uv-default sync

  echo "\n\033[32m==>\033[0m Upgrade of python version in uv-default environment completed."
}
