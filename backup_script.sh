#!/bin/bash

# Проверяем, передан ли аргумент
if [ $# -ne 1 ]; then
  echo "Использование: $0 <файл_для_резервного_копирования>"
  exit 1
fi

# Исходный файл
SOURCE_FILE="$1"

# Проверяем, существует ли файл
if [ ! -f "$SOURCE_FILE" ]; then
  echo "Ошибка: файл $SOURCE_FILE не существует."
  exit 1
fi

# Генерируем случайное имя для резервной копии
BACKUP_FILE=$(mktemp)

# Копируем файл
cp "$SOURCE_FILE" "$BACKUP_FILE"

echo "Резервная копия файла $SOURCE_FILE создана: $BACKUP_FILE"