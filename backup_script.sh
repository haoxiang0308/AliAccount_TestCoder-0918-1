#!/bin/bash

# Функция для создания резервной копии файла с случайным именем
create_backup() {
    local source_file="$1"
    
    # Проверяем, существует ли файл
    if [[ ! -f "$source_file" ]]; then
        echo "Ошибка: Файл $source_file не существует."
        exit 1
    fi
    
    # Генерируем случайное имя для резервной копии
    # Проверяем, доступна ли утилита uuidgen
    if command -v uuidgen &> /dev/null; then
        random_name=$(uuidgen)
    else
        # Альтернативный метод: используем дату и время с добавлением случайного числа
        random_name=$(date +%s%N)$(shuf -i 1000-9999 -n 1)
    fi
    
    # Получаем расширение исходного файла
    extension="${source_file##*.}"
    
    # Если файл не имеет расширения, устанавливаем пустое
    if [[ "$extension" == "$source_file" ]]; then
        extension=""
    else
        extension=".$extension"
    fi
    
    # Создаем имя файла для резервной копии
    backup_filename="$random_name$extension"
    
    # Создаем резервную копию
    cp "$source_file" "$backup_filename"
    
    echo "Резервная копия файла создана: $backup_filename"
}

# Проверяем, передан ли аргумент
if [[ $# -ne 1 ]]; then
    echo "Использование: $0 <путь_к_файлу_для_резервного_копирования>"
    exit 1
fi

# Вызываем функцию для создания резервной копии
create_backup "$1"