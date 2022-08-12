# Encrypting a file using gpg/gnupg
function encryptfile() {
    # use ANSI red color code for an extra warning
    printf "The original file will be \033[0;31mDELETED\033[0m after encryption and will be \033[0;31mUNRECOVERABLE\033[0m without the password! To decrypt, run decryptfile on the file.\n"
    read 'CONTINUE?Do you want to continue [y/N]? '
    if [[ $CONTINUE =~ ^[Yy]$ ]]; then
        if gpg --output "${1}.gpgenc" --symmetric --cipher-algo AES256 --no-symkey-cache "$1"; then
            rm -rf "$1"
        else
            printf 'Something went wrong during encryption or the process was aborted. The input file was not deleted.\n'
            return 1
        fi
    else
        printf 'Your reply was something else than Y or y, so the process was aborted. The input file was not deleted.\n'
        return 1
    fi
}
