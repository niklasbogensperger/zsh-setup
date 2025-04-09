function uv-default-python-upgrade() {
  local timestamp=$(date +"%Y%m%d_%H%M%S")
  local backup_file="$HOME/requirements_$timestamp.txt"

  echo "\033[34m==>\033[0m Exporting current uv environment requirements to $backup_file..."
  uv-default export -o "$backup_file"

  echo "\n\033[34m==>\033[0m Deleting old uv-default environment at $HOME/.local/uv-default..."
  rm -rf $HOME/.local/uv-default

  echo "\n\033[34m==>\033[0m Initializing new uv environment at $HOME/.local/uv-default..."
  uv init $HOME/.local/uv-default

  echo "\n\033[34m==>\033[0m Adding packages from backup file..."
  uv-default add -r "$backup_file"

  echo "\n\033[32m==>\033[0m Update of uv environment completed."
  echo "\nBackup requirements file is located at: $backup_file"
  echo "\033[1mTo remove the backup, run:\033[0m rm $backup_file"
}
