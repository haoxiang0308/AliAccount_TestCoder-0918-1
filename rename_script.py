import os
import random
import string

def generate_random_filename(extension=".php"):
    """Генерирует случайное имя файла с заданным расширением."""
    # Генерируем 8 случайных символов (буквы и цифры)
    random_chars = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    return f"{random_chars}{extension}"

def rename_php_file(original_path):
    """Переименовывает PHP файл в файл со случайным именем."""
    if not os.path.exists(original_path):
        print(f"Файл {original_path} не найден.")
        return None

    # Получаем директорию оригинального файла
    directory = os.path.dirname(original_path)
    if directory == '':
        directory = '.'

    # Генерируем новое имя файла
    new_filename = generate_random_filename()
    new_path = os.path.join(directory, new_filename)

    # Проверяем, чтобы новое имя не совпадало со старым
    while os.path.exists(new_path) or new_filename == os.path.basename(original_path):
        new_filename = generate_random_filename()
        new_path = os.path.join(directory, new_filename)

    # Переименовываем файл
    try:
        os.rename(original_path, new_path)
        print(f"Файл успешно переименован в: {new_path}")
        return new_path
    except Exception as e:
        print(f"Ошибка при переименовании файла: {e}")
        return None

if __name__ == "__main__":
    # Укажите путь к вашему PHP файлу
    php_file_path = "/workspace/form_handler.php"
    
    # Переименовываем файл
    new_file_path = rename_php_file(php_file_path)