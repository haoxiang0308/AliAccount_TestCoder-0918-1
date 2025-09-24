# PowerShell скрипт для получения списка процессов и сохранения в файл со случайным именем

# Генерация случайного имени файла
$randomFileName = "ProcessList_" + (Get-Random -Maximum 1000000) + ".csv"

# Получение списка процессов и экспорт в CSV файл
Get-Process | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Output "Список процессов сохранен в файл: $randomFileName"