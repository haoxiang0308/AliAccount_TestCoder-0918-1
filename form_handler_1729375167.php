<?php
// Проверяем, была ли форма отправлена методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Собираем все данные формы
    $formData = [];
    foreach ($_POST as $key => $value) {
        // Экранируем HTML для безопасности
        $formData[$key] = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
    }

    // Генерируем имя файла на основе имени PHP-скрипта
    $txtFileName = basename(__FILE__, '.php') . '.txt';

    // Открываем файл для записи (или создаем его)
    $file = fopen($txtFileName, 'a');
    if ($file) {
        // Записываем данные формы в файл
        fwrite($file, "=== Новые данные формы ===\n");
        foreach ($formData as $key => $value) {
            fwrite($file, "$key: $value\n");
        }
        fwrite($file, "\n");
        fclose($file);
        
        echo "Данные формы успешно сохранены в $txtFileName";
    } else {
        echo "Ошибка: не удалось открыть файл для записи.";
    }
} else {
    echo "Этот скрипт должен быть вызван методом POST.";
}
?>