# Генерируем случайное число для имени файла
$randomNumber = Get-Random -Maximum 10000
$filename = "processes_$randomNumber.csv"

# Получаем список процессов и экспортируем в CSV
Get-Process | Export-Csv -Path $filename -NoTypeInformation

Write-Host "Список процессов сохранен в файл: $filename"