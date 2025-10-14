#!/bin/bash

# Проверяем, передан ли аргумент
if [ $# -eq 0 ]; then
    echo "Ошибка: не указан файл для резервного копирования."
    echo "Использование: $0 <путь_к_файлу>"
    exit 1
fi

SOURCE_FILE="$1"

# Проверяем, существует ли файл
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Ошибка: файл $SOURCE_FILE не существует."
    exit 1
fi

# Генерируем случайное имя файла для резервной копии
BACKUP_NAME=$(mktemp --suffix=.bak)

# Копируем файл
cp "$SOURCE_FILE" "$BACKUP_NAME"

if [ $? -eq 0 ]; then
    echo "Резервная копия файла создана: $BACKUP_NAME"
else
    echo "Ошибка при создании резервной копии."
    exit 1
fi