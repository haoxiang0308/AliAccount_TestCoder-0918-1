# 生成随机命名的脚本文件

# 定义保存路径
$scriptPath = "/workspace/Get-UserInfo.ps1"
$outputDirectory = "/workspace/"

# 检查源脚本是否存在
if (-not (Test-Path $scriptPath)) {
    Write-Error "源脚本文件不存在: $scriptPath"
    exit 1
}

# 生成随机文件名
$randomName = -join ((65..90) + (97..122) | Get-Random -Count 10 | ForEach-Object {[char]$_})
$randomFileName = "UserInfo_$randomName.ps1"
$outputPath = Join-Path $outputDirectory $randomFileName

# 复制脚本到新文件
Copy-Item -Path $scriptPath -Destination $outputPath

Write-Host "脚本已保存为随机命名的文件: $outputPath" -ForegroundColor Green