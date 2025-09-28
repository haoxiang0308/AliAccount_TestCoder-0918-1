import random
import string

def generate_random_filename(ext='.py'):
    """Генерирует случайное имя файла с заданным расширением."""
    name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f'{name}{ext}'

def hello_world():
    """Функция, которая выводит 'Привет, мир!'."""
    print('Привет, мир!')

# Генерируем случайное имя файла
random_filename = generate_random_filename()

# Записываем определение функции и её вызов в новый файл
with open(random_filename, 'w', encoding='utf-8') as f:
    f.write('''def hello_world():
    print('Привет, мир!')

# Вызов функции
hello_world()
''')

print(f'Файл создан: {random_filename}')