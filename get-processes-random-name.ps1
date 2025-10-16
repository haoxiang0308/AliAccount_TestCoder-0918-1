# PowerShell script to get a list of processes and save to a file with a random name

# Generate a random file name
$randomName = "processes_" + (Get-Random -Maximum 99999) + ".txt"
$outputFile = Join-Path -Path $PWD -ChildPath $randomName

# Get the list of processes and save to the file
Get-Process | Out-File -FilePath $outputFile

Write-Output "Process list saved to: $outputFile"