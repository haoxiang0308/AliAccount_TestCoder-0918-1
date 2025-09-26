#!/bin/bash

# Проверяем, передан ли аргумент (имя файла Excel)
if [ $# -eq 0 ]; then
    echo "Ошибка: Не указан файл Excel."
    echo "Использование: $0 <имя_файла_excel>"
    exit 1
fi

input_file="$1"

# Проверяем, существует ли файл
if [ ! -f "$input_file" ]; then
    echo "Ошибка: Файл $input_file не найден."
    exit 1
fi

# Определяем директорию и имя файла без расширения
dir=$(dirname "$input_file")
filename=$(basename "$input_file" .xlsx)
extension="${input_file##*.}"

# Создаем временный файл ODS в той же директории
temp_ods_path="$dir/temp_${filename}.ods"

# Копируем файл, если он .xlsx, преобразуя в .ods
if [ "$extension" = "xlsx" ] || [ "$extension" = "xls" ]; then
    echo "Преобразование $input_file в ODS..."
    libreoffice --headless --convert-to ods --outdir "$dir" "$input_file" 2>/dev/null
    if [ ! -f "$temp_ods_path" ]; then
        echo "Ошибка: Не удалось преобразовать файл в ODS."
        exit 1
    fi
else
    echo "Ошибка: Поддерживаются только файлы .xls и .xlsx."
    exit 1
fi

# Создаем временный файл для скрипта Basic
script_file="/tmp/CalculateSum_macro.txt"
cat << 'EOF' > "$script_file"
REM  *****  BASIC  *****
Function CalculateSum(rng As Object) As Double
    CalculateSum = rng.CalculationFunction(2) ' 2 соответствует SUM в Calc
End Function
EOF

# Добавляем макрос в файл ODS
echo "Добавление макроса в $temp_ods_path..."
zip -u "$temp_ods_path" "$script_file" -j > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Ошибка: Не удалось добавить макрос в файл."
    rm -f "$temp_ods_path"
    exit 1
fi

# Переименовываем временный файл обратно в .xlsx, если исходный был .xlsx
if [ "$extension" = "xlsx" ]; then
    final_file="$dir/${filename}_with_macro.xlsx"
    mv "$temp_ods_path" "$final_file"
    echo "Макрос добавлен. Результат сохранен в $final_file"
    echo "Для вызова функции используйте LibreOffice Calc: =CalculateSum(A1:A10), где A1:A10 - диапазон ячеек."
else
    # Если исходный файл был .xls, оставляем его как .ods, так как LibreOffice Basic макросы лучше работают с ODF
    final_file="$temp_ods_path"
    echo "Макрос добавлен. Результат сохранен в $final_file"
    echo "Для вызова функции используйте LibreOffice Calc: =CalculateSum(A1:A10), где A1:A10 - диапазон ячеек."
fi

# Удаляем временный файл скрипта
rm -f "$script_file"

echo "Готово. Файл с макросом: $final_file"