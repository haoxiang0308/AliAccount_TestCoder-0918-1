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
