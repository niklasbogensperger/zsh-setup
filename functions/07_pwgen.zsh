# Generating random passwords of desired length in base64 encoding
function pwgen() {
    if [[ $# -ne 1 ]]; then
        printf 'Please provide only one argument.\n'
        return 1
    fi
    # test if the argument is a number; see https://stackoverflow.com/a/806923
    re='^[0-9]+$'
    if [[ ! ($1 =~ $re) || $1 -lt 4 ]]; then
        printf 'The provided argument is not a valid password length. Please enter an integer (greater than or equal to 4).\n'
        return 1
    fi
    if [[ $(($1 % 4)) != '0' ]]; then
        printf 'The given password length would result in padding (= or ==) being applied to the end of your password. It was rounded down to the nearest multiple of 4.\n'
    fi
    # the shell floors integer division by default; for ceil, use: https://stackoverflow.com/a/12536521
    # the formula to get the actual length in characters of a base64 string is 4*ceil(input/3)
    # openssl requires the length to be given in bytes, so here we do the reverse and just floor the input in order to avoid padding
    # see: https://stackoverflow.com/a/17864767
    length_div=$(($1/4))
    length=$(($length_div*3))
    printf "Length of Password: $(($length_div*4))\n"
    printf "$(openssl rand -base64 $length)\n"
}
