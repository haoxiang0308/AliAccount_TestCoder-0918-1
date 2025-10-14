import random
import string
import os

def generate_random_filename(length=10, prefix='script_', suffix='.py'):
    letters = string.ascii_lowercase + string.digits
    random_part = ''.join(random.choice(letters) for i in range(length))
    return f'{prefix}{random_part}{suffix}'

def hello_function():
    print('Привет, мир!')

# Генерация случайного имени файла
random_filename = generate_random_filename()

# Запись функции в файл
with open(random_filename, 'w', encoding='utf-8') as f:
    f.write('def hello_function():\n')
    f.write("    print('Привет, мир!')\n")
    f.write('\n')
    f.write("if __name__ == '__main__':\n")
    f.write('    hello_function()\n')

print(f'Файл создан: {random_filename}')