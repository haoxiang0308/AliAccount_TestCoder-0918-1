<?php
/**
 * Расширенный скрипт обработки формы с сохранением в файл с уникальным именем
 * 
 * Этот скрипт обрабатывает данные формы, валидирует их,
 * сохраняет в файл с уникальным именем и отправляет уведомление.
 */

// Функция для генерации уникального имени файла
function generateUniqueFilename($extension = '.txt') {
    return uniqid('form_data_', true) . $extension;
}

// Функция для валидации email
function validateEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL);
}

// Функция для очистки данных
function sanitizeInput($data) {
    return htmlspecialchars(strip_tags(trim($data)));
}

// Функция для логирования ошибок
function logError($message) {
    $logFile = 'error_log.txt';
    $timestamp = date("Y-m-d H:i:s");
    file_put_contents($logFile, "[{$timestamp}] {$message}\n", FILE_APPEND | LOCK_EX);
}

// Основная логика обработки формы
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Получаем и очищаем данные
    $name = sanitizeInput($_POST['name'] ?? '');
    $email = sanitizeInput($_POST['email'] ?? '');
    $message = sanitizeInput($_POST['message'] ?? '');
    
    // Валидация данных
    $errors = [];
    
    if (empty($name)) {
        $errors[] = "Имя не может быть пустым";
    }
    
    if (empty($email)) {
        $errors[] = "Email не может быть пустым";
    } elseif (!validateEmail($email)) {
        $errors[] = "Некорректный формат email";
    }
    
    if (empty($message)) {
        $errors[] = "Сообщение не может быть пустым";
    }
    
    // Если есть ошибки, выводим их
    if (!empty($errors)) {
        echo "<h2>Ошибки валидации:</h2>";
        echo "<ul>";
        foreach ($errors as $error) {
            echo "<li>" . htmlspecialchars($error) . "</li>";
        }
        echo "</ul>";
        echo '<a href="form.html">Вернуться к форме</a>';
        logError("Validation errors: " . implode(", ", $errors));
        exit;
    }
    
    // Генерируем уникальное имя файла
    $filename = generateUniqueFilename('.txt');
    
    // Формируем данные для записи
    $data = "=== Новая форма отправлена ===\n";
    $data .= "Имя: {$name}\n";
    $data .= "Email: {$email}\n";
    $data .= "Сообщение: {$message}\n";
    $data .= "IP адрес: {$_SERVER['REMOTE_ADDR']}\n";
    $data .= "User Agent: {$_SERVER['HTTP_USER_AGENT']}\n";
    $data .= "Дата и время: " . date("Y-m-d H:i:s") . "\n";
    $data .= str_repeat("=", 40) . "\n";
    
    // Сохраняем данные в файл
    if (file_put_contents($filename, $data, FILE_APPEND | LOCK_EX)) {
        echo "<h2>Спасибо!</h2>";
        echo "<p>Ваши данные успешно сохранены в файл: <strong>{$filename}</strong></p>";
        echo '<a href="form.html">Отправить еще одну форму</a>';
    } else {
        echo "<h2>Ошибка</h2>";
        echo "<p>Произошла ошибка при сохранении данных. Попробуйте еще раз.</p>";
        logError("Failed to save data to file: {$filename}");
    }
} else {
    // Если форма не была отправлена, перенаправляем на форму
    header("Location: form.html");
    exit;
}
?>