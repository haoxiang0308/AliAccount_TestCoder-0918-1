# PowerShell Script to Get Current User Information
# 获取当前用户信息

Write-Host "Getting current user information..." -ForegroundColor Green

# 获取当前用户主体名称 (User Principal Name)
$userPrincipalName = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
Write-Host "Current User (UPN): $userPrincipalName"

# 获取当前用户名 (User Name)
$userName = $env:USERNAME
Write-Host "Username: $userName"

# 获取当前用户域名 (Domain Name)
$userDomain = $env:USERDOMAIN
Write-Host "User Domain: $userDomain"

# 获取用户主目录 (Home Directory)
$userHomeDir = $env:USERPROFILE
Write-Host "Home Directory: $userHomeDir"

# 获取用户SID (Security Identifier)
try {
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $userSid = $currentUser.User.Value
    Write-Host "User SID: $userSid"
} catch {
    Write-Host "Could not retrieve User SID: $_" -ForegroundColor Red
}

Write-Host "User information retrieval completed." -ForegroundColor Green