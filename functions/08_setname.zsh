# Setting the file name of photos/videos to one of the timestamps embedded in the metadata tags
function setname () {
    if [[ $# -eq 0 ]]; then
        printf 'Please provide at least one file or folder.\n'
        return 1
    fi

    files=()
    for argument in "$@"; do
        if [[ ! -f "$argument" ]]; then
            if [[ ! -d "$argument" ]]; then
                printf 'Arguments contain an element which is not a file or folder.\n'
                return 1
            else
                # see https://unix.stackexchange.com/a/710369
                files+=("${(@f)$(find $argument -not -path '*/.*' -type f)}")
            fi
        else
            files+=("$argument")
        fi
    done

    for file in $files; do
        printf "\n--- file: $file\n"
        local tagnames=(CreateDate CreationDate filemodifydate DateTimeOriginal)
        values=()
        valuetags=()
        splitdate=()
        splithours=()
        splitminsec=()
        #splitzone=()
        combined=()

        for tag in $tagnames; do
            #value="$(exiftool -s -s -s -d "%Y-%m-%d %H.%M.%S%z" -$tag $file)"
            value="$(exiftool -s -s -s -d "%Y-%m-%d %H.%M.%S" -$tag $file)"
            if [[ ! -z $value ]]; then
                values+=($value)
                valuetags+=($tag)
            fi
        done
        for ((i = 1; i <= $#values; i++)); do
            printf '%-2s' "$i"
            printf '%-22s' " - ${valuetags[$i]}"
            printf "${values[$i]}\n"
            IFS=' ' read -r vdate vtime <<< ${values[$i]}
            #IFS='+' read -r vtime vzone <<< $vtimeandzone
            IFS='.' read -r vhrs vminsec <<< $vtime
            splitdate+=($vdate)
            splithours+=($vhrs)
            splitminsec+=($vminsec)
            #splitzone+=($vzone)
        done
        # see https://unix.stackexchange.com/a/167153
        splitdate=(${(u)splitdate[@]})
        splithours=(${(u)splithours[@]})
        splitminsec=(${(u)splitminsec[@]})
        #splitzone=(${(u)splitzone[@]})
        #splitzone=("" "${splitzone[@]}")

        for ((j = 1; j <= $#splitdate; j++)); do
            for ((k = 1; k <= $#splithours; k++)); do
                for ((kk = 1; kk <= $#splitminsec; kk++)); do
                    #for ((l = 1; l <= $#splitzone; l++)); do
                        #if [[ ! -z ${splitzone[$l]} ]]; then
                            #string="${splitdate[$j]} ${splithours[$k]}.${splitminsec[$kk]}+${splitzone[$l]}"
                        #else
                            string="${splitdate[$j]} ${splithours[$k]}.${splitminsec[$kk]}"
                        #fi
                        # see https://gist.github.com/ClementNerma/1dd94cb0f1884b9c20d1ba0037bdcde2#arrays
                        if (( $values[(Ie)$string] )); then
                            continue
                        else
                            combined+=($string)
                        fi
                    #done
                done
            done
        done
        combined=(${(u)combined[@]})
        for ((m = 1; m <= $#combined; m++)); do
            printf '%-2s' "$((i + m - 1))"
            printf '%-22s' " - combination $m"
            printf "${combined[$m]}\n"
        done

        read "SELECTION?Which of these looks correct [1-$((i + m - 2))]? Abort by inputting anything else. "
        if [[ $SELECTION =~ ^[1-$((i - 1))]$ ]]; then
            exiftool -d "%Y-%m-%d %H.%M.%S.%%e" "-filename<${valuetags[$SELECTION]}" $file
        elif [[ $SELECTION =~ ^[$i-$((i + m - 2))]$ ]]; then
            IFS='+' read -r name tmp <<< "${combined[$(($SELECTION - i + 1))]}"
            exiftool "-filename=${name}.%e" $file
        else
            printf 'Your reply was not a valid selection, so the process was aborted. No changes were made to this file.\n'
            return 1
        fi
    done
}
