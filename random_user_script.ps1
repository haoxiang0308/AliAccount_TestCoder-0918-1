# PowerShell script to get current user information
# 获取当前用户信息的PowerShell脚本

# Get the current user object
# 获取当前用户对象
$current_user = [System.Security.Principal.WindowsIdentity]::GetCurrent()

# Display the user's name, SID, and authentication type
# 显示用户名、SID（安全标识符）和身份验证类型
Write-Host "当前用户名: " $current_user.Name
Write-Host "用户SID: " $current_user.User
Write-Host "身份验证类型: " $current_user.AuthenticationType

# Alternatively, you can use the environment variable
# 或者，您可以使用环境变量
Write-Host "从环境变量获取的用户名: $env:USERNAME"
Write-Host "从环境变量获取的用户域: $env:USERDOMAIN"