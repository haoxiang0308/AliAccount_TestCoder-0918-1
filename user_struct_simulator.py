import json
import random
import string

# Определяем структуру пользователя
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

# Создаем экземпляр структуры User
user = User("Alice", 30)

# Генерируем случайное имя файла
random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.json'

# Сохраняем данные пользователя в файл в формате JSON
with open(random_filename, 'w') as file:
    json.dump({'name': user.name, 'age': user.age}, file)

print(f"User data saved to file: {random_filename}")
print(f"User: name='{user.name}', age={user.age}")