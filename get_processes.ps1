# PowerShell script to get list of processes and save to a file with random name

# Generate a random filename
$randomName = [System.IO.Path]::GetRandomFileName() -replace '\.', ''
$fileName = "${randomName}.txt"

# Get the list of processes and export to the file
Get-Process | Out-File -FilePath $fileName -Encoding UTF8

Write-Output "Process list saved to $fileName"