#!/bin/bash

# Script to get current user information and save to a randomly named .ps1 file

# Get current user information
username=$(whoami)
homedir=$(eval echo ~$username)
hostname=$(hostname)
current_dir=$(pwd)

# Create PowerShell-compatible content
ps1_content="# Current User Information
\$UserName = '$username'
\$UserDomain = '$(hostname)'
\$HomeDirectory = '$homedir'
\$ComputerName = '$hostname'
\$CurrentDirectory = '$current_dir'

Write-Host \"User information retrieved\"
"

# Generate random filename
random_number=$((RANDOM % 99999))
random_filename="user_info_${random_number}.ps1"

# Save user information to the randomly named file
echo "$ps1_content" > "$random_filename"

echo "Current user information saved to: $random_filename"
echo "$ps1_content"

# Also create a PowerShell script that would do the same thing if run in PowerShell
cat > get_user_info_actual.ps1 << 'EOF'
# Get current user information
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$userName = $env:USERNAME
$userDomain = $env:USERDOMAIN
$homeDirectory = $env:USERPROFILE
$computerName = $env:COMPUTERNAME
$currentDirectory = Get-Location

# Create user info string
$userInfoString = @"
# Current User Information
UserName = '$userName'
UserDomain = '$userDomain'
HomeDirectory = '$homeDirectory'
ComputerName = '$computerName'
CurrentDirectory = '$currentDirectory'
"@

# Generate random filename
$randomFileName = "user_info_" + (Get-Random -Maximum 99999) + ".ps1"

# Save user information to the randomly named file
$userInfoString | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "Current user information saved to: $randomFileName"
EOF

echo "Created PowerShell script: get_user_info_actual.ps1"