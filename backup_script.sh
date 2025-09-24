#!/bin/bash

# Проверяем, передан ли аргумент
if [ $# -eq 0 ]; then
    echo "Ошибка: Не указан файл для резервного копирования."
    echo "Использование: $0 <путь_к_файлу>"
    exit 1
fi

# Исходный файл
SOURCE_FILE="$1"

# Проверяем, существует ли файл
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Ошибка: Файл $SOURCE_FILE не существует."
    exit 1
fi

# Имя файла без пути
BASENAME=$(basename "$SOURCE_FILE")

# Генерируем случайное имя для резервной копии
# Формат: backup_<basename>_<timestamp>_<random_string>
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
RANDOM_STRING=$(openssl rand -hex 4) # 8-символьная случайная строка
BACKUP_NAME="backup_${BASENAME}_${TIMESTAMP}_${RANDOM_STRING}"

# Путь для сохранения резервной копии (в текущей директории)
BACKUP_PATH="./$BACKUP_NAME"

# Создаем резервную копию
cp "$SOURCE_FILE" "$BACKUP_PATH"

# Проверяем, успешно ли создана копия
if [ $? -eq 0 ]; then
    echo "Резервная копия файла создана: $BACKUP_PATH"
else
    echo "Ошибка при создании резервной копии."
    exit 1
fi
