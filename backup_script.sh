#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Использование: $0 <файл_для_резервного_копирования>"
  exit 1
fi

input_file="$1"

if [ ! -f "$input_file" ]; then
  echo "Файл $input_file не существует или не является файлом"
  exit 1
fi

# Генерация случайного имени файла
random_name=$(mktemp --suffix=.bak)

# Копирование файла
cp "$input_file" "$random_name"

echo "Создана резервная копия: $random_name"