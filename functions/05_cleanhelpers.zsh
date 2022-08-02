# Helpers for creating clean zip and tar files (by excluding hidden files/directories and macOS-specific special files)
# see https://stackoverflow.com/a/12341334
function longest_common_prefix() {
    typeset -a names
    typeset -a parts
    typeset -i i
    names=("$@")
    i=1  # arrays are 1-indexed in most shells except e.g. bash
    name="$1"

    # "while <expression>; [condition]" emulates the functionality of a do-while loop
    while x=$(dirname "$name"); [ "$x" != "/" -a "$x" != "." ]; do
        parts[$i]="$x"
        i=$(($i + 1))
        name="$x"
    done

    for prefix in "${parts[@]}"; do
        for name in "${names[@]}"; do
            if [ "${name#$prefix/}" = "${name}" ]; then
                continue 2
            fi
        done
        echo "$prefix"
        break
    done
}
# see https://stackoverflow.com/a/12341334
function path_without_prefix() {
    typeset prefix="$1/"
    typeset arg
    # shift discards the first passed argument $1 and shifts all other arguments by one (e.g. $2 -> $1) ($0 is untouched)
    shift
    for arg in "$@"; do
        # see https://stackoverflow.com/a/25536935
        # ${var#pattern} removes smallest string from the left side that matches the pattern
        echo "${arg#$prefix}"
    done
}
