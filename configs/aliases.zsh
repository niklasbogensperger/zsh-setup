# for default flags
alias icdiff='icdiff -r'
alias nnn='nnn -d -H'

# for replacing existing commands
alias diff='colordiff -r'
alias ls='exa --all --all --long --group-directories-first --classify --extended --header --time-style=long-iso'
alias ping='prettyping'

# for quick access to my own scripts
alias raworphans='python3 /Users/niklasbogensperger/Documents/Projects/\[local\]\ \[python\]\ Raw\ Orphans/removeRawOrphans.py'

# for quick access to frequent workflows
alias dockspacer="defaults write com.apple.dock persistent-apps -array-add '{\"tile-type\"=\"small-spacer-tile\";}' && killall Dock"
alias scrubexif='exiftool -all='
alias scrubgps='exiftool -GPS\*='
alias setdate='exiftool "-alldates<filename"'
alias setnameall='exiftool -d "%Y-%m-%d %H.%M.%S.%%e" "-filename<CreateDate"'
alias tarinfo='tar -tvf'
alias youtube-dl='yt-dlp'
alias ytmusic='yt-dlp -f m4a'

# for updates/upgrades/installs
alias pipupdate='pip3 list --outdated'
alias pipupgrade='pip3 install --upgrade'
alias pipinstall='pip3 install'
alias texupdate='tlmgr update --list'
alias texupgrade='sudo tlmgr update --all'
alias texinstall='sudo tlmgr install'
