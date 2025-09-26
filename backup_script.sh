#!/bin/bash

# Проверяем, передан ли аргумент
if [ $# -ne 1 ]; then
  echo "Использование: $0 <файл_для_резервного_копирования>"
  exit 1
fi

SOURCE_FILE="$1"

# Проверяем, существует ли файл
if [ ! -f "$SOURCE_FILE" ]; then
  echo "Ошибка: Файл $SOURCE_FILE не существует."
  exit 1
fi

# Генерируем случайное имя файла для резервной копии
BACKUP_NAME="/workspace/backup_$(date +%s%N).bak"

# Создаем резервную копию
cp "$SOURCE_FILE" "$BACKUP_NAME"

if [ $? -eq 0 ]; then
  echo "Резервная копия создана: $BACKUP_NAME"
else
  echo "Ошибка при создании резервной копии."
  exit 1
fi