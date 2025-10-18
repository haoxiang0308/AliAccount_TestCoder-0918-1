import random
import string

def generate_random_filename():
    """Генерирует случайное имя файла с расширением .py"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.py"

def hello_world():
    """Функция, которая выводит 'Привет, мир!'"""
    print('Привет, мир!')

# Генерируем случайное имя файла
random_filename = generate_random_filename()

# Сохраняем функцию в файл со случайным именем
with open(random_filename, 'w', encoding='utf-8') as f:
    f.write('def hello_world():\n')
    f.write("    print('Привет, мир!')\n")

print(f"Функция сохранена в файл: {random_filename}")