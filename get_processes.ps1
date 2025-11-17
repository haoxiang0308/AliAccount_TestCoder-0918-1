# PowerShell script to get list of processes and save to a file with random name

# Generate a random filename
$randomName = [System.IO.Path]::GetRandomFileName()
$fileName = $randomName + ".txt"

# Get the list of processes
$processes = Get-Process

# Export the processes to the file with random name
$processes | Out-File -FilePath $fileName

Write-Host "Process list saved to: $fileName"
Write-Host "Found $($processes.Count) processes."