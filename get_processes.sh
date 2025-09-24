#!/bin/bash

# Генерируем случайное число для имени файла
random_number=$RANDOM
filename="processes_$random_number.csv"

# Получаем список процессов и сохраняем в CSV-подобный формат
# Используем ps с определенными полями и добавляем заголовок
echo "PID,PPID,USER,%CPU,%MEM,COMMAND,TIME" > "$filename"
# Используем ps aux для получения списка процессов, исключая заголовок команды ps
ps aux --no-headers | awk '{print $2","$3","$1","$3","$4","$11","$9}' >> "$filename"

echo "Список процессов сохранен в файл: $filename"