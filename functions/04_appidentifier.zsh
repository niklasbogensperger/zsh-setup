# Getting the bundle identifier of applications
function appidentifier() {
    osascript -e "id of app \"$1\""
}
