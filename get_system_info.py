import platform
import psutil
import socket
import datetime
import random
import os

def get_system_info():
    """Obtém informações do sistema e salva em um arquivo com nome aleatório."""
    
    # Obtém informações do sistema
    system_info = {
        'platform': platform.platform(),
        'system': platform.system(),
        'release': platform.release(),
        'version': platform.version(),
        'machine': platform.machine(),
        'processor': platform.processor(),
        'cpu_count': psutil.cpu_count(),
        'memory_total': psutil.virtual_memory().total,
        'memory_available': psutil.virtual_memory().available,
        'boot_time': datetime.datetime.fromtimestamp(psutil.boot_time()),
        'hostname': socket.gethostname(),
        'ip_address': socket.gethostbyname(socket.gethostname()) if socket.gethostname() != 'localhost' else '127.0.0.1'
    }
    
    # Gera um nome de arquivo aleatório
    random_number = random.randint(1000, 9999)
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    random_filename = f"SystemInfo_{timestamp}_{random_number}.txt"
    
    # Prepara o conteúdo do arquivo
    output_lines = [
        "=== Informações do Sistema ===",
        f"Nome do Computador: {system_info['hostname']}",
        f"Sistema Operacional: {system_info['platform']}",
        f"Sistema: {system_info['system']}",
        f"Versão: {system_info['version']}",
        f"Arquitetura: {system_info['machine']}",
        f"Processador: {system_info['processor']}",
        f"Número de CPUs: {system_info['cpu_count']}",
        f"Memória Total: {system_info['memory_total'] / (1024**3):.2f} GB",
        f"Memória Disponível: {system_info['memory_available'] / (1024**3):.2f} GB",
        f"Tempo de Inicialização: {system_info['boot_time']}",
        f"Endereço IP: {system_info['ip_address']}",
        ""
    ]
    
    # Salva as informações no arquivo
    with open(random_filename, 'w', encoding='utf-8') as f:
        f.write('\n'.join(output_lines))
    
    print(f"Informações do sistema salvas em: {random_filename}")
    
    return random_filename

# Chama a função
if __name__ == "__main__":
    get_system_info()