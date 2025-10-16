# PowerShell脚本：获取当前用户信息并保存到随机命名的.ps1文件中

# 获取当前用户信息
$currentUserInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserSID = (Get-CimInstance Win32_UserAccount | Where-Object {$_.Name -eq $env:USERNAME}).SID
    HomeDirectory = $env:USERPROFILE
    LogonServer = $env:LOGONSERVER
}

# 显示当前用户信息
Write-Host "当前用户信息:"
Write-Host "用户名: $($currentUserInfo.UserName)"
Write-Host "用户域: $($currentUserInfo.UserDomain)"
Write-Host "计算机名: $($currentUserInfo.ComputerName)"
Write-Host "用户SID: $($currentUserInfo.UserSID)"
Write-Host "主目录: $($currentUserInfo.HomeDirectory)"
Write-Host "登录服务器: $($currentUserInfo.LogonServer)"

# 生成随机文件名
$randomFileName = "UserInfo_" + (Get-Random -Maximum 10000) + ".ps1"

# 将用户信息保存到随机命名的文件中
$content = @"
# 保存的用户信息 - $(Get-Date)
`$savedUserInfo = @{
    UserName = "$($currentUserInfo.UserName)"
    UserDomain = "$($currentUserInfo.UserDomain)"
    ComputerName = "$($currentUserInfo.ComputerName)"
    UserSID = "$($currentUserInfo.UserSID)"
    HomeDirectory = "$($currentUserInfo.HomeDirectory)"
    LogonServer = "$($currentUserInfo.LogonServer)"
}
"@

# 写入文件
$content | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "用户信息已保存到文件: $randomFileName"