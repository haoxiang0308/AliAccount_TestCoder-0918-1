<?php
// Скрипт для обработки данных формы
// Генерация случайного имени для файла лога
$random_string = bin2hex(random_bytes(8));
$log_file = "/workspace/php_forms/submission_" . $random_string . ".log";

// Проверка, была ли форма отправлена методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Получение данных из формы
    $name = htmlspecialchars(trim($_POST['name'] ?? ''));
    $email = htmlspecialchars(trim($_POST['email'] ?? ''));
    $message = htmlspecialchars(trim($_POST['message'] ?? ''));

    // Простая валидация
    if (empty($name) || empty($email) || empty($message)) {
        echo "Ошибка: Все поля обязательны для заполнения.";
        exit;
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Ошибка: Неверный формат email.";
        exit;
    }

    // Подготовка данных для записи
    $data = "Имя: " . $name . "\n";
    $data .= "Email: " . $email . "\n";
    $data .= "Сообщение: " . $message . "\n";
    $data .= "Дата: " . date('Y-m-d H:i:s') . "\n";
    $data .= str_repeat("-", 40) . "\n";

    // Запись данных в файл
    if (file_put_contents($log_file, $data, FILE_APPEND | LOCK_EX)) {
        echo "Спасибо! Ваши данные успешно сохранены в файл: " . basename($log_file);
    } else {
        echo "Ошибка: Не удалось сохранить данные.";
    }
} else {
    // Если скрипт вызван не методом POST, показываем форму
    echo '
    <!DOCTYPE html>
    <html>
    <head>
        <title>Форма обратной связи</title>
        <meta charset="UTF-8">
    </head>
    <body>
        <h2>Форма обратной связи</h2>
        <form method="post" action="">
            <label for="name">Имя:</label><br>
            <input type="text" id="name" name="name" required><br><br>
            
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>
            
            <label for="message">Сообщение:</label><br>
            <textarea id="message" name="message" rows="5" cols="40" required></textarea><br><br>
            
            <input type="submit" value="Отправить">
        </form>
    </body>
    </html>
    ';
}
?>