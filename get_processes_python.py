import psutil
import random
import string
import os

def generate_random_filename(extension=".txt"):
    """Generate a random filename with the specified extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return random_name + extension

def get_processes():
    """Get list of processes with their basic information"""
    processes = []
    for proc in psutil.process_iter(['pid', 'name', 'username', 'status']):
        try:
            processes.append(proc.info)
        except (psutil.NoSuchProcess, psutil.AccessDenied):
            # Handle cases where process might have terminated or access is denied
            pass
    return processes

def save_processes_to_file():
    """Get processes and save to a file with random name"""
    processes = get_processes()
    
    # Generate random filename
    random_filename = generate_random_filename(".txt")
    
    # Write processes to file
    with open(random_filename, 'w', encoding='utf-8') as f:
        f.write("Process List:\n")
        f.write(f"{'PID':<10} {'Name':<30} {'Username':<20} {'Status':<15}\n")
        f.write("-" * 80 + "\n")
        for proc in processes:
            try:
                pid = str(proc['pid']) if proc['pid'] else 'N/A'
                name = proc['name'] if proc['name'] else 'N/A'
                username = proc['username'] if proc['username'] else 'N/A'
                status = proc['status'] if proc['status'] else 'N/A'
                
                f.write(f"{pid:<10} {name:<30} {username:<20} {status:<15}\n")
            except KeyError:
                continue
    
    print(f"Process list saved to {random_filename}")
    return random_filename

if __name__ == "__main__":
    save_processes_to_file()