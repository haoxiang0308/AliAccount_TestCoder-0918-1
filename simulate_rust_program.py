import random
import string
import os
from datetime import datetime

# Определяем структуру User с полями имя и возраст
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

# Создаем экземпляр структуры User
user = User("Иван", 30)

print(f"Пользователь: {user.name}, возраст: {user.age}")

# Генерируем "случайное" имя файла на основе текущего времени
random_filename = f"user_data_{int(datetime.now().timestamp())}.txt"

# Записываем данные в файл
with open(random_filename, 'w', encoding='utf-8') as file:
    file.write(f"Имя: {user.name}\n")
    file.write(f"Возраст: {user.age}\n")

print(f"Данные пользователя сохранены в файл: {random_filename}")