<?php
// Проверяем, была ли форма отправлена методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Собираем данные из формы
    $name = htmlspecialchars(trim($_POST['name']));
    $email = htmlspecialchars(trim($_POST['email']));
    $message = htmlspecialchars(trim($_POST['message']));

    // Простая валидация
    if (empty($name) || empty($email) || empty($message)) {
        die("Ошибка: Все поля обязательны для заполнения.");
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("Ошибка: Неверный формат email.");
    }

    // Подготавливаем данные для сохранения
    $data = "Имя: $name\nEmail: $email\nСообщение: $message\n" . str_repeat("-", 40) . "\n";

    // Имя файла для сохранения данных
    $filename = "form_submissions.txt";

    // Сохраняем данные в файл
    if (file_put_contents($filename, $data, FILE_APPEND | LOCK_EX)) {
        echo "Спасибо! Ваши данные успешно сохранены.";
        // Опционально: перенаправление после успешной отправки
        // header("Location: thank_you.html");
        // exit();
    } else {
        echo "Ошибка: Не удалось сохранить данные.";
    }
} else {
    // Если скрипт вызван не методом POST, показываем форму
    echo '<form method="post" action="">
            <label for="name">Имя:</label><br>
            <input type="text" id="name" name="name" required><br><br>
            
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>
            
            <label for="message">Сообщение:</label><br>
            <textarea id="message" name="message" rows="5" required></textarea><br><br>
            
            <input type="submit" value="Отправить">
          </form>';
}
?>