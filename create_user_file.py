import random
import string
import json
from datetime import datetime

# Определяем "структуру" пользователя (аналог Rust-структуры)
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

# Создаем экземпляр пользователя
user = User("Alice", 30)

# Генерируем случайное имя файла
random_suffix = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
random_filename = f"user_data_{random_suffix}.json"

# Сохраняем данные пользователя в файл
user_data = {
    "name": user.name,
    "age": user.age
}

with open(random_filename, 'w', encoding='utf-8') as f:
    json.dump(user_data, f, ensure_ascii=False, indent=2)

print(f"User data saved to file: {random_filename}")

# Также выведем содержимое созданного файла для проверки
print("File contents:")
with open(random_filename, 'r', encoding='utf-8') as f:
    print(f.read())