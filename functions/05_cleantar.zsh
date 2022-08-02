# Creating clean tar files (by excluding hidden files/directories and macOS-specific special files)
function cleantar() {
    if [[ $# -eq 0 ]]; then
        printf 'No arguments provided. Specify at least one file or directory path.\n'
        return 1
    fi
    # read would not print the newline in zsh without a "POSIX-quote" (dollar sign before single quotes)
    read $'ARCHIVENAME?What should the name of the .tar file be?\n'
    cwd="$(pwd)"
    commondir=$(longest_common_prefix "$@")
    cd $commondir
    totar=()
    for name in "$@"; do
        totar+=("./$(path_without_prefix $commondir $name)")
    done
    # see https://superuser.com/a/260264
    COPYFILE_DISABLE=1 tar -cv --exclude='*/.*' --exclude '.*' --exclude '__MACOSX' -f ~/${ARCHIVENAME}.tar $totar[@]
    printf "To examine the contents of the tar file, use: tarinfo ~/\"${ARCHIVENAME}\".tar\n"
    cd $cwd
}
