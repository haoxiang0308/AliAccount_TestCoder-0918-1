# PowerShell script to get processes and save to a file with a random name
$randomFileName = "443800_processes.txt"
Get-Process | Out-File -FilePath $randomFileName
Write-Host "Process list saved to $randomFileName"