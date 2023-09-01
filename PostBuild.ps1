[CmdletBinding()]

param (
    [Parameter(Mandatory)][string]$Name,
    [Parameter(Mandatory)][string]$Dll,
    [Parameter(Mandatory)][string]$Game,
    [string]$Config
)

# Set dist folder.
$dist = ".\dist"
$Version = (Get-ChildItem "$Dll").VersionInfo.FileVersion

# Clean dist folder.
Remove-Item "$dist\$Name" -Recurse

# Create final module folder in the `dist` directory.
Copy-Item ".\Module" -Destination "$dist\$Name" -Recurse -Exclude SubModule.xml, .gitkeep

# Copy the built assembly in place.
Copy-Item "$Dll" -Destination "$dist\$Name\bin\Win64_Shipping_Client"

# Evaluate macros and copy SubModule.xml.
(Get-Content ".\Module\SubModule.xml" -Raw) `
    -Replace '\$\(Version\)', "$Version" `
    -Replace '\$\(Name\)', "$Name" | Set-Content -Path "$dist\$Name\SubModule.xml"

# Install the module into the game directory.
Remove-Item "$Game\Modules\$Name" -Recurse
Copy-Item "$dist\$Name" -Destination "$Game\Modules" -Recurse

# Run the game with our module if we're debugging.
if ($Config -eq "Debug") {
    Start-Process -FilePath "$Game\bin\Win64_Shipping_Client\Bannerlord.exe" -WorkingDirectory "$Game\bin\Win64_Shipping_Client" -ArgumentList "/singleplayer _MODULES_*Native*SandBoxCore*CustomBattle*SandBox*StoryMode*$Name*_MODULES_"
}

# Archive the final folder if we're releasing.
if ($Config -eq "Release") {
    # Remove the archive if it already exists.
    if (Test-Path "$dist\$Name-$Version.zip" -PathType Leaf) {
        Remove-Item "$dist\$Name-$Version.zip"
    }
    
    Compress-Archive "$dist\$Name" "$dist\$Name-$Version.zip"
}
