#!/bin/zsh

# Function to get Teams version if the app exists
getTeamsVersionIfExists() {
    local teamsApp="$1"
    
    if [[ -e "$teamsApp" ]]; then
        local teamsVer=$(defaults read "$teamsApp/Contents/Info.plist" CFBundleShortVersionString)
        
        if [[ "$teamsVer" != "" ]]; then
            local appName=$(basename "$teamsApp" .app)
            echo "<result>$appName: $teamsVer</result>"
            exit 0
        fi
    fi
}

# Check for Microsoft Teams.app, Microsoft Teams (work or school).app, or Microsoft Teams classic.app
getTeamsVersionIfExists "/Applications/Microsoft Teams.app"
getTeamsVersionIfExists "/Applications/Microsoft Teams (work or school).app"
getTeamsVersionIfExists "/Applications/Microsoft Teams classic.app"

# If none of the versions are found, echo "Not Installed"
echo "<result>Not Installed</result>"

exit 0
