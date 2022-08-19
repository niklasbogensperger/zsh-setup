# Computing file hashes (and optionally checking it against a provided hash)
function checkhash() {
    if [[ ! -f $1 || $# -gt 2 ]]; then
        printf 'Please provide either one or two arguments - a filepath and (optionally) the hash to compare to.\n'
        return 1
    elif [[ $# -eq 2 && (-f $2 || -d $2) ]]; then
        printf 'Second argument is a file or directory. Please enter the hash to compare to as a string.\n'
        return 1
    fi
    hashmd5=$(md5 -q $1)
    # shasum does not have an option to truncate the STDIN echo like md5 does so do it manually (see https://unix.stackexchange.com/a/662898)
    hashsha1=$(shasum -a 1 $1)
    hashsha1=${hashsha1%% *}
    hashsha256=$(shasum -a 256 $1)
    hashsha256=${hashsha256%% *}
    if [[ $# -eq 1 ]]; then
        printf "\033[0;32mMD5:\033[0m     $hashmd5\n"
        printf "\033[0;32mSHA1:\033[0m    $hashsha1\n"
        printf "\033[0;32mSHA256:\033[0m  $hashsha256\n"
    else
        if [[ $hashmd5 == $2 ]]; then
            printf 'Provided hash matches \033[0;32mMD5\033[0m hash of file.\n'
        elif [[ $hashsha1 == $2 ]]; then
            printf 'Provided hash matches \033[0;32mSHA1\033[0m hash of file.\n'
        elif [[ $hashsha256 == $2 ]]; then
            printf 'Provided hash matches \033[0;32mSHA256\033[0m hash of file.\n'
        else
            printf 'Provided hash does not match any file hash (MD5, SHA1, SHA256). Was the provided hash maybe generated with a different hashing algorithm?\n'
            return 1
        fi
    fi
}
