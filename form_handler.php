<?php
// Проверяем, была ли отправлена форма
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Собираем данные из формы
    $name = htmlspecialchars(trim($_POST['name']));
    $email = htmlspecialchars(trim($_POST['email']));
    $message = htmlspecialchars(trim($_POST['message']));
    
    // Валидация данных
    if (empty($name) || empty($email) || empty($message)) {
        echo "Пожалуйста, заполните все поля формы.";
        exit;
    }
    
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Пожалуйста, введите корректный email.";
        exit;
    }
    
    // Формируем строку для записи в файл
    $data = "Имя: " . $name . "\n";
    $data .= "Email: " . $email . "\n";
    $data .= "Сообщение: " . $message . "\n";
    $data .= "Дата: " . date("Y-m-d H:i:s") . "\n";
    $data .= "----------------------------------------\n";
    
    // Имя файла для сохранения данных
    $filename = "form_submissions.txt";
    
    // Пытаемся записать данные в файл
    if (file_put_contents($filename, $data, FILE_APPEND | LOCK_EX)) {
        echo "Спасибо! Ваши данные успешно сохранены.";
    } else {
        echo "Произошла ошибка при сохранении данных.";
    }
} else {
    // Если форма не была отправлена, перенаправляем на форму
    header("Location: form.html");
    exit;
}
?>