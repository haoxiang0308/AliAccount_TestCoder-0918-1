# PowerShell script to get current user information and save to a randomly named .ps1 file

# Get current user information
$userInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    HomeDirectory = $env:USERPROFILE
    ComputerName = $env:COMPUTERNAME
    CurrentDirectory = Get-Location
}

# Convert user info to string representation
$userInfoString = @"
# Current User Information
UserName = '$($userInfo.UserName)'
UserDomain = '$($userInfo.UserDomain)'
HomeDirectory = '$($userInfo.HomeDirectory)'
ComputerName = '$($userInfo.ComputerName)'
CurrentDirectory = '$($userInfo.CurrentDirectory)'
"@

# Generate random filename
$randomFileName = "user_info_" + (Get-Random -Maximum 99999) + ".ps1"

# Save user information to the randomly named file
$userInfoString | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "Current user information saved to: $randomFileName"
Write-Host $userInfoString