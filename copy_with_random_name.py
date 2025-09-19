import os
import shutil
import random
import string

def generate_random_filename(extension=".yml"):
    """Генерирует случайное имя файла с заданным расширением."""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"ansible_task_{random_chars}{extension}"

def copy_ansible_task(source_file):
    """Копирует файл задачи Ansible в новый файл с случайным именем."""
    if not os.path.exists(source_file):
        raise FileNotFoundError(f"Исходный файл {source_file} не найден.")
    
    destination_file = generate_random_filename()
    shutil.copy(source_file, destination_file)
    print(f"Задача Ansible скопирована в файл: {destination_file}")
    return destination_file

if __name__ == "__main__":
    source_file = "/workspace/ansible_copy_task.yml"
    try:
        copied_file = copy_ansible_task(source_file)
    except FileNotFoundError as e:
        print(f"Ошибка: {e}")