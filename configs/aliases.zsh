# for default flags
alias delta='delta --side-by-side --diff-so-fancy'
alias nnn='nnn -d -H'

# for replacing existing commands
alias diff='colordiff -r'
alias ls='eza --all --all --long --group-directories-first --classify --header --time-style=long-iso'
alias lsex='eza --all --all --long --group-directories-first --classify --extended --header --time-style=long-iso'
alias ping='prettyping'

# for quick access to my own scripts
alias raworphans='python3 /Users/niklasbogensperger/Projects/\[local\]\ \[python\]\ Raw\ Orphans/removeRawOrphans.py'

# for quick access to frequent workflows
alias dockspacer="defaults write com.apple.dock persistent-apps -array-add '{\"tile-type\"=\"small-spacer-tile\";}' && killall Dock"
alias scrubexif='exiftool -all='
alias scrubgps='exiftool -GPS\*='
alias setdate='exiftool "-alldates<filename"'
alias setnameall='exiftool -d "%Y-%m-%d %H.%M.%S.%%e" "-filename<CreateDate"'
alias tarinfo='tar -tvf'
alias ytmusic='yt-dlp -f m4a'
