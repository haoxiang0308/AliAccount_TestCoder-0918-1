# PowerShell скрипт для получения списка процессов и сохранения в файл со случайным именем

# Генерация случайного имени файла
$randomFileName = "processes_" + (Get-Random -Maximum 10000) + ".txt"

# Получение списка процессов и сохранение в файл
Get-Process | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "Список процессов сохранен в файл: $randomFileName"