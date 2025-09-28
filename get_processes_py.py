import psutil
import csv
import random
import string

# Генерация случайного имени файла
random_filename = "processes_" + ''.join(random.choices(string.ascii_letters + string.digits, k=8)) + ".csv"

# Получение списка процессов
processes = []
for proc in psutil.process_iter(['pid', 'name', 'username', 'status']):
    try:
        # Получение информации о процессе
        proc_info = proc.info
        processes.append(proc_info)
    except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
        # Игнорирование процессов, к которым нет доступа
        pass

# Запись данных в CSV-файл
if processes:
    with open(random_filename, 'w', newline='', encoding='utf-8') as csvfile:
        fieldnames = ['pid', 'name', 'username', 'status']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

        writer.writeheader()
        for proc in processes:
            writer.writerow(proc)

    print(f"Список процессов сохранен в файл: {random_filename}")
else:
    print("Не удалось получить список процессов.")