# PowerShell脚本：获取当前用户信息并保存到随机命名的.ps1文件中

# 获取当前用户名和用户域
$currentUser = $env:USERNAME
$userDomain = $env:USERDOMAIN
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
# 生成一个包含时间戳的随机名称
$randomFileName = "UserInfo_$($env:USERNAME)_$($timestamp)_$(Get-Random).ps1"

# 创建包含用户信息的字符串
$userInfoContent = @"
# 生成时间: $(Get-Date)
# 用户域: $userDomain
# 用户名: $currentUser
"@

# 将用户信息写入新文件
$userInfoContent | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "当前用户信息已保存到文件: $randomFileName"
Write-Host "内容如下:"
Write-Host $userInfoContent