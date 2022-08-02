# Encrypting a file using gpg/gnupg
function encryptfile() {
    printf 'The original file will be deleted after encryption and will be unrecoverable without the password! To decrypt, run decryptfile on the file.\n'
    read 'CONTINUE?Do you want to continue [y/N]? '
    printf '\n'
    if [[ $CONTINUE =~ ^[Yy]$ ]]; then
        if gpg --output "${1}.gpgenc" --symmetric --cipher-algo AES256 --no-symkey-cache "$1"; then
            rm -rf "$1"
        else
            printf 'Something went wrong during encryption or the process was aborted. The original file was not deleted.\n'
            return 1
        fi
    else
        printf 'Your reply was something else than Y or y, so the process was aborted. The original file was not deleted.\n'
        return 1
    fi
}
