# 获取当前用户信息并保存到文件
# 生成随机文件名后缀
$randomSuffix = -join ((65..90) + (97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
$outputFile = "user_info_$randomSuffix.txt"

Write-Host "正在获取用户信息..."
$userInfo = whoami
$envInfo = "$env:USERDOMAIN\\$env:USERNAME"

Write-Host "正在保存到文件: $outputFile"
$userInfo | Out-File -FilePath $outputFile
$envInfo | Out-File -FilePath $outputFile -Append

Write-Host "信息已保存!"
Get-Content $outputFile