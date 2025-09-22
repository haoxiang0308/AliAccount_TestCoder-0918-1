<?php
// Скрипт для обработки данных формы

// Проверяем, была ли отправлена форма методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Собираем данные из формы
    $name = trim($_POST["name"]);
    $email = trim($_POST["email"]);
    $message = trim($_POST["message"]);

    // Простая валидация
    if (empty($name) || empty($email) || empty($message)) {
        die("Ошибка: Все поля обязательны для заполнения.");
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("Ошибка: Неверный формат email.");
    }

    // Здесь можно добавить код для сохранения данных, например, в файл или базу данных
    // Для примера просто выведем полученные данные
    echo "<h2>Спасибо за ваше сообщение!</h2>";
    echo "<p><strong>Имя:</strong> " . htmlspecialchars($name) . "</p>";
    echo "<p><strong>Email:</strong> " . htmlspecialchars($email) . "</p>";
    echo "<p><strong>Сообщение:</strong> " . htmlspecialchars($message) . "</p>";

    // Пример сохранения в файл (в реальном приложении нужно продумать права доступа и безопасность)
    $log_data = date('Y-m-d H:i:s') . " - Имя: $name, Email: $email, Сообщение: $message" . PHP_EOL;
    file_put_contents('form_submissions.log', $log_data, FILE_APPEND | LOCK_EX);

} else {
    // Если скрипт вызван не методом POST, перенаправляем на форму
    header("Location: form.html");
    exit();
}
?>