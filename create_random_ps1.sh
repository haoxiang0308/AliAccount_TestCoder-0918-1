#!/bin/bash

# Generate a random name for the PowerShell script
random_name="user_info_$(openssl rand -hex 8).ps1"

# Create the PowerShell script with user information retrieval code
cat > "$random_name" << 'EOF'
# PowerShell script to get current user information
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$userInfo = @{
    Name = $currentUser.Name
    UserPrincipalName = $currentUser.User.Value
    AuthenticationType = $currentUser.AuthenticationType
    IsAuthenticated = $currentUser.IsAuthenticated
}

# Display user information
Write-Host "Current User Information:"
Write-Host "Name: $($userInfo.Name)"
Write-Host "User Principal Name: $($userInfo.UserPrincipalName)"
Write-Host "Authentication Type: $($userInfo.AuthenticationType)"
Write-Host "Is Authenticated: $($userInfo.IsAuthenticated)"

# Alternative approach using environment variables
Write-Host "`nAlternative method using environment variables:"
Write-Host "Username: $env:USERNAME"
Write-Host "User Domain: $env:USERDOMAIN"
Write-Host "Computer Name: $env:COMPUTERNAME"
EOF

echo "Created PowerShell script: $random_name"