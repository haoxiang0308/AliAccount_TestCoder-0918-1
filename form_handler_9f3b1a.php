<?php
// Обработчик формы
// Проверяем, был ли запрос методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Собираем данные из формы
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $message = $_POST['message'] ?? '';

    // Простая валидация (в реальном приложении нужна более строгая валидация)
    if (!empty($name) && !empty($email)) {
        // Здесь можно добавить логику сохранения в базу данных или отправки по email
        // Для примера, просто выводим полученные данные
        echo "<h2>Спасибо, " . htmlspecialchars($name) . "!</h2>";
        echo "<p>Ваше сообщение: " . htmlspecialchars($message) . "</p>";
        echo "<p>Мы свяжемся с вами по адресу: " . htmlspecialchars($email) . "</p>";

        // Пример сохранения в файл (опционально)
        $log_entry = date('Y-m-d H:i:s') . " - " . $name . " (" . $email . "): " . $message . "\n";
        file_put_contents('form_submissions.log', $log_entry, FILE_APPEND | LOCK_EX);
    } else {
        echo "<p style='color:red;'>Ошибка: Пожалуйста, заполните обязательные поля (Имя и Email).</p>";
    }
} else {
    // Если запрос не POST, выводим форму
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Пример формы</title>
    </head>
    <body>
        <h1>Свяжитесь с нами</h1>
        <form method="post" action="">
            <label for="name">Имя (обязательно):</label><br>
            <input type="text" id="name" name="name" required><br><br>

            <label for="email">Email (обязательно):</label><br>
            <input type="email" id="email" name="email" required><br><br>

            <label for="message">Сообщение:</label><br>
            <textarea id="message" name="message"></textarea><br><br>

            <input type="submit" value="Отправить">
        </form>
    </body>
    </html>
    <?php
}
?>