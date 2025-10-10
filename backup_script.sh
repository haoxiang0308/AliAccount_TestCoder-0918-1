#!/bin/bash

# Проверяем, передан ли аргумент (путь к файлу для резервного копирования)
if [ $# -ne 1 ]; then
    echo "Использование: $0 <путь_к_файлу_для_резервного_копирования>"
    exit 1
fi

SOURCE_FILE="$1"

# Проверяем, существует ли файл
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Ошибка: Файл $SOURCE_FILE не существует."
    exit 1
fi

# Генерируем случайное имя для файла резервной копии
BACKUP_NAME="backup_$(date +%s%N).bak"

# Копируем файл
cp "$SOURCE_FILE" "$BACKUP_NAME"

echo "Файл $SOURCE_FILE скопирован в $BACKUP_NAME"