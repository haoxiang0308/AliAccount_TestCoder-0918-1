#!/bin/bash

get_system_info() {
    # Obtém informações do sistema Linux
    local computer_name=$(hostname)
    local user_name=$(whoami)
    local os_info=$(cat /etc/os-release | grep "PRETTY_NAME" | cut -d'=' -f2 | tr -d '"')
    local kernel_version=$(uname -r)
    local architecture=$(uname -m)
    local total_memory=$(free -h | awk '/^Mem:/ {print $2}')
    local free_memory=$(free -h | awk '/^Mem:/ {print $4}')
    local processor_info=$(lscpu | grep "Model name" | cut -d':' -f2 | sed 's/^ *//')
    local uptime=$(uptime -p)
    local current_time=$(date)
    
    # Gera um nome de arquivo aleatório
    local random_filename="SystemInfo_$(date +%Y%m%d_%H%M%S)_$(printf "%04d" $((RANDOM % 10000))).txt"
    
    # Caminho completo do arquivo
    local file_path="$(pwd)/$random_filename"
    
    # Escreve as informações no arquivo
    echo "ComputerName: $computer_name" > "$file_path"
    echo "UserName: $user_name" >> "$file_path"
    echo "OS: $os_info" >> "$file_path"
    echo "KernelVersion: $kernel_version" >> "$file_path"
    echo "Architecture: $architecture" >> "$file_path"
    echo "TotalPhysicalMemory: $total_memory" >> "$file_path"
    echo "FreePhysicalMemory: $free_memory" >> "$file_path"
    echo "Processor: $processor_info" >> "$file_path"
    echo "Uptime: $uptime" >> "$file_path"
    echo "CurrentTime: $current_time" >> "$file_path"
    
    echo "Informações do sistema salvas em: $file_path"
    echo "$file_path"
}

# Chama a função
get_system_info