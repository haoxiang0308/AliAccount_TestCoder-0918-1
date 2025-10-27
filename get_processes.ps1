# PowerShell script to get processes and save to a file with a random name
$processes = Get-Process
$randomFileName = "processes_" + (Get-Random) + ".txt"
$processes | Out-File -FilePath $randomFileName
Write-Host "Processes saved to $randomFileName"