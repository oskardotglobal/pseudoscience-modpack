#!/bin/bash

# Define the URLs and the target directory
unsupUrl="https://git.sleeping.town/unascribed/unsup/releases/download/v0.2.3/unsup-0.2.3.jar"
unsupIniUrl="https://raw.githubusercontent.com/team-skyline/pseudoscience-modpack/v2/include/unsup.ini"
profileUrl="https://raw.githubusercontent.com/team-skyline/pseudoscience-modpack/v2/include/Launcher/profile.json"

# Retrieve the profile JSON
profileString=$(curl -s "$profileUrl")
profileString=$(echo "$profileString" | sed "s|%s|$HOME/Library/Application Support|g")

profileKey=$(python3 -c "import json; print(list(json.loads('''$profileString''').keys())[0])")
targetDir=$(python3 -c "import json; import os; print(json.loads('''$profileString''')['$profileKey']['gameDir'])")

# Create the directory if it doesn't exist
if [ ! -d "$targetDir" ]; then
    mkdir -p "$targetDir"
fi

# Download the files
curl -s "$unsupUrl" -o "$targetDir/unsup.jar"
curl -s "$unsupIniUrl" -o "$targetDir/unsup.ini"

# Update the launcher_profiles.json
profilesPath="$HOME/Library/Application Support/minecraft/launcher_profiles.json"
profilesString=$(cat "$profilesPath")
profiles=$(python3 -c "import json; data=json.loads('''$profilesString'''); data['profiles']['$profileKey']=json.loads('''$profileString''')['$profileKey']; print(json.dumps(data))")

# Save the updated file
echo "$profiles" > "$profilesPath"