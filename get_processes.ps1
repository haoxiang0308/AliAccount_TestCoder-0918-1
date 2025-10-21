# PowerShell script to get a list of processes and save to a file with a random name

# Generate a random filename
$randomName = [System.IO.Path]::GetRandomFileName()
$fileName = "$randomName.txt"

# Get the list of processes
$processes = Get-Process

# Export the processes to the file with the random name
$processes | Out-File -FilePath $fileName

Write-Output "Process list saved to $fileName"