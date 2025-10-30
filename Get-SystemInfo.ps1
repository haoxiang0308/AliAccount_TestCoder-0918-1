# Função PowerShell para obter informações do sistema e salvar em um arquivo com nome aleatório
function Get-SystemInfo {
    # Obter informações do sistema
    $systemInfo = Get-ComputerInfo
    $biosInfo = Get-WmiObject -Class Win32_BIOS
    $osInfo = Get-WmiObject -Class Win32_OperatingSystem
    $processorInfo = Get-WmiObject -Class Win32_Processor
    $memoryInfo = Get-WmiObject -Class Win32_ComputerSystem
    
    # Criar objeto com as informações relevantes
    $info = @{
        ComputerName = $systemInfo.CsName
        OSName = $systemInfo.WindowsProductName
        OSSystemDirectory = $systemInfo.OsSystemDirectory
        TotalVisibleMemorySize = $memoryInfo.TotalVisibleMemorySize
        FreePhysicalMemory = $osInfo.FreePhysicalMemory
        ProcessorName = $processorInfo.Name
        BIOSVersion = $biosInfo.SMBIOSBIOSVersion
        BIOSReleaseDate = $biosInfo.ReleaseDate
        NumberOfLogicalProcessors = $systemInfo.CsNumberOfLogicalProcessors
        WindowsVersion = $systemInfo.WindowsVersion
        TimeZone = $systemInfo.TimeZone
        TotalVirtualMemorySize = $systemInfo.OsTotalVirtualMemorySize
        FreeVirtualMemory = $systemInfo.OsFreeVirtualMemory
    }
    
    # Gerar um nome de arquivo aleatório
    $randomFileName = "SystemInfo_" + (Get-Date -Format "yyyyMMdd_HHmmss") + "_" + (Get-Random -Maximum 10000).ToString("0000") + ".txt"
    
    # Caminho completo do arquivo
    $filePath = Join-Path -Path $PWD -ChildPath $randomFileName
    
    # Converter as informações para string e salvar no arquivo
    $infoString = "System Information Report`n"
    $infoString += "=" * 50 + "`n"
    $infoString += "Generated on: $(Get-Date)`n`n"
    
    foreach ($key in $info.Keys) {
        $infoString += "$key`: $($info[$key])`n"
    }
    
    # Escrever no arquivo
    $infoString | Out-File -FilePath $filePath -Encoding UTF8
    
    Write-Host "System information saved to: $filePath"
    
    # Retornar o caminho do arquivo
    return $filePath
}

# Chamar a função
Get-SystemInfo