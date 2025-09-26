#!/bin/bash

# Проверяем, передан ли аргумент
if [ $# -eq 0 ]; then
    echo "Ошибка: не указан файл для резервного копирования."
    echo "Использование: $0 <имя_файла>"
    exit 1
fi

# Имя файла для резервного копирования
original_file="$1"

# Проверяем, существует ли файл
if [ ! -f "$original_file" ]; then
    echo "Ошибка: файл $original_file не существует."
    exit 1
fi

# Генерируем случайное имя для резервной копии
backup_name="backup_$(basename "$original_file")_$RANDOM"

# Создаем резервную копию
cp "$original_file" "$backup_name"

# Сообщаем об успешном создании
echo "Резервная копия файла '$original_file' создана как '$backup_name'"