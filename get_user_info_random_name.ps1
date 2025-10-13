# PowerShell脚本：获取当前用户信息并保存到随机命名的.ps1文件中
# 获取当前用户信息
$currentUserInfo = whoami /all

# 生成一个随机的.ps1文件名
$randomFileName = "UserInfo_" + (Get-Random -Maximum 10000) + ".ps1"

# 将用户信息写入随机命名的文件
$currentUserInfo | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "当前用户信息已保存到文件: $randomFileName"