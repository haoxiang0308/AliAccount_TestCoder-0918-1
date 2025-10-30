function Get-SystemInfo {
    # Obtém informações do sistema
    $systemInfo = @{
        ComputerName = $env:COMPUTERNAME
        UserName = $env:USERNAME
        OS = (Get-CimInstance Win32_OperatingSystem).Caption
        OSVersion = (Get-CimInstance Win32_OperatingSystem).Version
        Architecture = (Get-CimInstance Win32_OperatingSystem).OSArchitecture
        TotalPhysicalMemory = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory
        FreePhysicalMemory = (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory
        Processor = (Get-CimInstance Win32_Processor).Name -join ', '
        TotalVisibleMemorySize = (Get-CimInstance Win32_OperatingSystem).TotalVisibleMemorySize
        LastBootUpTime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
        LocalTime = (Get-CimInstance Win32_OperatingSystem).LocalDateTime
    }

    # Gera um nome de arquivo aleatório
    $randomFileName = "SystemInfo_" + (Get-Date -Format "yyyyMMdd_HHmmss") + "_" + (Get-Random -Maximum 10000).ToString("0000") + ".txt"
    
    # Caminho completo do arquivo
    $filePath = Join-Path $PWD $randomFileName

    # Converte as informações para string e salva no arquivo
    $output = ""
    foreach ($key in $systemInfo.Keys) {
        $output += "$key`: $($systemInfo[$key])`n"
    }

    # Escreve no arquivo
    $output | Out-File -FilePath $filePath -Encoding UTF8

    Write-Host "Informações do sistema salvas em: $filePath"
    return $filePath
}

# Chama a função
Get-SystemInfo