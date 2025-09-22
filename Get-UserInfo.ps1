# 获取当前用户信息的PowerShell脚本

# 获取当前用户的基本信息
$currentUser = whoami
Write-Host "当前用户: $currentUser" -ForegroundColor Green

# 获取详细的用户信息
$userInfo = Get-LocalUser -Name $currentUser -ErrorAction SilentlyContinue
if ($userInfo) {
    Write-Host "用户名: $($userInfo.Name)" -ForegroundColor Cyan
    Write-Host "全名: $($userInfo.FullName)" -ForegroundColor Cyan
    Write-Host "描述: $($userInfo.Description)" -ForegroundColor Cyan
    Write-Host "是否启用: $($userInfo.Enabled)" -ForegroundColor Cyan
    Write-Host "上次密码更改时间: $($userInfo.LastPasswordChange)" -ForegroundColor Cyan
} else {
    Write-Host "无法获取本地用户详细信息" -ForegroundColor Yellow
}

# 获取当前用户的SID
try {
    $userSid = [System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value
    Write-Host "用户SID: $userSid" -ForegroundColor Magenta
} catch {
    Write-Host "无法获取用户SID: $_" -ForegroundColor Red
}

# 获取用户所属的组
Write-Host "`n用户所属的组:" -ForegroundColor Green
$groups = [System.Security.Principal.WindowsIdentity]::GetCurrent().Groups
foreach ($group in $groups) {
    try {
        $groupName = $group.Translate([System.Security.Principal.NTAccount]).Value
        Write-Host "  $groupName" -ForegroundColor Cyan
    } catch {
        Write-Host "  $($group.Value)" -ForegroundColor Yellow
    }
}

# 获取环境变量中的用户信息
Write-Host "`n环境变量信息:" -ForegroundColor Green
Write-Host "USERDOMAIN: $env:USERDOMAIN" -ForegroundColor Cyan
Write-Host "USERNAME: $env:USERNAME" -ForegroundColor Cyan
Write-Host "USERPROFILE: $env:USERPROFILE" -ForegroundColor Cyan
Write-Host "HOMEDRIVE: $env:HOMEDRIVE" -ForegroundColor Cyan
Write-Host "HOMEPATH: $env:HOMEPATH" -ForegroundColor Cyan

Write-Host "`n脚本执行完成。" -ForegroundColor Green