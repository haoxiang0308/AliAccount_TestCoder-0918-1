# PowerShell脚本：获取当前用户信息并保存到随机命名的.ps1文件中

# 获取当前用户信息
$currentUserInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserSID = (Get-CimInstance Win32_UserAccount -Filter "Name='$env:USERNAME'").SID
    HomeDirectory = $env:USERPROFILE
    FullName = (Get-CimInstance Win32_UserAccount -Filter "Name='$env:USERNAME'").FullName
    Description = (Get-CimInstance Win32_UserAccount -Filter "Name='$env:USERNAME'").Description
}

# 创建包含用户信息的脚本内容
$scriptContent = @"
# 当前用户信息
`$userInfo = @{
    UserName = "$($currentUserInfo.UserName)"
    UserDomain = "$($currentUserInfo.UserDomain)"
    ComputerName = "$($currentUserInfo.ComputerName)"
    UserSID = "$($currentUserInfo.UserSID)"
    HomeDirectory = "$($currentUserInfo.HomeDirectory)"
    FullName = "$($currentUserInfo.FullName)"
    Description = "$($currentUserInfo.Description)"
}

# 显示用户信息
Write-Host "当前用户信息："
Write-Host "用户名: `$userInfo.UserName"
Write-Host "用户域: `$userInfo.UserDomain"
Write-Host "计算机名: `$userInfo.ComputerName"
Write-Host "用户SID: `$userInfo.UserSID"
Write-Host "主目录: `$userInfo.HomeDirectory"
Write-Host "全名: `$userInfo.FullName"
Write-Host "描述: `$userInfo.Description"

# 输出用户信息
`$userInfo
"@

# 生成随机文件名 (使用GUID的一部分确保唯一性)
$randomFileName = "user_info_" + (Get-Random -Maximum 99999) + ".ps1"

# 将脚本内容保存到随机命名的文件中
$scriptContent | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "用户信息已保存到文件: $randomFileName"
Write-Host "文件位置: $(Get-Location)\$randomFileName"