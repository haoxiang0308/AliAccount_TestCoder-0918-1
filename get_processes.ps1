# Генерируем случайное имя файла
$randomFileName = "processes_" + (Get-Random -Maximum 10000) + ".csv"

# Получаем список процессов и сохраняем в CSV-файл со случайным именем
Get-Process | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Host "Список процессов сохранен в файл: $randomFileName"