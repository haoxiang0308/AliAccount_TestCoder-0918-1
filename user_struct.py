import json
import random
import string

# Определяем класс, аналогичный Rust-структуре User
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

# Создаем экземпляр класса User
user = User("Alice", 30)

# Генерируем случайное имя файла
random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.txt'

# Сохраняем данные в файл
with open(random_filename, 'w') as file:
    json.dump({'name': user.name, 'age': user.age}, file)

print(f"User data saved to file: {random_filename}")
print(f"User data: name='{user.name}', age={user.age}")