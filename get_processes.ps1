# PowerShell script to get process list and save to a file with random name
$processes = Get-Process
$randomFileName = "processes_" + [System.Guid]::NewGuid().ToString() + ".txt"
$processes | Out-File -FilePath $randomFileName
Write-Host "Process list saved to: $randomFileName"