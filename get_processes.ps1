# PowerShell script to get list of processes and save to a file with random name

# Generate a random filename
$randomFileName = [System.IO.Path]::GetRandomFileName() + ".txt"

# Get the list of processes and export to the randomly named file
Get-Process | Out-File -FilePath $randomFileName

Write-Output "Process list saved to $randomFileName"