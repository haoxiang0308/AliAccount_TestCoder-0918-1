function Get-SystemInfo {
    # Obtém informações do sistema
    $systemInfo = @{
        ComputerName = $env:COMPUTERNAME
        UserName = $env:USERNAME
        OS = (Get-WmiObject -Class Win32_OperatingSystem).Caption
        OSVersion = (Get-WmiObject -Class Win32_OperatingSystem).Version
        TotalPhysicalMemory = (Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory
        FreePhysicalMemory = (Get-WmiObject -Class Win32_OperatingSystem).FreePhysicalMemory
        Processor = (Get-WmiObject -Class Win32_Processor).Name
        LastBootTime = (Get-WmiObject -Class Win32_OperatingSystem).LastBootUpTime
        IpAddress = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias "Ethernet*","*Local*","Wi-Fi*" | Where-Object {$_.IPAddress -notlike "169.254.*"}).IPAddress -join ", "
    }

    # Gera um nome de arquivo aleatório
    $randomFileName = "SystemInfo_" + (Get-Date -Format "yyyyMMdd_HHmmss") + "_" + (Get-Random -Maximum 10000) + ".txt"
    
    # Converte as informações para string
    $output = "=== Informações do Sistema ===`n"
    $output += "Nome do Computador: $($systemInfo.ComputerName)`n"
    $output += "Usuário: $($systemInfo.UserName)`n"
    $output += "Sistema Operacional: $($systemInfo.OS)`n"
    $output += "Versão do SO: $($systemInfo.OSVersion)`n"
    $output += "Memória Física Total: $([math]::Round($systemInfo.TotalPhysicalMemory / 1GB, 2)) GB`n"
    $output += "Memória Física Livre: $([math]::Round($systemInfo.FreePhysicalMemory / 1MB, 2)) MB`n"
    $output += "Processador: $($systemInfo.Processor)`n"
    $output += "Última Inicialização: $([DateTime]::ParseExact($systemInfo.LastBootTime, 'yyyyMMddHHmmss.*', $null))`n"
    $output += "Endereço IP: $($systemInfo.IpAddress)`n"
    
    # Salva as informações no arquivo
    $output | Out-File -FilePath $randomFileName -Encoding UTF8
    
    Write-Host "Informações do sistema salvas em: $randomFileName"
    
    # Retorna o caminho do arquivo
    return $randomFileName
}

# Chama a função
Get-SystemInfo