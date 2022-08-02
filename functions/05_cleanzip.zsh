# Creating clean zip files (by excluding hidden files/directories and macOS-specific special files)
function cleanzip() {
    if [[ $# -eq 0 ]]; then
        printf 'No arguments provided. Specify at least one file or directory path.\n'
        return 1
    fi
    # read would not print the newline in zsh without a "POSIX-quote" (dollar sign before single quotes)
    read $'ARCHIVENAME?What should the name of the .zip file be?\n'
    cwd="$(pwd)"
    commondir=$(longest_common_prefix "$@")
    cd $commondir
    tozip=()
    for name in "$@"; do
        tozip+=("./$(path_without_prefix $commondir $name)")
    done
    zip -r ~/${ARCHIVENAME}.zip $tozip[@] -x '*/.*' -x '.*' -x '__MACOSX'
    printf "To examine the contents of the zip file, use: zipinfo ~/\"${ARCHIVENAME}\".zip\n"
    cd $cwd
}
