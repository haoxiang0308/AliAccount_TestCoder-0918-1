# PowerShell Script to Get Current User Information
# This script mimics the requested functionality using available shell commands.

# Note: Direct PowerShell cmdlets like Get-ComputerInfo may not be available.
# We use standard shell commands to gather the information.

Write-Output "Current User Information:"
Write-Output "-------------------------"
Write-Output "Username: $(whoami)"
Write-Output "User ID:  $(id -u)"
Write-Output "Group ID: $(id -g)"
Write-Output "Home Directory: $HOME"