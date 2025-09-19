# 获取当前用户信息的PowerShell脚本

# 获取当前Windows用户
$currentUser = whoami
Write-Output "当前用户: $currentUser"

# 获取当前用户的详细信息
$userObject = Get-WmiObject -Class Win32_UserAccount -Filter "Name='$currentUser'"
Write-Output "用户名: $($userObject.Name)"
Write-Output "全名: $($userObject.FullName)"
Write-Output "描述: $($userObject.Description)"
Write-Output "SID: $($userObject.SID)"
Write-Output "账户类型: $($userObject.AccountType)"