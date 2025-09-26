# PowerShell Script to get current user information
Write-Host "Getting current user information..."
$currentUser = $env:USERNAME
$currentUserDetails = Get-LocalUser -Name $currentUser

Write-Host "Username: $currentUser"
Write-Host "Full Name: $($currentUserDetails.FullName)"
Write-Host "Description: $($currentUserDetails.Description)"
Write-Host "Enabled: $($currentUserDetails.Enabled)"
Write-Host "Password Last Set: $($currentUserDetails.PasswordLastSet)"
Write-Host "Last Logon: $($currentUserDetails.LastLogon)"