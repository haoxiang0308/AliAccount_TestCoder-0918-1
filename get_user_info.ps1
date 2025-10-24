# PowerShell script to get current user information and save to a randomly named file

# Get current user information
$currentUserInfo = Get-ChildItem Env:\ | Where-Object {$_.Name -like "*USER*"}

# Alternative method to get user information
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$userPrincipal = New-Object System.Security.Principal.WindowsPrincipal([System.Security.Principal.WindowsIdentity]::GetCurrent())
$isAdministrator = $userPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)

# Create a custom object with user details
$userDetails = @{
    UserName = $currentUser
    IsAdministrator = $isAdministrator
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserHomePath = $env:USERPROFILE
}

# Convert to string format for output
$userInfoString = @"
Current User Information:
Username: $($userDetails.UserName)
Is Administrator: $($userDetails.IsAdministrator)
User Domain: $($userDetails.UserDomain)
Computer Name: $($userDetails.ComputerName)
Home Path: $($userDetails.UserHomePath)
"@

# Generate a random filename with .ps1 extension
$randomFileName = "user_info_" + (Get-Random -Maximum 10000) + ".ps1"

# Save the user information to the randomly named file
$userInfoString | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Output "Current user information has been saved to: $randomFileName"
Write-Output $userInfoString