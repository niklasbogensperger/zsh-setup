# Decrypting a file using gpg/gnupg
function decryptfile() {
    # use ANSI red color code for an extra warning
    printf 'The encrypted file will be \033[0;31mDELETED\033[0m after decryption. To re-encrypt, run encryptfile on the file again.\n'
    read 'CONTINUE?Do you want to continue [y/N]? '
    if [[ $CONTINUE =~ ^[Yy]$ ]]; then
        # "%.*" needed to remove (custom) .gpgenc file ending (see 01_encryptfile.zsh); see https://stackoverflow.com/a/34952009
        if gpg --output "${1%.*}" --decrypt --no-symkey-cache "$1"; then
            rm -rf "$1"
        else
            printf 'Something went wrong during decryption or the process was aborted. The input file was not deleted.\n'
            return 1
        fi
    else
        printf 'Your reply was something else than Y or y, so the process was aborted. The input file was not deleted.\n'
        return 1
    fi
}
