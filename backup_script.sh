#!/bin/bash

# Проверяем, передан ли аргумент
if [ $# -ne 1 ]; then
  echo "Использование: $0 <путь_к_файлу_для_резервного_копирования>"
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
# Используем дату, время и случайное число для уникальности
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
RANDOM_SUFFIX=$RANDOM
BACKUP_NAME="${BASENAME}.backup_${TIMESTAMP}_${RANDOM_SUFFIX}"

# Создаем резервную копию
cp "$SOURCE_FILE" "$BACKUP_NAME"

echo "Резервная копия файла '$SOURCE_FILE' создана как '$BACKUP_NAME'"