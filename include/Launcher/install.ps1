Import-Module Microsoft.PowerShell.Utility

# Define the URLs and the target directory
$unsupUrl = "https://git.sleeping.town/unascribed/unsup/releases/download/v0.2.3/unsup-0.2.3.jar"
$unsupIniUrl = "https://raw.githubusercontent.com/team-skyline/pseudoscience-modpack/v1.1/include/unsup.ini"
$profileUrl = "https://raw.githubusercontent.com/team-skyline/pseudoscience-modpack/v1.1/include/Launcher/profile.json"

$profile = Invoke-RestMethod $profileUrl
$profileName = $profile.PSObject.Properties.Name


$profile.$profileName.gameDir = $profile.$profileName.gameDir -replace "%s/", "$env:APPDATA\"
$targetDir = $profile.$profileName.gameDir

# Create the directory if it doesn't exist
if (!(Test-Path -Path $targetDir)) {
    New-Item -ItemType Directory -Force -Path $targetDir
}

# Download the files
Invoke-WebRequest -Uri $unsupUrl -OutFile "$targetDir\unsup.jar"
Invoke-WebRequest -Uri $unsupIniUrl -OutFile "$targetDir\unsup.ini"

# Update the launcher_profiles.json
$profilesPath = "$env:APPDATA\.minecraft\launcher_profiles.json"
$profiles = Get-Content -Path $profilesPath -Raw | ConvertFrom-Json

$profiles.profiles | Add-Member -NotePropertyName $profileName -NotePropertyValue $profile.$profileName


# Save the updated file
$newContent = ConvertTo-Json -InputObject $profiles
Set-Content -Path $profilesPath -Value $newContent
