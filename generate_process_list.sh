#!/bin/bash

# Генерируем случайное имя файла
random_filename=$(mktemp --suffix=.txt)

# Получаем список процессов и сохраняем в файл
ps aux > "$random_filename"

echo "Список процессов сохранен в файл: $random_filename"