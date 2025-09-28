# Получить список процессов и преобразовать в строку
$processList = Get-Process | Out-String

# Сгенерировать случайное имя файла
$randomName = [System.IO.Path]::GetRandomFileName()

# Сохранить в файл с случайным именем в текущей директории
$processList | Set-Content -Path $randomName
Write-Output "Список процессов сохранен в файл: $randomName"