# Non-persistently decrypting a file using gpg/gnupg and displaying the content in the terminal
function tmpdecryptfile() {
    # "gpg --output -" means output to stdout (which is saved into $secretoutput)
    # the output needs to be saved to a variable for now, since less does not play well with gpg's output
    if secretoutput=$(gpg --output - --decrypt --no-symkey-cache $1); then
        echo "$secretoutput" | less
        unset secretoutput
    else
        printf 'Something went wrong during decryption or the process was aborted.\n'
        return 1
    fi
}
