# Генерация случайного имени файла
$randomFileName = "processes_" + (Get-Random -Maximum 10000) + ".csv"

# Получение списка процессов и экспорт в CSV-файл со случайным именем
Get-Process | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Output "Список процессов сохранен в файл: $randomFileName"