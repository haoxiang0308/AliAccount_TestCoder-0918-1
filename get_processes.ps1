# PowerShell script to get list of processes and save to a file with random name
$processes = Get-Process
$randomFileName = [System.IO.Path]::GetRandomFileName() + ".txt"
$processes | Out-File -FilePath $randomFileName
Write-Host "Process list saved to $randomFileName"