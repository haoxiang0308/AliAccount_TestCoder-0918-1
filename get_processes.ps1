# Сгенерировать случайное число для имени файла
$randomNumber = Get-Random
$fileName = "processes_$randomNumber.csv"

# Получить список процессов и экспортировать в CSV-файл
Get-Process | Export-Csv -Path $fileName -NoTypeInformation

Write-Host "Список процессов сохранен в файл: $fileName"