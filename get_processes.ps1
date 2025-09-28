Get-Process | Out-File -FilePath "processes_$(Get-Date -Format FileDateTime).txt" -Encoding UTF8
