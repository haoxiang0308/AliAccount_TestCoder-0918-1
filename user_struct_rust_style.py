import json
import random
import string

# Определяем класс, аналогичный Rust-структуре
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

# Создаем экземпляр пользователя
user = User("Alice", 30)

# Генерируем случайное имя файла
random_filename = "user_data_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".json"

# Сохраняем данные пользователя в файл
with open(random_filename, 'w') as f:
    json.dump({"name": user.name, "age": user.age}, f)

print(f"Данные пользователя сохранены в файл: {random_filename}")