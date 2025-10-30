#!/usr/bin/env python3
"""
Script Python para obter informações do sistema e salvar em um arquivo com nome aleatório.
Funciona como alternativa à função PowerShell solicitada.
"""

import platform
import psutil
import socket
import os
import datetime
import random
import string


def get_random_filename():
    """Gera um nome de arquivo aleatório"""
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    random_suffix = ''.join(random.choices(string.ascii_lowercase + string.digits, k=6))
    return f"system_info_{timestamp}_{random_suffix}.txt"


def get_system_info():
    """Obtém informações do sistema"""
    info = {
        'hostname': socket.gethostname(),
        'machine': platform.machine(),
        'node': platform.node(),
        'platform': platform.platform(),
        'processor': platform.processor(),
        'release': platform.release(),
        'system': platform.system(),
        'version': platform.version(),
        'cpu_count': psutil.cpu_count(logical=True),
        'cpu_count_physical': psutil.cpu_count(logical=False),
        'boot_time': datetime.datetime.fromtimestamp(psutil.boot_time()).strftime("%Y-%m-%d %H:%M:%S"),
        'memory_total': psutil.virtual_memory().total,
        'memory_available': psutil.virtual_memory().available,
        'memory_used': psutil.virtual_memory().used,
        'memory_percent': psutil.virtual_memory().percent,
        'disk_usage_total': psutil.disk_usage('/').total if os.name != 'nt' else psutil.disk_usage('C:\\').total,
        'disk_usage_used': psutil.disk_usage('/').used if os.name != 'nt' else psutil.disk_usage('C:\\').used,
        'disk_usage_percent': (psutil.disk_usage('/').used / psutil.disk_usage('/').total) * 100 if os.name != 'nt' else (psutil.disk_usage('C:\\').used / psutil.disk_usage('C:\\').total) * 100,
    }
    return info


def save_system_info_to_file():
    """Obtém informações do sistema e salva em um arquivo com nome aleatório"""
    system_info = get_system_info()
    filename = get_random_filename()
    
    with open(filename, 'w', encoding='utf-8') as f:
        f.write("System Information Report\n")
        f.write("=" * 50 + "\n")
        f.write(f"Generated on: {datetime.datetime.now()}\n\n")
        
        for key, value in system_info.items():
            f.write(f"{key}: {value}\n")
    
    print(f"System information saved to: {filename}")
    return filename


if __name__ == "__main__":
    save_system_info_to_file()