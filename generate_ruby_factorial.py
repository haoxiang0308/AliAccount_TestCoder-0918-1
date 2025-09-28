import random
import string

def generate_random_filename(ext='.rb'):
    """Генерирует случайное имя файла с заданным расширением."""
    name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{name}{ext}"

def create_ruby_factorial_file():
    """Создает файл с Ruby-методом для вычисления факториала."""
    filename = generate_random_filename()
    ruby_code = '''def factorial(n)
  (1..n).reduce(1, :*)
end

# Пример использования:
# puts factorial(5)  # Выведет: 120
'''
    with open(filename, 'w') as f:
        f.write(ruby_code)
    print(f"Ruby-метод факториала сохранен в файл: {filename}")

if __name__ == "__main__":
    create_ruby_factorial_file()