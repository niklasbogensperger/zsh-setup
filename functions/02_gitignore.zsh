# Creating up-to-date .gitignore files
function gitignore() {
    if [[ $# -eq 0 ]]; then
        printf 'No arguments provided. Specify at least one category of exclusions.\n'
        return 1
    else
        old_ifs="$IFS"
        IFS=','
        categories="$*"
        IFS=$old_ifs
        curl -sL https://www.toptal.com/developers/gitignore/api/$categories
        printf '\n'
    fi
}
