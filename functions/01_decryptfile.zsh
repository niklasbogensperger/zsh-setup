# Decrypting a file using gpg/gnupg
function decryptfile() {
    printf 'The encrypted file will be deleted after decryption. To re-encrypt, run encryptfile on the file again.\n'
    read 'CONTINUE?Do you want to continue [y/N]? '
    printf '\n'
    if [[ $CONTINUE =~ ^[Yy]$ ]]; then
        if gpg --output "${1%.*}" --decrypt --no-symkey-cache "$1"; then
            rm -rf "$1"
        else
            printf 'Something went wrong during decryption or the process was aborted. The encrypted file was not deleted.\n'
            return 1
        fi
    else
        printf 'Your reply was something else than Y or y, so the process was aborted. The encrypted file was not deleted.\n'
        return 1
    fi
}
